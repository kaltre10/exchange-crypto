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
			// $ent_sal = 0;
			$operaciones = $this->operaciones_model->getall($desde, $hasta);
			$divisas = $this->divisas_model->getall();
			$cuentas = $this->cuentas_model->getall();

			//reporte de divisas para calcular y guardar la cotizacion
			// $array = operaciones_diarias($divisas, $operaciones, $ent_sal);
			// $suma_gastos_compra = 0; 
			// $cotizacion = 0;

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
			}
			$ganancia = sumar_divisa($divisas, $operaciones, $ent_sal, $cuentas, $cierre);
			
			// 	foreach ($ganancia as $key) {

			// 		//verificamos el promedio para la cotizacion del dia
			// 		$cotizacion = 0;
			// 		foreach ($array as $arr){
						
			// 			if ( $arr['compras'] == 0 && $arr['ventas'] == 0 ){
			// 			continue;
			// 			} 
						
			// 			if($arr['codigo'] == $key["codigo"]){
						
			// 				$suma_gastos_compra = $suma_gastos_compra + $arr['gastos_compra'];
			// 				if($arr['gastos_compra']){
			// 					$cotizacion = number_format(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
			// 				} 
			// 			}
						
			// 		}
				
			// 		if ($key['codigo'] == 'PEN' ) {
			// 			$suma = $suma + $key['caja']; 
			// 		}
			// 		if ($key['codigo'] != 'PEN') {
			// 			$suma = $suma + $key['caja'] * $cotizacion; 
			// 		}
			// 	}
			// }

			//calculo de los 5 ultimos cierres
		$index = 0;
		$cierres = [];
		if(count($hay_datos) > 0){
			$row = array_column($hay_datos, 'fec_cierre'); //primer registro 
			//$row[0]; //primera fecha del cierre insertado para detener el while
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
		// var_dump($cierres);
		$ope_cotizacion = operaciones_diarias($divisas, $operaciones, $ent_sal);

		if(!$cierres){
			$cierres = 0;
		}

		$suma = 0;
		$suma_gastos_compra = 0; 
		$porcentaje_compra_anterior = 0;
		$porcentaje_compra = 0;
		$peso_anterior = 0; //peso del valor porcentual
		$peso = 0; //peso del valor porcentual
		$index = 0;
		$cotizacion = 0;
		$cot = 0;
		$divisas = $this->divisas_model->getall();
	
		foreach ($ganancia as $key){
			
			if ($key['caja'] == 0) {
				continue;
			}

			foreach ($cierres as $cie){
				

				if($cie[$index]->cod_divisa_cierre === $key["codigo"]){
					
				  foreach ($ope_cotizacion as $arr){

					//asignamos la cotizacion del cierre anterior 
					$cot = $cie[$index]->cot_cierre;

					  if ( $arr['compras'] == 0){
						continue;
					  } 
					  if($arr['codigo'] == $key["codigo"]){

						//formula calcular cotizacion
						//cantidad_cierre_anterior * 100 / cantidad _total;
						$porcentaje_compra_anterior = ($cie[$index]->can_cierre * 100) / ($key['caja'] + $arr['ventas']);
						$peso_anterior = $porcentaje_compra_anterior * $cie[$index]->cot_cierre;
						
						$cotizacion = str_pad(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
						$porcentaje_compra = ($arr['compras'] * 100) / ($key['caja'] + $arr['ventas']);
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
				$index++;
			  }
	  
			 
			  //si la divisa es soles igualamos a 1 la cotizacion
			  if($key['codigo'] === 'PEN'){
				$cot = 1;
			  } 
	  
			 //si no hay cierre anterior(primer dia)
			if($cierres === 0){
			  $cot = $key["cotizacion"];
			  foreach ($ope_cotizacion as $arr){
		
				if ( $arr['compras'] == 0){

				  continue;
				} 
			
				if($arr['codigo'] == $key["codigo"] && $key["cotizacion"] > 0){
				
				  $cot = str_pad(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
				}
			  }

			}
			
			if ($key['codigo'] == 'PEN' ) {
				$suma = $suma + $key['caja']; 
			}
			if ($key['codigo'] != 'PEN') {
				$suma = $suma + $key['caja'] * $cot; 
			}
			
			//restamos las entradas a la caja para no sumarlo a la ganancia
			foreach($ent_sal as $ent){
				if($ent->cod_divisa == $key['codigo'] && $ent->tip_ent_sal == 'Entrada'){
					if ($ent->cod_divisa == 'PEN' ) {
						$suma = $suma - $ent->can_ent_sal; 
					}
					if ($ent->cod_divisa != 'PEN') {
						$suma = $suma - ($ent->can_ent_sal * $cot); 
					}
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
			return str_pad(round($ganancia, 2), 2);
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