<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class Klaim extends CI_Controller {

  public function __construct()
  {
      parent::__construct();
      is_logged_in();
      $this->load->model(['klaim_m']);
  }

  public function index()
  {
      $data['title'] = 'Data Klaim';
      $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
      $data['klaim'] = $this->klaim_m->getKlaim()->result();
      $data['company'] = $this->db->get('company')->row_array();
      $this->template->load('backend', 'backend/klaim/data', $data);
  }

  public function add()
  {
      $this->form_validation->set_rules('user_id', 'Name', 'required|trim');
      $this->form_validation->set_rules('description', 'Description', 'required|trim');
      $this->form_validation->set_rules('nominal', 'Nominal', 'required|trim');
      $this->form_validation->set_rules('date', 'Tanggal', 'required|trim');
      $this->form_validation->set_rules('company_name', 'Nama Perusahaan', 'required|trim');
      // $this->form_validation->set_rules('bukti', 'Nama Perusahaan', 'required|trim');
      $this->form_validation->set_message('required', '%s Tidak boleh kosong, Silahkan isi');
      $this->form_validation->set_message('is_unique', '%s Sudah dipakai, Silahkan ganti');
      if ($this->form_validation->run() == false) {
          $data['title'] = 'Add Klaim';
          $data['company'] = $this->db->get('company')->row_array();
          $data['karyawan'] = $this->db->get('user')->result();
          $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
          $this->template->load('backend', 'backend/klaim/add_klaim', $data);
      } else {
        $config['upload_path']          = './assets/images/bukti';
        $config['allowed_types']        = 'gif|jpg|png|jpeg';
        $config['max_size']             = 10048; // 10 Mb
        $config['file_name']             = 'bukti-' . date('ymd') . '-' . substr(md5(rand()), 0, 10);
        $this->load->library('upload', $config);
        $post = $this->input->post(null, TRUE);
        if (@FILES['photo']['name'] != null) {
            if ($this->upload->do_upload('photo')) {
                $post['photo'] =  $this->upload->data('file_name');
                $this->klaim_m->add($post);
                if ($this->db->affected_rows() > 0) {
                    $this->session->set_flashdata('success', 'Data Klaim berhasil disimpan');
                }
                echo "<script>window.location='" . site_url('klaim') . "'; </script>";
            }
        } else {
            $error = $this->upload->display_errors();
            $this->session->set_flashdata('error', $error);
            echo "<script>window.location='" . base_url('klaim') . "'; </script>";
        }
      }
  }

  public function edit($klaim_id)
    {
        is_logged_in();
        $this->form_validation->set_rules('user_id', 'Name', 'required|trim');
        $this->form_validation->set_rules('description', 'Description', 'required|trim');
        $this->form_validation->set_rules('nominal', 'Nominal', 'required|trim');
        $this->form_validation->set_rules('date', 'Tanggal', 'required|trim');
        $this->form_validation->set_rules('company_name', 'Nama Perusahaan', 'required|trim');
        // $this->form_validation->set_rules('bukti', 'Nama Perusahaan', 'required|trim');
        $this->form_validation->set_message('required', '%s Tidak boleh kosong, Silahkan isi');
        $this->form_validation->set_message('is_unique', '%s Sudah dipakai, Silahkan ganti');
        if ($this->form_validation->run() == false) {
            $query  = $this->klaim_m->getKlaim($klaim_id);
            if ($query->num_rows() > 0) {
                $data['klaim'] = $query->row();
                $data['title'] = 'Edit klaim';
                $data['reimbursements'] = $this->db->get('reimbursements')->row_array();
                $data['company'] = $this->db->get('company')->row_array();
                $data['karyawan'] = $this->db->get('user')->result();
                $data['status'] = $this->db->get('status_reimbursements')->result();
                // var_dump( $data['user']);
                $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
                $this->template->load('backend', 'backend/klaim/edit_klaim', $data);
            } else {
                echo "<script> alert ('Data tidak ditemukan');";
                echo "window.location='" . site_url('klaim') . "'; </script>";
            }
        } else {
          $config['upload_path']          = './assets/images/bukti';
          $config['allowed_types']        = 'gif|jpg|png|jpeg';
          $config['max_size']             = 10048; // 10 Mb
          $config['file_name']             = 'bukti-' . date('ymd') . '-' . substr(md5(rand()), 0, 10);
          $this->load->library('upload', $config);
          $post = $this->input->post(null, TRUE);
          // var_dump($post);
          if (@FILES['photo']['name'] != null) {
              $klaim = $this->klaim_m->getKlaim($post['reimbursements_id'])->row();
              // if ($klaim->photo != null) {
              //     $target_file = './assets/images/bukti/' . $klaim->photo;
              //     unlink($target_file);
              // }
              $post['photo'] =  $this->upload->data('file_name');
              $this->klaim_m->edit($post);
              if ($this->db->affected_rows() > 0) {
                  $this->session->set_flashdata('success', 'Data Klaim berhasil diperbaharui');
              }
              echo "<script>window.location='" . site_url('klaim') . "'; </script>";
          } else {
              $error = $this->upload->display_errors();
              $this->session->set_flashdata('error', $error);
              echo "<script>window.location='" . base_url('klaim') . "'; </script>";
          }
        }
    }

  public function printklaim($id)
    {
        $data['title'] = 'Klaim';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $data['company'] = $this->db->get('company')->row_array();
        $data['klaim'] = $this->klaim_m->getFilter($id)->result();
        $this->load->view('backend/klaim/printklaim', $data);
    }

    public function delete()
    {
        $id = $this->input->post('reimbursements_id');
        $this->klaim_m->delete($id);
        var_dump($id);
        if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('success', 'Data Klaim berhasil dihapus!');
        }
        echo "<script>window.location='" . site_url('klaim') . "'; </script>";
    }



    // klaim karyawan
    public function karyawan($id)
    {
        $data['title'] = 'Data Klaim';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $data['klaim'] = $this->klaim_m->getKlaimByUser($id)->result();
        $data['reimbursements'] = $this->db->get('reimbursements')->row_array();
        $data['company'] = $this->db->get('company')->row_array();
        $this->template->load('backend', 'backend/klaim/data', $data);
    }

    public function addklaimkaryawan($klaim_id)
    {
        $this->form_validation->set_rules('user_id', 'Name', 'required|trim');
        $this->form_validation->set_rules('description', 'Description', 'required|trim');
        $this->form_validation->set_rules('nominal', 'Nominal', 'required|trim');
        $this->form_validation->set_rules('date', 'Tanggal', 'required|trim');
        $this->form_validation->set_rules('company_name', 'Nama Perusahaan', 'required|trim');
        // $this->form_validation->set_rules('bukti', 'Nama Perusahaan', 'required|trim');
        $this->form_validation->set_message('required', '%s Tidak boleh kosong, Silahkan isi');
        $this->form_validation->set_message('is_unique', '%s Sudah dipakai, Silahkan ganti');
        $query  = $this->klaim_m->getKlaim($klaim_id);
        if ($this->form_validation->run() == false) {
          $data['klaim'] = $query->row();
            $data['title'] = 'Add Klaim';
            $data['company'] = $this->db->get('company')->row_array();
            $data['karyawan'] = $this->db->get('user')->result();
            $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
            $this->template->load('backend', 'backend/klaim/add_klaim', $data);
        } else {
          $config['upload_path']          = './assets/images/bukti';
          $config['allowed_types']        = 'gif|jpg|png|jpeg';
          $config['max_size']             = 10048; // 10 Mb
          $config['file_name']             = 'bukti-' . date('ymd') . '-' . substr(md5(rand()), 0, 10);
          $this->load->library('upload', $config);
          $post = $this->input->post(null, TRUE);
          if (@FILES['photo']['name'] != null) {
              if ($this->upload->do_upload('photo')) {
                  $post['photo'] =  $this->upload->data('file_name');
                  $this->klaim_m->add($post);
                  if ($this->db->affected_rows() > 0) {
                      $this->session->set_flashdata('success', 'Data Klaim berhasil disimpan');
                  }
                  echo "<script>window.location='" . site_url('klaim') . "'; </script>";
              }
          } else {
              $error = $this->upload->display_errors();
              $this->session->set_flashdata('error', $error);
              echo "<script>window.location='" . base_url('klaim') . "'; </script>";
          }
        }
    }
}

/* End of file Klaim.php */
