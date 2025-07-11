<?php
require_once('../auth/cek_session.php');
$wilayah = $_GET['wilayah'] ?? 'jawa';
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
   <!-- ⚠️ Tambahkan ini -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Memulai Petualangan...</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <meta http-equiv="refresh" content="3;url=quiz.php?wilayah=<?= urlencode($wilayah); ?>">
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&display=swap" rel="stylesheet">
  <style>
    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
  </style>
</head>
<body class="bg-[#9B4D1B] flex items-center justify-center min-h-screen text-center">
  <div class="text-[#F9B233]">
    <h1 class="text-4xl font-luckiest drop-shadow-[2px_2px_0_#7A3B0E] mb-4">Memulai Petualangan...</h1>
    <div class="animate-pulse text-lg font-bold">Wilayah: <?= ucfirst($wilayah); ?></div>
    <div class="mt-6">
      <svg class="animate-spin h-12 w-12 text-[#F9B233] mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="#7A3B0E" stroke-width="4"></circle>
        <path class="opacity-75" fill="#F9B233" d="M4 12a8 8 0 018-8v8H4z" />
      </svg>
    </div>
  </div>
</body>
</html>
