<?php if ($rowQuestion['last_rule'] != 'yes') : ?>
          <?php
          session_start();
          echo "<h4>Halo, " . $_SESSION['name'] . "</h4>";
          ?>
          <h5><?php echo $rowQuestion['isi_pertanyaan'] ?></h5>
          <div class="row justify-content-center mt-4">
            <a href="diagnose.php?kode=<?php echo $rowQuestion['ifyes'] . '"' ?>" style="min-width: 44px; min-height:44px; width:10%;" class="btn btn-outline-success mr-2">
              Iya
            </a>

          </div>
        <?php endif; ?>

        <?php if ($rowQuestion['last_rule'] == 'yes') : ?>
          <h3 class="text-left mb-4">Kesimpulan Diagnosa</h3>
          <?php
          include "functions/get_kesimpulan.php";
          session_start();
          $kodePenyakit = $rowQuestion['ifyes'];
          $kesimpulan = getKesimpulan($kodePenyakit);
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
        <?php endif; ?>
