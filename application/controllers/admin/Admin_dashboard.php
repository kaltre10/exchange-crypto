<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_dashboard extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model(array('operaciones_model', 'ent_sal_model', 'divisas_model', 'cierre_model', 'cuentas_model', 'ganancia_model'));
		$this->load->library('session');
		$this->load->helper(array('reporte/divisas', 'reporte/fecha_cierre', 'gastos_operaciones', 'reporte/operaciones'));
	}

	public function index() {
		if ($this->session->userdata('isLogged') && $this->session->userdata('rango') == 0 
			|| $this->session->userdata('rango') == 1) {

			$gastos = $this->gastos();
			$data = array(
				'num_operaciones' =>  $this->operaciones_model->get_n_operaciones(date("Y-m-d 00:00:00"), date("Y-m-d 23:59:59")),
				'gastos' => $gastos['suma_gastos'], //LLAMAMOS AL METODO
				'header' => $this->load->view('admin/header','',TRUE),
				'ganancia' => $this->ganancia(),
				'ganancias_chart' => $this->ganancias_chart(),
				'dias_chart' => $this->dias_chart(),
				'footer' => $this->load->view('admin/footer','',TRUE),
				'nav' => $this->load->view('admin/nav','',TRUE)
			);

			$this->load->view('admin/dashboard', $data);
		}else{
			redirect(base_url('login'));
		}
		
	}

	public function gastos(){
		$divisas = $this->divisas_model->getall();
		//CONSULTA DB DE LAS ENTRADAS Y SALIDAS DEL DIA
		$gastos = $this->ent_sal_model->getall(date("Y-m-d 00:00:00"), date("Y-m-d 23:59:59"));
		$suma_gastos = 0;
		$suma = 0;
        foreach ($gastos as $gasto) {
        	if ($gasto->sta_ent_sal == 1 && $gasto->tip_ent_sal == "Salida" && $gasto->cod_divisa == "PEN") {
        	  	$suma_gastos = $suma_gastos + $gasto->can_ent_sal; 
        	}  
        	if ($gasto->cod_divisa != "PEN" && $gasto->sta_ent_sal == 1 && $gasto->tip_ent_sal == "Salida") {
        		foreach ($divisas as $divisa) {

        			if ($divisa->cod_divisa == $gasto->cod_divisa) {
        				$suma_gastos = $suma_gastos + ($gasto->can_ent_sal * $divisa->com_divisa);
        			}
        			
        		}

        	}
        }
        $datos = array(
        			'suma_gastos' => $suma_gastos,
        		);
        if ($datos) {
			return $datos;
		}else{
			$datos = 0;
			return $datos;
		}
	}

	public function get_cierre(){
			//CALCULAMOS DIA ANTERIOR QUE TENGA REGISTROS DE CIERRE
			$d = date("Y-m-d 00:00:00", strtotime('-1 day', time()));
			$h = date("Y-m-d 23:59:59", strtotime('-1 day', time()));
			$cierre = $this->cierre_model->getall($d, $h);	
			$i = 1;
			//Verificamos si existe datos en la BD tabla cierre
			$hay_datos = $this->cierre_model->get();
			$suma_total = 0;

			if (!$cierre) {
	
				while (!$cierre && count($hay_datos) > 0 && $hay_datos[0]->fec_cierre != date('Y-m-d') ) {

					$d = date("Y-m-d 00:00:00", strtotime("-$i day", time()));
					$h = date("Y-m-d 23:59:59", strtotime("-1 day", time()));

					$cierre = $this->cierre_model->getall($d, $h);
			
					$i++;
					// // $hay_datos[0]->fec_cierre
					// var_dump(date('Y-m-d'));
					// exit;
				}
				
				$suma = 0;
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
		$cierre = $this->get_cierre();
		$reporte_dia = $this->get_reporte();
		if ($cierre > $reporte_dia) {
			$ganancia = $cierre - $reporte_dia;
		}else{
			$ganancia = $reporte_dia - $cierre;
		}
		
		if ($ganancia) {
			return $ganancia;
		}else{
			$ganancia = 0;
			return $ganancia;
		}

	}

	public function ganancias_chart(){
		$ganancias = $this->ganancia_model->getall(); 
		$ganancias_array = [];
		foreach ($ganancias as $g) {
			$ganancia = round($g->can_ganancia, 2);
			array_push($ganancias_array, $ganancia);
		}
		$ganancias_array = array_reverse($ganancias_array);
        return json_encode($ganancias_array);
	}

	public function dias_chart(){
		$ganancias = $this->ganancia_model->getall(); 
		$dias_array = [];
		foreach ($ganancias as $g) {
			$dia = $g->fec_ganancia;
			array_push($dias_array, $dia);
		}
		$dias_array = array_reverse($dias_array);
        return json_encode($dias_array);
	}

}