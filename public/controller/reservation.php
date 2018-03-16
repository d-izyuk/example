<?php
class ControllerCommonReservation extends Controller {
    public function addOrder(){
        $room_id = $_POST['room_id'];
        $date_in = $_POST['date_in'];
        $time_in = $_POST['time_in'];
        $date_out = $_POST['date_out'];
        $time_out = $_POST['time_out'];
        $count = $_POST['count'];
        $name = $_POST['name'];
        $email = $_POST['mail'];
        $phone = $_POST['phone'];
        $message = $_POST['message'];
        $confirmation = $_POST['confirmation'];
        $lang_id = $_POST['language'];

        $order_date = date('d.m.y, H:m:s');

        $email_to = $email;
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

//        var_dump($mail);
//        die();

        $mail->send();



        $this->load->model('extension/reservation');

        $this->model_extension_reservation->addOrder($room_id, $date_in, $time_in, $date_out, $time_out, $count, $name, $email, $phone, $order_date, $lang_id);
    }
}
