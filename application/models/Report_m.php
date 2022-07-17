<?php defined('BASEPATH') or exit('No direct script access allowed');
class Report_m extends CI_Model
{
    public function getFilter($post)
    {
        $this->db->select('*');
        $this->db->from('reimbursements');
        $this->db->join('status_reimbursements', 'status_reimbursements.status_id = reimbursements.status_id');
        $this->db->join('user', 'user.id = reimbursements.user_id');
        if (!empty($post['tanggal']) && !empty($post['tanggal2'])) {
            $this->db->where("reimbursements.date BETWEEN '" . ($post['tanggal']) . "' AND '" . ($post['tanggal2']) . "'");
        }
        $this->db->order_by('date', 'ASC');
        $query = $this->db->get();
        return $query;
    }
}
