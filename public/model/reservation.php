<?php
class ModelExtensionReservation extends Model {
    public function addOrder($room_id, $date_in, $time_in, $date_out, $time_out, $count, $name, $mail, $phone, $order_date, $lang_id) {
        if($lang_id == 1){
            $lang = 'ua';
        } elseif ($lang_id == 2){
            $lang = 'en';
        } elseif ($lang_id == 3){
            $lang = 'pl';
        } elseif ($lang_id == 4){
            $lang = 'ru';
        }
            $this->db->query("INSERT INTO ".DB_PREFIX."reservation SET order_date='". $this->db->escape($order_date) ."', room_id = '". (int)$room_id ."', res_count_places = '". (int)$count ."', date_in = '". date('y-m-d',strtotime($date_in)) ."', date_out = '". date('y-m-d',strtotime($date_out)) ."', time_start = '". $this->db->escape($time_in) ."', time_end = '". $this->db->escape($time_out) ."', name = '". $this->db->escape($name) ."', phone = '". $this->db->escape($phone) ."', email = '". $this->db->escape($mail) ."', status = 0, lang =
            '". $this->db->escape($lang) ."'");
    }
}