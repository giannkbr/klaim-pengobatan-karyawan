<?php defined('BASEPATH') or exit('No direct script access allowed');

class Setting_m extends CI_Model
{
    public function getCompany($id = null)
    {
        $this->db->select('*');
        $this->db->from('company');
        if ($id != null) {
            $this->db->where('id', $id);
        }
        $query = $this->db->get();
        return $query;
    }
    public function getBank($id = null)
    {
        $this->db->select('*');
        $this->db->from('bank');
        if ($id != null) {
            $this->db->where('bank_id', $id);
        }
        $query = $this->db->get();
        return $query;
    }
    public function addBank($post)
    {
        $params = [
            'name' => $post['name'],
            'no_rek' => $post['no_rek'],
            'owner' => $post['owner'],
        ];
        $this->db->insert('bank', $params);
    }
    public function editBank($post)
    {
        $params = [
            'name' => $post['name'],
            'no_rek' => $post['no_rek'],
            'owner' => $post['owner'],
        ];
        $this->db->where('bank_id',  $post['bank_id']);
        $this->db->update('bank', $params);
    }
    public function deleteBank($bank_id)
    {
        $this->db->where('bank_id', $bank_id);
        $this->db->delete('bank');
    }
    public function editCompany($post)
    {
        $params = [
            'company_name' => $post['company_name'],
            'sub_name' => $post['sub_name'],
            'email' => $post['email'],
            'facebook' => $post['fb'],
            'instagram' => $post['ig'],
            'whatsapp' => $post['hp'],
            'address' => $post['address'],
            'due_date' => $post['due_date'],
            'owner' => $post['owner'],
        ];
        if (!empty($_FILES['logo']['name'])) {
            $params['logo'] = $post['logo'];
        }
        $this->db->where('id', $post['id']);
        $this->db->update('company', $params);
    }

    public function getCarousel($id = null)
    {
        $this->db->select('*');
        $this->db->from('carousel');
        if ($id != null) {
            $this->db->where('carousel_id', $id);
        }
        $query = $this->db->get();
        return $query;
    }

    public function addCarousel($post)
    {
        $params = [
            'images' => $post['images'],
        ];
        $this->db->insert('carousel', $params);
    }

    public function editCarousel($post)
    {
      $params = [
        'images' => $post['images'],
    ];
        if (!empty($_FILES['images']['name'])) {
            $params['images'] = $post['images'];
        }
        $this->db->where('carousel_id', $post['id']);
        $this->db->update('carousel', $params);
    }

    public function deleteCarousel($carousel_id)
    {
        $this->db->where('carousel_id', $carousel_id);
        $this->db->delete('carousel');
    }
}
