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
  <title>Lobi Multiplayer | Tradix</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body class="bg-[#9B4D1B] text-[#F9B233] px-4 py-6">

  <a href="../screens/multiplayer.php" class="bg-[#F9B233] text-[#7A3B0E] font-bold px-4 py-2 rounded shadow hover:bg-[#f7c14a] text-sm">
    ← Beranda
  </a>

  <h1 class="text-center font-luckiest text-3xl mt-6 mb-6 drop-shadow-[2px_2px_0_#7A3B0E]">
    Lobi Multiplayer
  </h1>

  <div class="space-y-4 max-w-md mx-auto font-roboto">
    <?php
    $rooms = ['jawa', 'sumatera', 'kalimantan', 'sulawesi'];
    foreach ($rooms as $room):
    ?>
      <a href="room.php?room=<?= $room ?>" class="block bg-[#B35A1B] p-4 rounded-lg shadow hover:bg-[#9c4815] transition">
        <p class="text-lg font-bold capitalize">Room <?= $room ?></p>
        <p class="text-sm">Gabung untuk menjawab kuis budaya bersama</p>
      </a>
    <?php endforeach; ?>
  </div>

</body>
</html>
