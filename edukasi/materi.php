<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

// Ambil semua materi terbaru
$query = $koneksi->query("SELECT * FROM materi ORDER BY created_at DESC");
$materi = $query->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Materi Budaya | Tradix</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <style>
    body, html {
      height: 100%;
      overflow: hidden;
    }
  </style>
</head>
<body class="bg-[#9B4D1B] font-['Roboto'] h-full">

  <!-- Kontainer scroll -->
  <div class="h-full flex flex-col overflow-hidden">

    <!-- Tombol Kembali -->
    <div class="absolute top-4 left-4 z-20">
      <a href="../screens/edukasi.php"
         class="bg-[#F9B233] text-[#7A3B0E] px-4 py-2 rounded shadow font-bold text-xs hover:bg-[#f7c14a] transition">
        ← Kembali
      </a>
    </div>

    <!-- Judul sticky -->
    <div class="sticky top-0 z-10 bg-[#9B4D1B] px-4 pt-16 pb-4">
      <h1 class="text-center font-luckiest text-3xl text-[#F9B233] drop-shadow-[2px_2px_0_#7A3B0E]">
        Materi Budaya Nusantara
      </h1>
    </div>

    <!-- Daftar isi scrollable -->
    <div class="flex-1 overflow-y-auto px-4 pb-6">
      <div class="space-y-4 max-w-md mx-auto">
        <?php if (count($materi) == 0): ?>
          <div class="bg-[#B35A1B] p-4 text-center text-[#F9B233] rounded-xl shadow">
            Belum ada materi budaya tersedia.
          </div>
        <?php else: ?>
          <?php foreach ($materi as $m): ?>
            <a href="detail.php?id=<?= $m['id'] ?>" class="block bg-[#B35A1B] text-[#F9B233] p-4 rounded-xl shadow hover:bg-[#9c4815] transition">
              <h2 class="font-bold text-lg"><?= htmlspecialchars($m['judul']) ?></h2>
              <p class="text-sm mt-1"><?= mb_strimwidth(strip_tags($m['isi']), 0, 100, "...") ?></p>
            </a>
          <?php endforeach; ?>
        <?php endif; ?>
      </div>
    </div>

  </div>
</body>
</html>