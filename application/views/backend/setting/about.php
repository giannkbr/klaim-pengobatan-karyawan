<link href="<?= base_url('assets/backend/') ?>css/bootstrap3-wysihtml5.min.css" rel="stylesheet">
<div class="container">
  <?php $this->view('messages') ?>
</div>
<div class="container mt-2">
  <div class="card">
    <div class="card-header">
      Tentang <?= $company['company_name'] ?>
    </div>
    <div class="card-body">
      <form action="<?= site_url('setting/editAbout') ?>" method="POST">
        <div class="form-group">
          <label for="name">Deskripsi</label>
          <textarea name="description" id="editor1" class="form-control"><?= $company['description'] ?></textarea>
        </div>
        <div class="form-group">
          <label for="name">Our Story</label>
          <textarea name="our_story" id="editor2" class="form-control"><?= $company['our_story'] ?></textarea>
        </div>
        <div class="form-group">
          <label for="name">Our Mission</label>
          <textarea name="our_mission" id="editor3" class="form-control"><?= $company['our_mission'] ?></textarea>
        </div>
        <div class="text-right mt-2">
          <button class="btn btn-primary">
            Simpan
          </button>
        </div>
      </form>
    </div>
  </div>
</div>

<script src="<?= base_url('assets/backend/') ?>css/ckeditor/ckeditor.js"></script>
<script src="<?= base_url('assets/backend/') ?>js/bootstrap3-wysihtml5.all.min.js"></script>
<script>
  ClassicEditor
    .create(document.querySelector('#editor1'))
    .catch(error => {
      console.error(error);
    });
  ClassicEditor
    .create(document.querySelector('#editor2'))
    .catch(error => {
      console.error(error);
    });
  ClassicEditor
    .create(document.querySelector('#editor3'))
    .catch(error => {
      console.error(error);
    });
</script>