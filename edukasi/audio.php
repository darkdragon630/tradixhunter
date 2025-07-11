<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

// Ambil semua data dari tabel audiomp3
$audio = $koneksi->query("SELECT * FROM audiomp3 ORDER BY id DESC")->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Audio Budaya | Tradix</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    /* Sembunyikan tombol titik tiga download */
    audio::-internal-media-controls-download-button {
      display: none;
    }
    audio::-webkit-media-controls-enclosure {
      overflow: hidden;
    }
    audio::-webkit-media-controls-panel {
      width: calc(100% - 35px);
    }
    html, body {
      height: 100%;
      overflow: hidden;
    }
  </style>
</head>
<body class="bg-[#9B4D1B] text-[#F9B233] font-sans h-full">

  <!-- Kontainer penuh agar bagian bawah bisa scroll -->
  <div class="h-full flex flex-col overflow-hidden">

    <!-- Header sticky -->
    <div class="sticky top-0 bg-[#9B4D1B] z-10 px-4 pt-6 pb-4">
      <a href="../screens/edukasi.php"
         class="text-sm bg-[#F9B233] text-[#7A3B0E] px-4 py-2 rounded shadow hover:bg-[#f7c14a] inline-block"
         id="btnKembali"
         rel="prefetch">
        ← Kembali
      </a>
      <h1 class="text-3xl font-bold mt-4 mb-2 text-white">Narasi Budaya Nusantara</h1>
    </div>

    <!-- Daftar audio scrollable -->
    <div class="flex-1 overflow-y-auto px-4 pb-6">
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
        <?php foreach ($audio as $a): ?>
          <div class="bg-[#F9B233] text-[#7A3B0E] rounded-lg shadow-lg p-4">
            <p class="text-lg font-semibold mb-2"><?= htmlspecialchars($a['judul']) ?></p>
            <audio controls controlsList="nodownload" class="w-full">
              <source src="stream_audio.php?file=<?= urlencode($a['audio']) ?>" type="audio/mpeg">
              Browser tidak mendukung pemutaran audio.
            </audio>
          </div>
        <?php endforeach; ?>
      </div>
    </div>
  </div>

  <script>
    // Hentikan semua audio saat klik tombol kembali
    document.addEventListener("DOMContentLoaded", () => {
      const tombolKembali = document.getElementById("btnKembali");
      const semuaAudio = document.querySelectorAll("audio");

      tombolKembali.addEventListener("click", () => {
        semuaAudio.forEach(audio => {
          if (!audio.paused) audio.pause();
        });
      });
    });
  </script>

</body>
</html>
