<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

$poin = isset($_GET['poin']) ? intval($_GET['poin']) : 0;
$nama = $_SESSION['nama'];
$user_id = $_SESSION['user_id'];

// Simpan ke DB
if ($poin > 0) {
  $stmt = $koneksi->prepare("INSERT INTO multiplayer_score (user_id, nama, poin, tanggal) VALUES (?, ?, ?, NOW())");
  $stmt->bind_param("isi", $user_id, $nama, $poin);
  $stmt->execute();
  $stmt->close();

  // Update juga sesi
  $_SESSION['poin'] += $poin;
  $koneksi->query("UPDATE users SET poin = poin + $poin WHERE id = $user_id");
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <title>Hasil Multiplayer | Tradix</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#9B4D1B] text-[#F9B233] px-4 py-6 text-center">

  <h1 class="font-luckiest text-3xl drop-shadow-[2px_2px_0_#7A3B0E] mb-6">Hasil Battle!</h1>

  <div class="bg-[#B35A1B] rounded-xl p-6 max-w-md mx-auto shadow space-y-4">
    <p class="text-xl font-bold">Selamat, <?= htmlspecialchars($nama) ?>!</p>
    <p>Kamu mendapatkan:</p>
    <p class="text-3xl font-luckiest text-[#FFF5B0]"><?= $poin ?> poin</p>

    <a href="leaderboard.php" class="block mt-4 bg-[#F9B233] text-[#7A3B0E] font-bold py-2 px-4 rounded hover:bg-[#f7c14a] transition">
      🔥 Lihat Leaderboard
    </a>

    <a href="../screens/multiplayer.php" class="block mt-2 text-sm text-[#F9B233] underline">← Kembali ke Multiplayer</a>
  </div>

</body>
</html>
