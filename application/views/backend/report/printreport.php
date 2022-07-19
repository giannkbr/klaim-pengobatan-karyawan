<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Klaim <?php if ($tanggal && $tanggal2 !== '') {
                            ?>
            Dari Tanggal <?= indo_date($tanggal) ?> Sampai Tanggal <?= indo_date($tanggal2) ?>
        <?php } ?></title>
    <link rel="stylesheet" href="<?= base_url('assets/') ?>frontend/libraries/bootstrap/css/bootstrap.css">
</head>

<body onload="window.print()">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #FAFAFA;
            font: 12pt "Tahoma";
        }

        * {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
        }

        .page {
            width: 29.7cm;
            /* height: 21cm; */
            padding: 2cm;
            margin: 1cm auto;
            margin-top: auto;
            border: 1px #D3D3D3 solid;
            border-radius: 5px;
            background: white;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .invoice h3 {
            margin-top: -40px;
            font-weight: bold;
            font-size: 25px;
        }

        .invoice h6 {
            margin-top: -20px;
            font-size: 16px;
        }

        .invoice span {
            margin-top: -55px;
            font-size: 12px;
        }

        .invoice img {
            margin-top: -40px;
            max-height: 60px;
        }

        .invoice-title h3 {
            margin-top: -15px;
            font-size: 40px;
            font-weight: bold;
            color: darkblue;
        }

        .fromto h5 {
            font-weight: bold;
            font-size: 20px;
        }

        .lunas {
            text-align: center;
            font-weight: bold;
            color: green;
            border-width: 2px;
            border-style: dashed solid;
            position: relative;
            margin: 1em 0;
            transform: rotate(-20deg);
            -ms-transform: rotate(-20deg);
            -webkit-transform: rotate(-20deg);
        }

        @page {
            size: A4 landscape;
            margin-top: 0, 1cm;
            margin-bottom: 0, 5cm;
        }

        @media print {
            .page {
                margin: 2;
                border: initial;
                border-radius: initial;
                width: initial;
                min-height: initial;
                box-shadow: initial;
                background: initial;
                page-break-after: always;
            }
        }
    </style>


    <div class="book">
        <div class="page">
            <div class="row invoice">
                <div class="col-8">
                    <h3><?= $company['company_name'] ?></h3>
                    <br>
                </div>
                <div class="col-4 text-right">
                    <!-- <img src="<?= base_url('assets/images/' . $company['logo']) ?>" alt="logo"> -->
                </div>
            </div>
            <hr>
            <div class="title text-center">
                <h4 style="font-weight: bold;">Laporan Klaim

                    <?php if ($tanggal && $tanggal2 !== '') {
                    ?> Dari Tanggal <?= indo_date($tanggal) ?> Sampai Tanggal <?= indo_date($tanggal2) ?>
                    <?php } ?></h4>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-striped w-auto small" style="font-size: 12px;" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="text-align: center; width:15px">No</th>
                        <th style="width:150px">Nama Karyawan</th>
                        <th style="width:150px">Diagnosa</th>
                        <th style="width:150px">Nominal</th>
                        <th style="width:150px">Tanggal Berobat</th>
                        <th style="width:150px">Nama Perusahaan</th>
                        <th style="width:150px">Bukti</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1;
                    foreach ($report as $r => $data) { ?>
                        <tr>
                            <td style="text-align: center"><?= $no++ ?>.</td>
                            <td style="text-align: center"><?= $data->name ?></td>
                            <td style="text-align: center"><?= $data->description ?></td>
                            <td style="text-align: center"><?= indo_currency($data->nominal) ?></td>
                            <td style="text-align: center"><?= $data->date ?></td>
                            <td style="text-align: center"><?= $data->company_name ?></td>
                            <td style="text-align: center"><img src="<?= base_url('assets/images/bukti/') ?><?= $data->photo ?>" alt=""
                          style="width:50px; height:50px"></td>
                            <td style="text-align: center">
                        </tr>
                    <?php } ?>
                </tbody>
                </table>
            </div>
            <div class="row mt-2" style="font-size: smaller;">
                <div class="col-4">
                </div>
                <div class="col-4">
                </div>
                <div class="col-4 text-center">
                    Tanggal Cetak : <?= date('d') ?> <?= indo_month(date('m')) ?> <?= date('Y') ?>
                </div>
            </div>
        </div>
    </div>
</body>

</html>