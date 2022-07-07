  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="<?= base_url('assets/backend') ?>/bootstrap-datepicker/css/bootstrap-datepicker.min.css">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <a href="" data-toggle="modal" data-target="#add" class="d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
        class="fas fa-plus fa-sm text-white-50"></i> Tambah</a>

  </div>
  <?php $this->view('messages') ?>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold">Data Carousel</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" width="100%" cellspacing="0">
          <thead>
            <tr style="text-align: center">
              <th style="text-align: center; width:20px">No</th>
              <th>Image</th>
              <th style="text-align: center; width:100px">Aksi</th>
            </tr>
          </thead>

          <tbody>
            <?php $no = 1;
                        foreach ($carousel as $r => $data) { ?>
            <tr>
              <td style="text-align: center"><?= $no++ ?>.</td>
              <td><img src="<?= base_url('assets/images/')?><?= $data->images?>" style=" display: block;
                width: 20%;" alt=""> </td>
              </td>
              <td style="text-align: center"><a href="#" data-toggle="modal"
                  data-target="#edit<?= $data->carousel_id ?>" title="Edit"><i class="fa fa-edit"
                    style="font-size:25px"></i></a> <a href="" data-toggle="modal"
                  data-target="#delete<?= $data->carousel_id ?>" title="Hapus"><i class="fa fa-trash"
                    style="font-size:25px; color:red"></i></a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- Modal Add -->
  <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Tambah Data Carousel</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="<?= site_url('setting/addCarousel') ?>" method="POST" enctype="multipart/form-data">
            <div class="form-group">
              <label for="name">Images</label>
              <input type="file" id="images" name="images" autocomplete="off" class="form-control" required>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
          <button type="submit" class="btn btn-primary">Simpan</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Modal Edit -->
  <?php foreach ($carousel as $r => $data) { ?>
  <div class="modal fade" id="edit<?= $data->carousel_id ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Edit Data Carousel</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="<?= site_url('setting/editCarousel') ?>" method="POST" enctype="multipart/form-data">
            <div class="form-group">
              <label for="name">Images</label>
              <input type="file" name="images" id="images" class="form-control"
                autocomplete="off">
              <input type="hidden" id="id" name="id" value="<?= $data->carousel_id ?>" class="form-control"
                required>
            </div>
            <div class="form-gruop">
            <img src="<?= base_url('assets/images/')?><?= $data->images?>" style=" display: block;
                width: 40%;" alt="">
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
          <button type="submit" class="btn btn-primary">Simpan</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <?php } ?>
  <!-- Modal delete -->
  <?php foreach ($carousel as $r => $data) { ?>
      <div class="modal fade" id="delete<?= $data->carousel_id ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Hapus Data carousel</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                      </button>
                  </div>
                  <div class="modal-body">
                      <form action="<?= site_url('setting/deleteCarousel') ?>" method="POST">
                          <input type="hidden" name="id" value="<?= $data->carousel_id ?>">
                          Apakah anda yakin akan hapus data carousel?
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                      <button type="submit" class="btn btn-danger">Hapus</button>
                  </div>
                  </form>
              </div>
          </div>
      </div>
  <?php } ?>
  <!-- bootstrap datepicker -->
  <script src="<?= base_url('assets/backend') ?>/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
  <script>
    //Date picker
    $('#datepicker').datepicker({
      format: 'yyyy-mm-dd',
      autoclose: true,
      todayHighlight: true,
    })
  </script>