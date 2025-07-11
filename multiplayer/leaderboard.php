<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

// Ambil top 10 skor tertinggi
$query = $koneksi->query("SELECT * FROM multiplayer_score ORDER BY poin DESC, tanggal ASC LIMIT 10");
$top = $query->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Leaderboard Multiplayer | Tradix</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body class="bg-[#9B4D1B] text-[#F9B233] px-4 py-6">

  <a href="../screens/multiplayer.php" class="bg-[#F9B233] text-[#7A3B0E] px-4 py-2 rounded font-bold text-sm hover:bg-[#f7c14a]">
    ← Kembali
  </a>

  <h1 class="text-center font-luckiest text-3xl mt-6 mb-6 drop-shadow-[2px_2px_0_#7A3B0E]">
    Leaderboard Multiplayer
  </h1>

  <div class="bg-[#B35A1B] rounded-xl shadow p-4 max-w-md mx-auto space-y-3">
    <?php if (count($top) === 0): ?>
      <p class="text-center">Belum ada data skor.</p>
    <?php else: ?>
      <?php foreach ($top as $i => $p): ?>
        <div class="flex justify-between text-sm <?= $p['user_id'] == $_SESSION['user_id'] ? 'font-bold text-[#FFF5B0]' : '' ?>">
          <span>#<?= $i + 1 ?> <?= htmlspecialchars($p['nama']) ?></span>
          <span><?= number_format($p['poin']) ?> poin</span>
        </div>
      <?php endforeach; ?>
    <?php endif; ?>
  </div>

</body>
</html>
