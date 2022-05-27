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

			$array = sumar_divisa($divisas, $operaciones, $ent_sal, $cuentas, $cierre);

			//calculo de los 5 ultimos cierres
			$index = 0;
			$cierres = [];
			if(count($hay_datos) > 0){
				$row = array_column($hay_datos, 'fec_cierre'); //primer registro 
				$row[0]; //primera fecha del cierre insertado para detener el while
				do {
					$d = date("Y-m-d", strtotime("-$index day", time()));
					$h = date("Y-m-d", strtotime("-$index day", time()));
					$cierreDay = $this->cierre_model->getall($d, $h);
					
					if($cierreDay){;
						array_push($cierres, $cierreDay);
					}

					$index++;
					
				} while ($row[0] != $d && count($cierres) <= 5);
			}
		
			$ope_cotizacion = operaciones_diarias($divisas, $operaciones, $ent_sal);
			
			if(!$cierres){
				$cierres = 0;
			}

			$suma_gastos_compra = 0; 
			$porcentaje_compra_anterior = 0;
			$porcentaje_compra = 0;
			$peso_anterior = 0; //peso del valor porcentual
			$peso = 0; //peso del valor porcentual
			$index = 0;
			$cotizacion = 0;
			$cot = 0;

			foreach ($array as $arra){
				foreach ($divisas as $key) {
					
					if ($arra['caja'] == 0) {
						continue;
					} 
					
					
					if (!$this->cierre_model->get_check(date("Y-m-d"), $arra['codigo'])) {
						
						foreach ($cierres as $cie){
						
						
							if($cie[$index]->cod_divisa_cierre === $arra['codigo']){
								
								//formula calcular cotizacion
								//cantidad_cierre_anterior * 100 / cantidad _total;
								
								$porcentaje_compra_anterior = ($cie[$index]->can_cierre * 100) / $arra['caja'];
								$peso_anterior = $porcentaje_compra_anterior * $cie[$index]->cot_cierre;
								
								foreach ($ope_cotizacion as $arr){
								
							
									if ( $arr['compras'] == 0){
									continue;
									} 
								
									if($arr['codigo'] == $arra["codigo"]){
									
										$cotizacion = str_pad(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
										$porcentaje_compra = ($arr['compras'] * 100) / $arra['caja'];
										$peso = $cotizacion * $porcentaje_compra;
										
										$cot =  ($peso_anterior + $peso) / 100;
										
										//verificamos si ya se hizo el cierre del dia
										if($cie[$index]->fec_cierre == date('Y-m-d')){
											$cot = $cie[$index]->cot_cierre;
										}
								
									}
								}
							
							}
						
							//si no hay compras en el dia y la cotizacion es 0 se iguala al cierre anterior
							if(!$cot){
								$cot = $cie[$index]->cot_cierre;	
							}

							//si la divisa es soles igualamos a 1 la cotizacion
							if($arra['codigo'] == 'PEN'){
								$cot = 1;
							} 

							$index++;
						}

						//si no hay cierre anterior(primer dia)
							
						if($cierres === 0){ 
								
							$cot = $key->com_divisa;
							foreach ($ope_cotizacion as $arr){
								
								if ( $arr['compras'] == 0){
									continue;
								} 
								
							
								if($arr['codigo'] == $arra["codigo"] && $arra["cotizacion"] > 0){
									$cot = str_pad(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
								}
								
							}
							
						}
						
						if($arra['codigo'] == 'PEN'){
							$cot = 1;
						} 
					
						$data = array(
							'cod_divisa_cierre' => $arra['codigo'],
							'nom_divisa_cierre' => $arra['nombre'],
							'cot_cierre' => $cot,
							'can_cierre' => $arra["caja"],
							'fec_cierre' => date("Y-m-d"),
						);
								
						$datos = array(
							'can_ganancia' => $this->ganancia(), 
							'fec_ganancia' => date("Y-m-d"),
						);

						if (!$this->check_ganancia()) {

							$this->ganancia_model->save($datos);

						}
						
						$this->cierre_model->save($data);


					}

				}			 
				
				
			}

			
					
			// 		}else{

			// 			// echo "<script>cierre_ejecutado();</script>";
	
			// 		}
	
			// 	}
				
			// }
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
