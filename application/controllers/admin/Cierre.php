<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cierre extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->library('session');
		$this->load->model(array('operaciones_model', 'divisas_model', 'ent_sal_model', 'cierre_model', 'cuentas_model', 'ganancia_model'));
		$this->load->helper(array('reporte/divisas', 'reporte/operaciones'));
	}

	public function save_cierre() {

		if ($this->session->userdata('isLogged') && $this->session->userdata('rango') == 0) {

			$desde = date("Y-m-d") . " 00:00:00";//ajustando la fecha para que tome todo el dia
			$hasta = date("Y-m-d") . " 23:59:59";//ajustando la fecha para que tome todo el dia
		
			$ent_sal = $this->ent_sal_model->getall($desde, $hasta);
			$operaciones = $this->operaciones_model->getall($desde, $hasta);
			$divisas = $this->divisas_model->getall();
			$cuentas = $this->cuentas_model->getall();

			//reporte de divisas para calcular y guardar la cotizacion
			$array = operaciones_diarias($divisas, $operaciones, $ent_sal);
			$suma_gastos_compra = 0; 
			$cotizacion = 0;

			//DIA ANTERIOR
			$d = date("Y-m-d 00:00:00", strtotime('-1 day', time()));
			$h = date("Y-m-d 23:59:59", strtotime('-1 day', time()));
			$cierre = $this->cierre_model->getall($d, $h);
			$i = 1;
			$hay_datos = $this->cierre_model->get();
			
			if (!$cierre) {
				while (!$cierre && count($hay_datos) > 0 && $hay_datos[0]->fec_cierre != date('Y-m-d')) {
					$d = date("Y-m-d 00:00:00", strtotime("-$i day", time()));
					$h = date("Y-m-d 23:59:59", strtotime("-1 day", time()));
					$cierre = $this->cierre_model->getall($d, $h);
					$i++;	
				}
			}
	
			$caja = sumar_divisa($divisas, $operaciones, $ent_sal, $cuentas, $cierre);

			$i = 0;

			foreach ($caja as $key) {
		
				$fecha = date("Y-m-d");
				
				if ($key["caja"] != 0) {
					
					//VERIFICAMOS REGISTROS DUPLICADOS CON FECHA Y CODIGO DIVISA EN LA TABLA CIERRE
					if (!$this->cierre_model->get_check($fecha, $key["codigo"])) {

						//verificamos el promedio para la cotizacion del dia
						$cotizacion = 0;
						foreach ($array as $arr){
							if ( $arr['compras'] == 0 && $arr['ventas'] == 0 ){
							continue;
							} 
							if($arr['codigo'] == $key["codigo"]){
								$suma_gastos_compra = $suma_gastos_compra + $arr['gastos_compra'];
								if($arr['gastos_compra']){
									$cotizacion = number_format(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
								} 
							}
						}

						//si la divisa es soles igualamos a 1 la cotizacion
						if($key['codigo'] === 'PEN'){
							$cotizacion = 1;
						}

						//si la cotizacion es 0 o no se ha registrado compras de la divisa 
						//se iguala la cotizacion al tipo de cambio para calcular el valor en soles
						if($cotizacion == 0){
							$cotizacion = $key['cotizacion'];
						}

						$data = array(
							'cod_divisa_cierre' => $key["codigo"],
							'nom_divisa_cierre' => $key["nombre"],
							'cot_cierre' => $cotizacion,
							'can_cierre' => $key["caja"],
							'fec_cierre' => $fecha,
						);

						
						$datos = array(
							'can_ganancia' => $this->ganancia(), 
							'fec_ganancia' => $fecha,
						);
 

	
						if (!$this->check_ganancia()) {

							$this->ganancia_model->save($datos);

						}
						
						$this->cierre_model->save($data);
					
					}else{

						// echo "<script>cierre_ejecutado();</script>";
	
					}
	
				}
				
			}
		redirect(base_url('admin/Admin_dashboard?err'));
			
		}else{
			redirect(base_url('login'));
		}
		
	}

	public function get_cierre(){
	
			//CALCULAMOS DIA ANTERIOR QUE TENGA REGISTROS DE CIERRE
			$d = date("Y-m-d 00:00:00", strtotime('-1 day', time()));
			$h = date("Y-m-d 23:59:59", strtotime('-1 day', time()));
			$cierre = $this->cierre_model->getall($d, $h);	
			$i = 1;
			$suma_total = 0;
			$suma = 0;
			$hay_datos = $this->cierre_model->get();
			if (!$cierre) {
			while (!$cierre && count($hay_datos) > 0 && $hay_datos[0]->fec_cierre != date('Y-m-d')) {
					$d = date("Y-m-d 00:00:00", strtotime("-$i day", time()));
					$h = date("Y-m-d 23:59:59", strtotime("-1 day", time()));
					$cierre = $this->cierre_model->getall($d, $h);
					$i++;	
				}
			
			foreach ($cierre as $key) {
				if ($key->cod_divisa_cierre == 'PEN') {
					$suma_total = $suma_total + $key->can_cierre;
				}
				if ($key->cod_divisa_cierre != 'PEN') {
					$divisas = $this->divisas_model->getall();
					foreach ($divisas as $divisa) {
						if ($divisa->cod_divisa == $key->cod_divisa_cierre) {
							$suma = $key->can_cierre * $key->cot_cierre;
						}	
					}
					$suma_total = $suma_total + $suma;
				}
			}

		}
		return $suma_total;
	}

	public function get_reporte(){
		
			$desde = date("Y-m-d") . " 00:00:00";//ajustando la fecha para que tome todo el dia
			$hasta = date("Y-m-d") . " 23:59:59";//ajustando la fecha para que tome todo el dia
		
			$ent_sal = $this->ent_sal_model->getall($desde, $hasta);
			$ent_sal = 0;
			$operaciones = $this->operaciones_model->getall($desde, $hasta);
			$divisas = $this->divisas_model->getall();
			$cuentas = $this->cuentas_model->getall();

			//reporte de divisas para calcular y guardar la cotizacion
			$array = operaciones_diarias($divisas, $operaciones, $ent_sal);
			$suma_gastos_compra = 0; 
			$cotizacion = 0;

			//CALCULAMOS DIA ANTERIOR QUE TENGA REGISTROS DE CIERRE
			$d = date("Y-m-d 00:00:00", strtotime('-1 day', time()));
			$h = date("Y-m-d 23:59:59", strtotime('-1 day', time()));
			$cierre = $this->cierre_model->getall($d, $h);	
			$i = 1;
			$suma = 0;

			$hay_datos = $this->cierre_model->get();
			if (!$cierre) {
				while (!$cierre && count($hay_datos) > 0 && $hay_datos[0]->fec_cierre != date('Y-m-d')) {
					$d = date("Y-m-d 00:00:00", strtotime("-$i day", time()));
					$h = date("Y-m-d 23:59:59", strtotime("-1 day", time()));
					$cierre = $this->cierre_model->getall($d, $h);
					$i++;	
				}
				$ganancia = sumar_divisa($divisas, $operaciones, $ent_sal, $cuentas, $cierre);
				
				foreach ($ganancia as $key) {

					//verificamos el promedio para la cotizacion del dia
					$cotizacion = 0;
					foreach ($array as $arr){
						if ( $arr['compras'] == 0 && $arr['ventas'] == 0 ){
						continue;
						} 
						if($arr['codigo'] == $key["codigo"]){
							$suma_gastos_compra = $suma_gastos_compra + $arr['gastos_compra'];
							if($arr['gastos_compra']){
								$cotizacion = number_format(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
							} 
						}
					}
					
					if ($key['codigo'] == 'PEN' ) {
						$suma = $suma + $key['caja']; 
					}
					if ($key['codigo'] != 'PEN') {
						$suma = $suma + $key['caja'] * $cotizacion; 
					}
				}
			}
		return $suma;
	}

	public function ganancia(){
		$reporte_dia = $this->get_reporte();
		$cierre = $this->get_cierre();
		$ganancia = $reporte_dia - $cierre;
		$ganancia = round($ganancia, 2);
		return $ganancia;
	}

	public function check_ganancia(){
		$fecha = date("Y-m-d");
		$check = $this->ganancia_model->get_check($fecha);
		return $check;
	}

	public function anular_cierre(){
		$fecha = date("Y-m-d");
		$this->cierre_model->anular($fecha);
		$this->ganancia_model->anular($fecha);
		redirect(base_url('admin/Admin_dashboard'));
	}

}
