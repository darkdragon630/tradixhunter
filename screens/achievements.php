<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

$id = $_SESSION['user_id'];

// Ambil daftar pencapaian dari rewards_log
$query = $koneksi->prepare("SELECT * FROM rewards_log WHERE user_id = ? ORDER BY waktu DESC");
$query->bind_param("i", $id);
$query->execute();
$result = $query->get_result();
$pencapaian = $result->fetch_all(MYSQLI_ASSOC);
$query->close();
?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Pencapaian | Tradix</title>

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

  <!-- Judul Tetap -->
  <div class="mt-20 mb-4 text-center px-4">
    <h1 class="font-luckiest text-3xl text-[#F9B233] drop-shadow-[2px_2px_0_#7A3B0E]">
      Pencapaian Saya
    </h1>
  </div>

  <!-- Daftar Scrollable -->
  <div class="flex-1 overflow-y-auto px-4 pb-6">
    <div class="space-y-4 max-w-md mx-auto">
      <?php if (count($pencapaian) === 0): ?>
        <div class="text-center text-[#F9B233] font-roboto bg-[#B35A1B] p-4 rounded-lg shadow">
          Belum ada pencapaian.
        </div>
      <?php else: ?>
        <?php foreach ($pencapaian as $row): ?>
          <div class="bg-[#B35A1B] text-[#F9B233] rounded-lg shadow p-4">
            <div class="flex justify-between items-start mb-1">
              <div class="flex items-center space-x-2">
                <span class="bg-[#F9B233] text-[#7A3B0E] px-2 py-1 text-[10px] font-bold rounded-full">KUIS SELESAI</span>
                <p class="font-bold text-sm"><?= strtoupper(htmlspecialchars($row['wilayah'])); ?></p>
              </div>
              <p class="text-[10px]"><?= date('d M Y, H:i', strtotime($row['waktu'])); ?></p>
            </div>
            <p class="mt-1 text-sm">🎁 <?= htmlspecialchars($row['item']); ?></p>
            <p class="text-xs">+<?= number_format((int)$row['reward_poin'], 0, ',', '.') ?> poin budaya</p>
          </div>
        <?php endforeach; ?>
      <?php endif; ?>
    </div>
  </div>

</body>
</html>
