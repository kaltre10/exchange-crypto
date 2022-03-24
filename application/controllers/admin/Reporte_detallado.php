<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reporte_detallado extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->library('session');
		$this->load->model(array('operaciones_model'));
	}

	public function index() {
		if ($this->session->userdata('isLogged') && $this->session->userdata('rango') == 0
		|| $this->session->userdata('rango') == 1) {

		if ($this->input->post('desde') && $this->input->post('hasta')) {
			$desde = $this->input->post('desde') . " 00:00:00";//ajustando la fecha para que tome todo el dia
			$hasta = $this->input->post('hasta') . " 23:59:59";//ajustando la fecha para que tome todo el dia

			$tipo = $this->input->post('tipo');
			$mayor = $this->input->post('mayor');
			$menor = $this->input->post('menor');

			if ($tipo == ""){$tipo = NULL;}
			if($mayor == ""){$mayor = NULL;}
			if($menor == ""){$menor = NULL;}

		}else{
			$desde = date("Y-m-d") . " 00:00:00";//ajustando la fecha para que tome todo el dia
			$hasta = date("Y-m-d") . " 23:59:59";//ajustando la fecha para que tome todo el dia
			$tipo = NULL;
			$mayor = NULL;
			$menor = NULL;
		}

			$data = array(
				'header' => $this->load->view('admin/header','',TRUE),
				'footer' => $this->load->view('admin/footer','',TRUE),
				'nav' => $this->load->view('admin/nav','',TRUE),
				'operaciones' => $this->operaciones_model->getall($desde, $hasta, $tipo, $mayor, $menor)
			);

			$this->load->view('admin/reporte_detallado', $data);
		}else{
			redirect(base_url('login'));
		}
		
	}

	public function anular($id) {
		if ($this->session->userdata('isLogged') && $this->session->userdata('rango') == 0) {

			$this->operaciones_model->anular($id);
			redirect(base_url('admin/Reporte_detallado'));
			
		}else{
			redirect(base_url('login'));
		}
		
	}

}
