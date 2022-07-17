<div class="col-lg-12">
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold">Edit Klaim</h6>
    </div>
    <div class="card-body">
      <?php echo form_open_multipart('') ?>

      <?php if ($user['role_id'] == 4) {?>
        <div class="input-group mb-3">
        <div class="input-group-prepend">
          <label class="input-group-text" for="inputGroupSelect01">Nama Karyawan</label>
        </div>
        <select class="custom-select" name="user_id" id="inputGroupSelect01" disabled>
          <option selected>Choose...</option>
          <?php
						foreach ($karyawan as $data)
						{
							echo "<option value='$data->id'";
							echo $klaim->user_id==$data->id?'selected':'';
                    		echo ">$data->name</option>";
						}
						?>
        </select>
      </div>
      <?php } else { ?>
        <div class="input-group mb-3">
        <div class="input-group-prepend">
          <label class="input-group-text" for="inputGroupSelect01">Nama Karyawan</label>
        </div>
        <select class="custom-select" name="user_id" id="inputGroupSelect01" readonly>
          <option selected>Choose...</option>
          <?php
						foreach ($karyawan as $data)
						{
							echo "<option value='$data->id'";
							echo $klaim->user_id==$data->id?'selected':'';
                    		echo ">$data->name</option>";
						}
						?>
        </select>
      </div>
      <?php } ?>

      <div class="form-group">
        <label for="email">Description</label>
        <input type="hidden" name="reimbursements_id" value="<?= $klaim->reimbursements_id ?>" readonly>
        <input type="text" id="description" name="description" class="form-control" value="<?= $klaim->description ?>">
        <?= form_error('description', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="form-group">
        <label for="bukti">Nominal</label>
        <input type="text" id="nominal" name="nominal" class="form-control" value="<?= $klaim->nominal ?>">
        <?= form_error('nominal', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>
      <div class="form-group">
        <label for="address">Tanggal</label>
        <input type="date" id="date" name="date" class="form-control"
          value="<?php if(!empty($klaim->date)){ echo $klaim->date; } else { echo date("Y-m-d"); } ?>">
        <?= form_error('date', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>

      <div class="form-group">
        <label for="address">Nama Perusahaan</label>
        <input type="text" id="company_name" name="company_name" class="form-control"
          value="<?= $company['company_name'] ?>" readonly>
        <?= form_error('company_name', '<small class="text-danger pl-3 ">', '</small>') ?>
      </div>

      <div class="form-group">
        <label for="photo">Gambar </label> <br>
        <img name="photo" src="<?= base_url('assets/images/bukti/') ?><?= $klaim->photo ?>" alt=""
          style="width:100px; height:100px">
        <br>
        <input type="file" id="photo" name="photo" class="form-control" value="<?= $klaim->photo ?>">
      </div>


      <?php if ($user['role_id'] != 4) {?>
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <label class="input-group-text" for="inputGroupSelect01">Status Reimbursements</label>
        </div>
        <select class="custom-select" name="status_id" id="inputGroupSelect01">
          <option selected>Choose...</option>
          <?php
						foreach ($status as $data)
						{
							echo "<option value='$data->status_id'";
							echo $klaim->status_id==$data->status_id?'selected':'';
              echo ">$data->status_name</option>";
						}
						?>
        </select>
      </div>
      <?php } ?>


      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" data-dismiss="modal">Reset</button>
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
      <?php echo form_close() ?>
    </div>
  </div>
</div>