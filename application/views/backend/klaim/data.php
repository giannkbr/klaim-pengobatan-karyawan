<!-- Page Heading -->
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="<?= base_url('assets/backend') ?>/bootstrap-datepicker/css/bootstrap-datepicker.min.css">
<?php $no = 1;
foreach ($klaim as $r => $data) { ?>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
  <?php if ($user['role_id'] == 4 && $user['role_id'] == 1) {?>
  <a href="<?= site_url('klaim/addklaimkaryawan/' . $data->reimbursements_id) ?>"
    class="d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-plus fa-sm text-white-50"></i> Tambah
    Data</a>
  <?php } else { ?>
  <div class="d-sm-flex align-items-center justify-content-between">
    <?php $this->view('messages') ?>
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold">Cetak Data Keseluruhan By Tanggal Klaim</h6>
      </div>
      <div class="card-body">
        <div class="row">
          <div class="col-lg">
            <div class="box box-primary">
              <div class="box-body box-profile">
                <form action="<?= base_url('report/printreport'); ?>" target="blank" method="post">
                  <div class="box">
                    <div class="box-body">
                      <form>
                        <div class="form-group row">
                          <div class="col-md-0">
                            <label class="col-sm-12 col-form-label">Tanggal</label>
                          </div>
                          <div class="col-sm-3">
                            <input type="text" id="tanggal" name="tanggal" class="form-control" autocomplete="off">
                          </div>
                          <div class="col-md-0">
                            <label class="col-sm-12 col-form-label">s/d</label>
                          </div>
                          <div class="col-sm-3">
                            <input type="text" id="tanggal2" name="tanggal2" autocomplete="off" class="form-control">
                          </div>
                          <div class="col-sm-3">
                            <button type="reset" name="reset" class="btn btn-info">Reset</button>
                            <button type="submit" name="filter" class="btn btn-primary"><i class="fa fa-print"></i>
                              Cetak</button>
                          </div>
                        </div>
                    </div>
                </form>
              </div>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php } ?>
</div>
<?php $this->view('messages') ?>
<!-- DataTales Example -->
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold">Data Klaim</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr style="text-align: center">
            <th style="text-align: center; width:20px">No</th>
            <th>Nama Karyawan</th>
            <th>Description</th>
            <th>Nominal</th>
            <th>Tanggal</th>
            <th>Nama Perusahaan</th>
            <th>Bukti</th>
            <th>Status Klaim</th>
            <?php if($user['role_id'] != 4){?>
            <th style="text-align: center">Aksi</th>
            <?php }?>
          </tr>
        </thead>
        <tbody>

          <tr>
            <td style="text-align: center"><?= $no++ ?>.</td>
            <td><?= $data->name ?></td>
            <td><?= $data->description ?></td>
            <td><?= indo_currency($data->nominal) ?></td>
            <td><?= $data->date ?></td>
            <td><?= $data->company_name ?></td>
            <td><img src="<?= base_url('assets/images/bukti/') ?><?= $data->photo ?>" alt=""
                style="width:100px; height:100px"></td>
            <td><span class="badge badge-primary"><?= $data->status_name ?></span>
              <?php if($user['role_id'] != 4){?>
            <td style="text-align: center">

              <?php if ($user['role_id'] != 4) {?>
              <a href="<?= site_url('klaim/printklaim/') ?><?= $data->reimbursements_id ?>" title="Print"><i
                  class="fa fa-print" style="font-size:25px"></i></a>
              <?php } ?>

              <a href="<?= site_url('klaim/edit/') ?><?= $data->reimbursements_id ?>" title="Edit"><i class="fa fa-edit"
                  style="font-size:25px"></i></a> <a href="" data-toggle="modal"
                data-target="#DeleteModal<?= $data->reimbursements_id ?>" title="Hapus"><i class="fa fa-trash"
                  style="font-size:25px; color:red"></i></a>
            </td>
            <?php }?>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</div>

<!-- Modal Hapus -->
<?php
foreach ($klaim as $r => $data) { ?>
<div class="modal fade" id="DeleteModal<?= $data->reimbursements_id ?>" tabindex="-1" role="dialog"
  aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Hapus klaim</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <?php echo form_open_multipart('klaim/delete') ?>
        <input type="hidden" name="reimbursements_id" value="<?= $data->reimbursements_id ?>" class="form-control">
        Apakah yakin akan hapus klaim karyawan dengan nama <?= $data->name ?>?
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
          <button type="submit" class="btn btn-danger">Hapus</button>
        </div>
        <?php echo form_close() ?>
      </div>
    </div>
  </div>
</div>
<?php } ?>
<script src="<?= base_url('assets/backend') ?>/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
  <script>
    //Date picker
    $('#tanggal').datepicker({
      format: 'yyyy-mm-dd',
      autoclose: true,
      todayHighlight: true,
    })
    $('#tanggal2').datepicker({
      format: 'yyyy-mm-dd',
      autoclose: true,
      todayHighlight: true,
    })
  </script>