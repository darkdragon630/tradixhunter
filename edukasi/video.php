<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

// Ambil data video dari database
$video = $koneksi->query("SELECT * FROM video_youtube ORDER BY id DESC")->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Video Budaya | Tradix</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    html, body {
      height: 100%;
      overflow: hidden;
    }
  </style>
</head>
<body class="bg-[#9B4D1B] text-[#F9B233] font-sans h-full">

  <!-- Kontainer utama -->
  <div class="h-full flex flex-col overflow-hidden">

    <!-- Header tetap di atas -->
    <div class="sticky top-0 z-10 bg-[#9B4D1B] px-4 pt-6 pb-4">
      <a href="../screens/edukasi.php"
         class="text-sm bg-[#F9B233] text-[#7A3B0E] px-4 py-2 rounded shadow hover:bg-[#f7c14a] inline-block"
         id="btnKembali"
         rel="prefetch">
        ← Kembali
      </a>
      <h1 class="text-3xl font-bold mt-4 mb-2">Video Budaya Nusantara</h1>
    </div>

    <!-- Daftar video -->
    <div class="flex-1 overflow-y-auto px-4 pb-6">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <?php foreach ($video as $v): ?>
          <div class="bg-[#F9B233] text-[#7A3B0E] rounded-lg shadow-lg p-4">
            <p class="font-bold text-lg mb-2"><?= htmlspecialchars($v['judul']) ?></p>
            <div class="aspect-video">
              <iframe class="w-full h-full rounded-md"
                      src="https://www.youtube.com/embed/<?= htmlspecialchars($v['youtube_id']) ?>?rel=0&modestbranding=1&showinfo=0"
                      title="<?= htmlspecialchars($v['judul']) ?>"
                      frameborder="0"
                      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                      allowfullscreen>
              </iframe>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    </div>
  </div>

  <script>
    // Hentikan semua video YouTube saat klik tombol kembali
    document.addEventListener("DOMContentLoaded", () => {
      const tombolKembali = document.getElementById("btnKembali");

      tombolKembali.addEventListener("click", () => {
        // Reload semua iframe agar audio/video dihentikan
        document.querySelectorAll("iframe").forEach(iframe => {
          iframe.src = iframe.src;
        });
      });
    });
  </script>

</body>
</html>
