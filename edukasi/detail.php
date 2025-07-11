<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

$id = intval($_GET['id']);
$q = $koneksi->query("SELECT * FROM materi WHERE id = $id");
$data = $q->fetch_assoc();

if (!$data) {
  echo "<p>Materi tidak ditemukan.</p>";
  exit;
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title><?= htmlspecialchars($data['judul']) ?> | Tradix</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <style>
    html, body {
      height: 100%;
      overflow: hidden;
    }
  </style>
</head>
<body class="bg-[#9B4D1B] text-[#F9B233] font-['Roboto'] h-full">

  <!-- Wrapper scroll -->
  <div class="h-full flex flex-col overflow-hidden">

    <!-- Tombol & Judul Sticky -->
    <div class="sticky top-0 z-10 bg-[#9B4D1B] px-4 pt-6 pb-4">
      <a href="materi.php" class="bg-[#F9B233] text-[#7A3B0E] px-4 py-2 rounded shadow font-bold text-xs hover:bg-[#f7c14a] transition inline-block">
        ← Kembali
      </a>
      <h1 class="font-luckiest text-3xl mt-4 drop-shadow-[2px_2px_0_#7A3B0E]">
        <?= htmlspecialchars($data['judul']) ?>
      </h1>
    </div>

    <!-- Konten scrollable -->
    <div class="flex-1 overflow-y-auto px-4 pb-6">
      <div class="text-sm leading-relaxed whitespace-pre-wrap font-roboto">
        <?= nl2br(htmlspecialchars($data['isi'])) ?>
      </div>
    </div>

  </div>

</body>
</html>
