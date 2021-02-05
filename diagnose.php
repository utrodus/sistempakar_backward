<?php include("header.php") ?>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top">
  <div class="container d-flex ">

    <h1 class="logo mr-auto"><a href="index.php">Sistem Pakar</a></h1>
    <!-- Uncomment below if you prefer to use an image logo -->
    <!-- <a href="index.php" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

    <nav class="nav-menu d-none d-lg-block">
      <ul>
        <li><a href="reset_datadiri.php">Kembali Ke Halaman Utama</a></li>
      </ul>
    </nav><!-- .nav-menu -->


  </div>
</header><!-- End Header -->



<div class="mt-5 mb-5">
</div>


<main>
  <!-- ======= Services Section ======= -->
  <section id="services" class="services ">
    <div class="container">

      <div class="section-title mt-4">
        <?php
        include "functions/get_question.php";
        include('functions/conn.php');

        $kode = 'GD01&GD02';
        if (isset($_GET['kode'])) {
          $kode = $_GET['kode'];
        }
        $rowQuestion = getQuestion($kode);
        ?>
        <h2>Pilih Penyakit Yang Akan Diagnosa</h2>
        <div class="list-group">
          <?php

          $query = "SELECT * from tb_penyakit";
          $getAllData = mysqli_query($connect, $query);
          while ($datas = mysqli_fetch_array($getAllData)) {
            echo "<a href='diagnosa.php?kode=" . $datas['kode_penyakit'] . "' class='list-group-item list-group-item-action'>" . $datas['penyakit'] . "</a>";
          }
          ?>
        </div>

      </div>
  </section><!-- End Services Section -->
</main>

<?php include("footer.php") ?>