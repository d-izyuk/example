<?php
class ModelCatalogReservations extends Model {
	public function getReservations() {
		$sql = "SELECT * FROM ". DB_PREFIX ."reservation ORDER BY id DESC";

		$query = $this->db->query($sql);

		return $query->rows;
	}
	public function getRoomName($room_id) {
		$sql = "SELECT pd.name, p.model FROM ". DB_PREFIX ."product_description pd LEFT JOIN ".DB_PREFIX."product p ON (pd.product_id = p.product_id) WHERE pd.product_id = '". (int)$room_id ."'";

		$query = $this->db->query($sql);

//		var_dump($query->row);

		return $query->row;
	}
    public function updateReservation($id, $status) {
        $this->db->query("UPDATE ". DB_PREFIX ."reservation SET status = '". (int)$status ."' WHERE id = '". (int)$id ."' ");
    }
    public function deleteReservation($id, $status) {
        $this->db->query("DELETE FROM ". DB_PREFIX ."reservation  WHERE id = '". (int)$id ."' ");
    }
}
