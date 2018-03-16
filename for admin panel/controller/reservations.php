<?php
class ControllerCatalogReservations extends Controller {
	private $error = array();



	public function index() {
        $this->load->language('catalog/reservations');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/reservations');


        $this->getList();
	}

	protected function getList() {


		$results = $this->model_catalog_reservations->getReservations();
//		$roomName = $this->model_catalog_reservations->getRoomName($result['room_id']);
        $data['token'] = $this->session->data['token'];
		foreach ($results as $result) {
            $roomName = $this->model_catalog_reservations->getRoomName($result['room_id']);
			$data['reservations'][] = array(
				'id'           => $result['id'],
				'order_date'           => $result['order_date'],
				'model'           => !empty($roomName['model']) ? $roomName['model'] : '',
				'room_id'           => !empty($roomName['name']) ? $roomName['name'] : $result['room_id'],
				'res_count_places'  => $result['res_count_places'],
				'date_in'        => date("d.m.Y", strtotime($result['date_in'])),
				'date_out'        => date("d.m.Y", strtotime($result['date_out'])),
				'time_start'        => $result['time_start'],
				'time_end'        => $result['time_end'],
				'name'        => $result['name'],
				'phone'        => $result['phone'],
				'email'        => $result['email'],
				'status'        => $result['status'],
                'lang'        => $result['lang']
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/reservations', $data));
	}

	public function confirm(){
        $this->load->language('catalog/reservations');

	    $name = $_POST['name'];
	    $lang = $_POST['lang'];
	    $id = $_POST['id'];
	    $email_to = $_POST['mail'];
	    $date_in = $_POST['date_in'];
	    $time_in = $_POST['time_in'];
	    $date_out = $_POST['date_out'];
	    $time_out = $_POST['time_out'];
	    $get_message = $this->language->get('confirm_message_'.$lang);
	    $message = sprintf($get_message, $name, $id, $email_to, $date_in, $date_out, $time_in, $time_out);
        $confirmation = $this->language->get('confirm_'.$lang);


        $mail = new Mail();

        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->username = $this->config->get('config_mail_smtp_username');
        $mail->password = $this->config->get('config_mail_smtp_password');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
        $mail->port = $this->config->get('config_mail_smtp_port');
        $mail->timeout = $this->config->get('config_mail_smtp_timeout');
        $mail->setTo($email_to);
        $mail->setFrom($this->config->get('config_mail_smtp_username'));
        $mail->setSender($this->config->get('config_mail_smtp_username'));
        $mail->setSubject($confirmation);
        $mail->setText($message);

        $mail->send();

        $this->load->model('catalog/reservations');
        $this->model_catalog_reservations->updateReservation($id, 1);
    }
    public function declined(){
        $this->load->language('catalog/reservations');

	    $name = $_POST['name'];
	    $lang = $_POST['lang'];
	    $id = $_POST['id'];
	    $email_to = $_POST['mail'];
        $get_message = $this->language->get('rejected_message_'.$lang);
        $message = sprintf($get_message, $name);
        $confirmation = $this->language->get('rejected_'.$lang);


        $mail = new Mail();

        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->username = $this->config->get('config_mail_smtp_username');
        $mail->password = $this->config->get('config_mail_smtp_password');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
        $mail->port = $this->config->get('config_mail_smtp_port');
        $mail->timeout = $this->config->get('config_mail_smtp_timeout');
        $mail->setTo($email_to);
        $mail->setFrom($this->config->get('config_mail_smtp_username'));
        $mail->setSender($this->config->get('config_mail_smtp_username'));
        $mail->setSubject($confirmation);
        $mail->setText($message);

        $mail->send();

        $this->load->model('catalog/reservations');
        $this->model_catalog_reservations->updateReservation($id, 2);
    }

    public function delete(){
        $id = $_POST['id'];
        $this->load->model('catalog/reservations');
        $this->model_catalog_reservations->deleteReservation($id);
    }
}
