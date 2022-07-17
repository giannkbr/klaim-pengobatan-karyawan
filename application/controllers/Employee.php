<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Employee extends CI_Controller {

  public function __construct()
  {
      parent::__construct();
      is_logged_in();
      $this->load->model(['employee_m']);
  }

  public function index()
  {
      $data['title'] = 'Data Karyawan';
      $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
      $data['employee'] = $this->employee_m->getEmployee()->result();
      $data['company'] = $this->db->get('company')->row_array();
      $this->template->load('backend', 'backend/employee/data', $data);
  }

  public function add()
  {
      $this->form_validation->set_rules('name', 'Name', 'required|trim');
      $this->form_validation->set_rules('gender', 'Jenis kelamin', 'required|trim');
      $this->form_validation->set_rules('phone', 'Telepone', 'required|trim');
      $this->form_validation->set_rules('password', 'Password', 'required|trim');
      $this->form_validation->set_rules('address', 'Alamat', 'required|trim');
      $this->form_validation->set_rules('role_id', 'Status', 'required|trim');
      $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[user.email]');
      $this->form_validation->set_message('required', '%s Tidak boleh kosong, Silahkan isi');
      $this->form_validation->set_message('is_unique', '%s Sudah dipakai, Silahkan ganti');
      if ($this->form_validation->run() == false) {
          $data['title'] = 'Add Karyawan';
          $data['company'] = $this->db->get('company')->row_array();
          $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
          $this->template->load('backend', 'backend/employee/add_employee', $data);
      } else {
          $post = $this->input->post(null, TRUE);
          $this->employee_m->add($post);
          if ($this->db->affected_rows() > 0) {
              $this->session->set_flashdata('success', 'Data Karyawan berhasil disimpan');
          }
          echo "<script>window.location='" . site_url('employee') . "'; </script>";
      }
  }

  public function edit($id)
  {
      is_logged_in();
      $this->form_validation->set_rules('name', 'Name', 'required|trim');
      $this->form_validation->set_rules('gender', 'Jenis kelamin', 'required|trim');
      $this->form_validation->set_rules('address', 'Alamat', 'required|trim');
      $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
      $this->form_validation->set_message('required', '%s Tidak boleh kosong, Silahkan isi');
      $this->form_validation->set_message('is_unique', '%s Sudah dipakai, Silahkan ganti');

      if ($this->form_validation->run() == false) {
          $query  = $this->employee_m->getEmployee($id);
          if ($query->num_rows() > 0) {
              $data['employee'] = $query->row();
              $data['title'] = 'Edit Karyawan';
              $data['company'] = $this->db->get('company')->row_array();
              $data['role'] = $this->db->get('role_id')->result();
              $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
              $this->template->load('backend', 'backend/employee/edit_employee', $data);
          } else {
              echo "<script> alert ('Data tidak ditemukan');";
              echo "window.location='" . site_url('employee') . "'; </script>";
          }
      } else {
          $post = $this->input->post(null, TRUE);
          $this->employee_m->edit($post);
          if ($this->db->affected_rows() > 0) {
              $this->session->set_flashdata('success', 'Data Karyawan berhasil diperbaharui');
          }
          echo "<script>window.location='" . site_url('employee') . "'; </script>";
      }
  }

  function email_check()
  {
      $post = $this->input->post(null, TRUE);
      $query = $this->db->query("SELECT * FROM user WHERE email = '$post[email]' AND id != '$post[id]'");
      if ($query->num_rows() > 0) {
          $this->form_validation->set_message('email_check', '%s Ini sudah dipakai, Silahkan ganti !');
          return FALSE;
      } else {
          return TRUE;
      }
  }

  public function delete()
  {
      $id = $this->input->post('id');
      $this->employee_m->delete($id);
      if ($this->db->affected_rows() > 0) {
          $this->session->set_flashdata('success', 'Data Karyawan berhasil dihapus!');
      }
      echo "<script>window.location='" . site_url('employee') . "'; </script>";
  }

}

/* End of file Employee.php */
