<?php
require_once('../auth/cek_session.php');
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Mode Edukasi Budaya | Tradix</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

  <style>
    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
    .font-roboto { font-family: 'Roboto', sans-serif; }
  </style>
</head>
<body class="bg-[#9B4D1B] text-[#F9B233] min-h-screen px-4 py-6">

  <!-- Tombol Kembali -->
  <a href="home.php" class="absolute top-4 left-4 bg-[#F9B233] text-[#7A3B0E] px-4 py-2 rounded shadow font-bold text-xs hover:bg-[#f7c14a] z-10">
    ← Beranda
  </a>

  <!-- Judul -->
  <h1 class="text-center font-luckiest text-3xl mt-16 mb-8 drop-shadow-[2px_2px_0_#7A3B0E]">
    Mode Edukasi Budaya
  </h1>

  <!-- Menu Edukasi -->
  <div class="grid grid-cols-1 gap-4 max-w-md mx-auto text-[#7A3B0E] font-bold text-center">

    <a href="../edukasi/materi.php" class="bg-[#F9B233] p-6 rounded-xl shadow hover:bg-[#f7c14a] transition">
      <i class="fas fa-book text-2xl mb-2"></i><br>Bacaan Budaya
    </a>

    <a href="../edukasi/video.php" class="bg-[#F9B233] p-6 rounded-xl shadow hover:bg-[#f7c14a] transition">
      <i class="fas fa-video text-2xl mb-2"></i><br>Video Budaya
    </a>

    <a href="../edukasi/audio.php" class="bg-[#F9B233] p-6 rounded-xl shadow hover:bg-[#f7c14a] transition">
      <i class="fas fa-headphones text-2xl mb-2"></i><br>Audio Narasi
    </a>

  </div>

</body>
</html>
