<div class="col-lg-12">
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold">Edit Karyawan</h6>
    </div>
    <div class="card-body">
      <?php echo form_open_multipart('') ?>
      <div class="form-group">
        <label for="name">Nama Karyawan</label>
        <input type="hidden" name="id" value="<?= $employee->id ?>" readonly>
        <input type="text" id="name" name="name" class="form-control" value="<?= $employee->name ?>">
        <?= form_error('name', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input type="text" id="email" name="email" class="form-control" value="<?= $employee->email ?>">
        <?= form_error('email', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="form-group">
        <label for="address">Jenis Kelamin</label>
        <input type="text" id="gender" name="gender" class="form-control" value="<?= $employee->gender ?>">
        <?= form_error('gender', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="form-group">
        <label for="address">Telepone</label>
        <input type="text" id="phone" name="phone" class="form-control" value="<?= $employee->phone ?>">
        <?= form_error('phone', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="form-group">
        <label for="address">Alamat</label>
        <textarea id="address" name="address" class="form-control"> <?= $employee->address ?></textarea>
        <?= form_error('address', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <label class="input-group-text" for="inputGroupSelect01">Status Karyawan</label>
        </div>
        <select class="custom-select" name="role_id" id="inputGroupSelect01">
          <option selected>Choose...</option>
          <?php
						foreach ($role as $data)
						{
							echo "<option value='$data->role_id'";
							echo $employee->role_id==$data->role_id?'selected':'';
                    		echo ">$data->status_name</option>";
						}
						?>
        </select>
      </div>

      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" data-dismiss="modal">Reset</button>
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
      <?php echo form_close() ?>
    </div>
  </div>
</div>