<div class="col-lg-12">
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold">Tambah Karyawan</h6>
    </div>
    <div class="card-body">
      <?php echo form_open_multipart('') ?>
      <div class="form-group">
        <label for="name">Nama Karyawan</label>
        <input type="text" id="name" name="name" class="form-control" value="<?= set_value('name') ?>">
        <?= form_error('name', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input type="text" id="email" name="email" class="form-control" value="<?= set_value('email') ?>">
        <?= form_error('email', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="form-group">
        <label for="address">Password</label>
        <input type="password" id="password" name="password" class="form-control" value="<?= set_value('password') ?>">
        <?= form_error('password', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="form-group">
        <label for="address">Jenis Kelamin</label>
        <input type="text" id="gender" name="gender" class="form-control" value="<?= set_value('gender') ?>">
        <?= form_error('gender', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>

      <div class="form-group">
        <label for="address">Telepone</label>
        <input type="text" id="phone" name="phone" class="form-control" value="<?= set_value('phone') ?>">
        <?= form_error('phone', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>

      <div class="form-group">
        <label for="address">Alamat</label>
        <textarea id="address" name="address" class="form-control"> <?= set_value('address') ?> </textarea>
        <?= form_error('address', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>

      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <label class="input-group-text" for="inputGroupSelect01">Status Karyawan</label>
        </div>
        <select class="custom-select" name="role_id" id="inputGroupSelect01">
          <option selected>Choose...</option>
          <option value="1">HRD</option>
          <option value="2">Finance</option>
          <!-- <option value="3">HRD</option> -->
          <option value="4">Karyawan</option>
        </select>
        <?= form_error('role_id', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>

      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" data-dismiss="modal">Reset</button>
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
      <?php echo form_close() ?>
    </div>
  </div>
</div>