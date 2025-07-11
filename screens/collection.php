<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

$id = $_SESSION['user_id'];

// Ambil semua koleksi dari rewards_log
$query = $koneksi->prepare("SELECT * FROM rewards_log WHERE user_id = ? ORDER BY waktu DESC");
$query->bind_param("i", $id);
$query->execute();
$result = $query->get_result();
$koleksi = $result->fetch_all(MYSQLI_ASSOC);
$query->close();
?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Koleksi Budaya | Tradix</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

  <style>
    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
    .font-roboto { font-family: 'Roboto', sans-serif; }
    html, body {
      overscroll-behavior: none;
      touch-action: manipulation;
      height: 100%;
    }
  </style>
</head>
<body class="bg-[#9B4D1B] font-roboto flex flex-col h-screen overflow-hidden">

  <!-- Tombol Kembali -->
  <a href="home.php" class="fixed top-4 left-4 bg-[#F9B233] text-[#7A3B0E] font-bold py-2 px-4 rounded-full shadow hover:bg-[#f7c14a] transition text-xs z-10">
    <i class="fas fa-arrow-left mr-1"></i> Beranda
  </a>

  <!-- Judul -->
  <div class="mt-20 mb-4 text-center px-4">
    <h1 class="font-luckiest text-3xl text-[#F9B233] drop-shadow-[2px_2px_0_#7A3B0E]">
      Koleksi Budaya
    </h1>
  </div>

  <!-- Daftar Scrollable -->
  <div class="flex-1 overflow-y-auto px-4 pb-6">
    <div class="grid grid-cols-1 gap-4 max-w-md mx-auto">
      <?php if (count($koleksi) === 0): ?>
        <div class="text-center text-[#F9B233] font-roboto bg-[#B35A1B] p-4 rounded-lg shadow">
          Belum ada koleksi yang dikumpulkan.
        </div>
      <?php else: ?>
        <?php foreach ($koleksi as $item): ?>
          <div class="bg-[#B35A1B] text-[#F9B233] rounded-xl shadow-md p-4 font-roboto">
            <div class="flex justify-between items-start">
              <div>
                <span class="text-sm font-bold block">🎁 <?= htmlspecialchars($item['item']); ?></span>
                <span class="text-xs text-white bg-[#F9B233] text-[#7A3B0E] rounded-full px-2 py-[2px] inline-block mt-1">
                  Didapat dari Kuis
                </span>
              </div>
              <div class="text-right">
                <p class="text-xs"><?= date('d M Y', strtotime($item['waktu'])); ?></p>
                <p class="text-[10px]">Wilayah: <?= ucfirst($item['wilayah']); ?></p>
              </div>
            </div>
            <p class="text-xs mt-2">+<?= number_format((int)$item['reward_poin'], 0, ',', '.') ?> poin budaya</p>
          </div>
        <?php endforeach; ?>
      <?php endif; ?>
    </div>
  </div>

</body>
</html>
