<?php defined('BASEPATH') or exit('No direct script access allowed');

class Customer_m extends CI_Model
{

    public function getCustomer($customer_id = null, $no_services = null)
    {
        $this->db->select('*');
        $this->db->from('customer');
        $this->db->where('c_status', '4');
        $this->db->join('package_item', 'package_item.p_item_id = customer.p_item_id');
        $this->db->join('c_status', 'c_status.c_status_id = customer.c_status');
        if ($customer_id != null) {
            $this->db->where('customer_id', $customer_id);
        }
        if ($no_services != null) {
            $this->db->where('no_services', $no_services);
        }
        $query = $this->db->get();
        return $query;
    }

    public function getNSCustomer($no_services = null)
    {
        $this->db->select('*');
        $this->db->from('customer');
        $this->db->join('package_item', 'package_item.p_item_id = customer.p_item_id');
        $this->db->join('c_status', 'c_status.c_status_id = customer.c_status');
        if ($no_services != null) {
            $this->db->where('no_services', $no_services);
        }
        $query = $this->db->get();
        return $query;
    }

    public function getInvoiceCustomer($no_services = null)
    {
        $this->db->select('*');
        $this->db->from('customer');
        if ($no_services != null) {
            $this->db->where('no_services', $no_services);
        }
        $query = $this->db->get();
        return $query;
    }
    public function add($post)
    {
        $params = [
            'name' => $post['name'],
            'no_services' => $post['no_services'],
            'no_ktp' => $post['no_ktp'],
            'email' => $post['email'],
            'no_wa' => $post['no_wa'],
            'address' => $post['address'],
            'created' => time(),
        ];
        $this->db->insert('customer', $params);
    }

    public function edit($post)
    {
        $params = [
            'name' => $post['name'],
            'no_ktp' => $post['no_ktp'],
            'email' => $post['email'],
            'no_wa' => $post['no_wa'],
            'address' => $post['address'],
        ];
        $this->db->where('customer_id', $post['customer_id']);
        $this->db->update('customer', $params);
    }

    public function uploadbukti($post)
    {
        $params = [
            'nama_pengirim' => $post['nama_pengirim'],
            'nama_bank' => $post['nama_bank'],
            'bukti_pembayaran' =>  $this->upload->data('file_name'),
            'no_services' => $post['no_services']
        ];
        var_dump($params);
        $this->db->where('no_services', $post['no_services']);
        $this->db->update('customer', $params);
    }

    public function delete($customer_id)
    {
        $this->db->where('customer_id', $customer_id);
        $this->db->delete('customer');
    }
}
