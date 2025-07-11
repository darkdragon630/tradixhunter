<?php
require_once('../auth/cek_session.php');
$room = $_GET['room'] ?? 'jawa';
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">

  <title>Room <?= ucfirst($room) ?> | Tradix</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#9B4D1B] text-[#F9B233] px-4 py-6">

  <a href="lobby.php" class="bg-[#F9B233] text-[#7A3B0E] font-bold px-4 py-2 rounded shadow hover:bg-[#f7c14a] text-sm">
    ← Kembali ke Lobi
  </a>

  <h1 class="text-center font-luckiest text-2xl mt-6 mb-4">Room: <?= ucfirst($room) ?></h1>

  <div class="bg-[#B35A1B] p-4 rounded-xl shadow text-center font-roboto">
    <p>⏳ Menunggu pemain lain...</p>
    <p class="text-sm mt-2 text-[#fcd28d]">Fitur real-time belum aktif. Ini simulasi.</p>
  </div>

  <div class="text-center mt-6">
    <a href="../screens/quiz.php?wilayah=<?= $room ?>" class="bg-[#F9B233] text-[#7A3B0E] font-bold px-6 py-3 rounded shadow hover:bg-[#f7c14a] transition">
      Mulai Kuis Sendiri
    </a>
  </div>

</body>
</html>
