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
        include('functions/conn.php');

        $kode = 'GD01&GD02';
        if (isset($_GET['kode'])) {
          $kode = $_GET['kode'];
        }
        ?>

        <?php if (!isset($_GET['kode']) && !isset($_GET['kesimpulan'])) : ?>
          <?php
          session_start();
          echo "<h3>Halo, " . $_SESSION['name'] . "</h3>";
          ?>
          <h2>Pilih Penyakit Yang Akan Diagnosa</h2>

          <div class="list-group">
            <?php
            $query = "SELECT * from tb_penyakit";
            $getAllData = mysqli_query($connect, $query);
            while ($datas = mysqli_fetch_array($getAllData)) {
              echo "<a href='diagnose.php?kode=" . $datas['kode_penyakit'] . "' class='list-group-item list-group-item-action'>" . $datas['penyakit'] . "</a>";
            }
            ?>
          </div>
        <?php endif; ?>

        <?php if (isset($_GET['kode']) && !isset($_GET['kesimpulan'])) : ?>
          <h4 class="mb-4">Pilih pertanyaan dibawah ini jika anda merasakan gejalanya </h4>
          <?php echo "<form action='diagnose.php?kesimpulan&kode=" . $kode . "'" . "method='post'>" ?>
          <?php
          $query = "SELECT * from tb_pertanyaan WHERE kode_pertanyaan='$kode'";
          $getAllData = mysqli_query($connect, $query);
          while ($datas = mysqli_fetch_array($getAllData)) {
            echo "<div class='checkbox text-left'> <label><input type='checkbox' name='check_list[]' value='" . $datas['isi_pertanyaan'] .  "'" . ">" . '<strong class="ml-3">' . $datas['isi_pertanyaan'] . '</strong>' . "</label></div>";
          }
          ?>
          <input type="submit" name="submit" value="Diagnosa" class="btn btn-primary mt-4" style="min-width: 44px; min-height:44px; width:10%;" />
          </form>
        <?php endif; ?>


        <?php if (isset($_GET['kesimpulan'])) : ?>

          <?php
          include "functions/get_kesimpulan.php";

          $query = "SELECT * from tb_pertanyaan WHERE kode_pertanyaan='$kode'";
          $getAllData = mysqli_query($connect, $query);
          $totalRows = mysqli_num_rows($getAllData);

          if (isset($_POST['submit'])) {
            if (!empty($_POST['check_list'])) {
              foreach ($_POST['check_list'] as $selected) {
                $selectedGejala[] = $selected;
              }
              if ($totalRows == count($selectedGejala)) {
          ?>

                <h3 class="text-left mb-4">Kesimpulan Diagnosa</h3>
                <?php
                session_start();
                $kesimpulan = getKesimpulan($kode);
                $dataGejala = $kesimpulan['fakta'];
                $gejala = str_replace("\\n", "\n", $dataGejala);
                $dataSolusi = $kesimpulan['solusi'];
                $solusi = str_replace("\\n", "\n", $dataSolusi);
                echo "<p class='text-left'>Nama : " . $_SESSION['name'] . "</p>";
                echo "<p class='text-left'>Alamat : " . $_SESSION['alamat'] . "</p>";

                ?>
                <p class="my-4 text-left font-weight-bold">Nama Penyakit : <?php echo $kesimpulan['nama_penyakit'] ?></p>
                <br>
                <b>
                  <p class="mb-2 text-left">Gejala yang anda rasakan : </p>
                </b>
                <?php echo "<pre class='mt-3 mb-0 text-left'>" . nl2br($gejala) . "</pre>" ?>
                <b>
                  <p class="mb-2 mt-4 text-left">Solusi Untuk Anda : </p>
                </b>
                <?php echo "<pre class='mt-3 mb-0 text-left'>" . nl2br($solusi) . "</pre>" ?>

          <?php  } else {
                echo  "<h2>Sistem tidak dapat mendeteksi </h2>";
                echo "<a href='diagnose.php' class='btn btn-primary'>Ulangi Kembali</a>";
              }
            }
          }
          ?>
        <?php endif; ?>




      </div>
  </section><!-- End Services Section -->
</main>

<?php include("footer.php") ?>