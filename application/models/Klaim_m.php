<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class Klaim_m extends CI_Model {

  public function getKlaim($id = null)
  {
      $this->db->select('*');
      $this->db->from('reimbursements');
      $this->db->join('status_reimbursements', 'status_reimbursements.status_id = reimbursements.status_id');
      $this->db->join('user', 'user.id = reimbursements.user_id');
      if ($id != null) {
          $this->db->where('reimbursements_id', $id);
      }
      $query = $this->db->get();
      return $query;
  }

  public function getKlaimByUser($id = null)
  {
      $this->db->select('*');
      $this->db->from('reimbursements');
      $this->db->join('status_reimbursements', 'status_reimbursements.status_id = reimbursements.status_id');
      $this->db->join('user', 'user.id = reimbursements.user_id');
      if ($id != null) {
          $this->db->where('reimbursements.user_id', $id);
      }
      $query = $this->db->get();
      return $query;
  }


  public function add($post)
  {
      $params = [
          'user_id' => $post['user_id'],
          'description' => $post['description'],
          'nominal' => $post['nominal'],
          'date' => $post['date'],
          'company_name' => $post['company_name'],
          'status_id' => '1',
          'date_created' => time(),
      ];
      if (!empty($_FILES['photo']['name'])) {
        $params['photo'] = $post['photo'];
    }
      // var_dump($params);
      $this->db->insert('reimbursements', $params);
  }

  public function edit($post)
  {
      $params = [
          'user_id' => $post['user_id'],
          'description' => $post['description'],
          'nominal' => $post['nominal'],
          'date' => $post['date'],
          'company_name' => $post['company_name'],
          'status_id' => $post['status_id'],
          'date_created' => time(),
      ];
      if (!empty($_FILES['photo']['name'])) {
        $params['photo'] = $post['photo'];
      }
    // var_dump($params);
    $this->db->where('reimbursements_id', $post['reimbursements_id']);
    $this->db->update('reimbursements', $params);
  }



  public function getFilter($id)
    {
        $this->db->select('*');
        $this->db->where('reimbursements_id', $id);
        $this->db->join('status_reimbursements', 'status_reimbursements.status_id = reimbursements.status_id');
        $this->db->join('user', 'user.id = reimbursements.user_id');
        $this->db->from('reimbursements');
        $query = $this->db->get();
        return $query;
    }


  public function delete($id)
  {
      $this->db->where('reimbursements_id', $id);
      $this->db->delete('reimbursements');
  }
}

/* End of file Klaim_m.php */