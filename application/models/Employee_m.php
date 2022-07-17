<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class Employee_m extends CI_Model {

  public function getEmployee($id = null)
  {
      $this->db->select('*');
      $this->db->from('user');
      $this->db->join('role_id', 'role_id.role_id = user.role_id');
      $this->db->where('email !=', 'test@gmail.com');
      if ($id != null) {
          $this->db->where('id', $id);
      }
      $query = $this->db->get();
      return $query;
  }

   public function add($post)
    {
        $params = [
            'name' => $post['name'],
            'email' => $post['email'],
            'password' => password_hash($post['password'], PASSWORD_DEFAULT),
            'gender' => $post['gender'],
            'address' => $post['address'],
            'phone' => $post['phone'],
            'role_id' => $post['role_id'],
            'is_active' => '1',
            'image' => 'default.jpg',
            'date_created' => time(),
        ];
        // var_dump($params);
        $this->db->insert('user', $params);
    }

    public function edit($post)
    {
        $params = [
            'name' => $post['name'],
            'email' => $post['email'],
            'gender' => $post['gender'],
            'address' => $post['address'],
            'phone' => $post['phone'],
            'role_id' => $post['role_id'],
            'image' => 'default.jpg',
            'date_created' => time(),
        ];
        $this->db->where('id', $post['id']);
        $this->db->update('user', $params);
    }

    public function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('user');
    }
}

/* End of file Employee_m.php */