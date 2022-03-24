<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Operaciones extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->library('session');
		$this->load->model(array('divisas_model', 'clientes_model', 'operaciones_model', 'ganancia_model'));
	}

	public function index() {
		if ($this->session->userdata('isLogged') && $this->session->userdata('rango') == 0
		|| $this->session->userdata('rango') == 1) {

			$data = array(
				'divisas' => $this->divisas_model->getall(),
				'clientes' => $this->clientes_model->getall(),
				'header' => $this->load->view('admin/header','',TRUE),
				'footer' => $this->load->view('admin/footer','',TRUE),
				'nav' => $this->load->view('admin/nav','',TRUE)
			);

			$this->load->view('admin/operaciones', $data);
		}else{
			redirect(base_url('login'));
		}
		
	}

	public function get_divisas() {
		if ($this->session->userdata('isLogged') && $this->session->userdata('rango') == 0
			|| $this->session->userdata('rango') == 1) {

			$divisas = $this->divisas_model->getall();
			echo json_encode($divisas);

		}else{
			redirect(base_url('login'));
		}
		
	}

	public function save_operacion() {
		if ($this->session->userdata('isLogged') && $this->session->userdata('rango') == 0
			|| $this->session->userdata('rango') == 1) {

			if (!$this->check_ganancia()) {

				$data = serialize($this->input->raw_input_stream);
	
				$data = explode('"', $data);

				//ajuste monto
				$monto = explode(':', $data[3]);
				$monto = explode(",", $monto[1]);
				$monto = $monto[0];

				//ajuste cotizacion
				$cotizacion = explode(':', $data[5]);
				$cotizacion = explode(",", $cotizacion[1]);
				$cotizacion = $cotizacion[0];

				//ajuste cotizacion
				$monto_recibe = explode(':', $data[7]);
				$monto_recibe = explode(",", $monto_recibe[1]);
				$monto_recibe = $monto_recibe[0];

				if(!$data[26] != 0){
					$newData = array(
						'id_usuario' => $this->session->userdata('id'), 
						'tip_operacion' => $data[10], 
						'mon_operacion' => $monto, 
						'div_operacion' => $data[14], 
						'cot_operacion' => $cotizacion, 
						'rec_operacion' => $monto_recibe, 
						'mon_rec_operacion' => $data[18], 
						'cli_operacion' => $data[26], 
					);
				}else{
					$newData = array(
						'id_usuario' => $this->session->userdata('id'), 
						'tip_operacion' => $data[10], 
						'mon_operacion' => $monto, 
						'div_operacion' => $data[14], 
						'cot_operacion' => $cotizacion, 
						'rec_operacion' => $monto_recibe, 
						'mon_rec_operacion' => $data[18], 
						'cli_operacion' => $data[30], 
					);
				}
				// echo json_encode($data);
				$this->operaciones_model->save($newData);
				// redirect('admin/Operaciones');

			}else{
				// echo "<button onclick='modal();'>modal</button>";
				redirect('admin/Operaciones?err');
			}
			//retornamos el id insertado
			echo json_encode($this->db->insert_id());
		}else{
			redirect(base_url('login'));
		}
		
	}

	public function update_operacion(){
		$data = serialize($this->input->raw_input_stream);
		$queryData = explode('"', $data);
		$this->operaciones_model->update($queryData[1]);
		// echo json_encode($queryData[1]);
	}

	public function check_ganancia(){
		$fecha = date("Y-m-d");
		$check = $this->ganancia_model->get_check($fecha);
		return $check;
	}

	public function check_operacion_id(){
		$data = serialize($this->input->raw_input_stream);
		$id = explode('"', $data);
		$query = $this->operaciones_model->get_operacion($id[1]);
		echo json_encode($query[0]);
	}

}
