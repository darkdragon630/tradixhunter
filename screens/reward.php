<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');
require_once('../functions/sync_poin.php');

$user_id = $_SESSION['user_id'] ?? null;
if (!$user_id) {
  header('Location: ../auth/login.php');
  exit;
}

$reward = $_GET['reward'] ?? '0 Koin Budaya';
$item = $_GET['item'] ?? 'Item Budaya';
$wilayah = strtolower($_GET['wilayah'] ?? '');
$rewardPoin = (int) filter_var($reward, FILTER_SANITIZE_NUMBER_INT);

$urutanWilayah = ['jawa', 'sumatera', 'kalimantan', 'sulawesi', 'ntt', 'papua'];
if (!in_array($wilayah, $urutanWilayah)) die("Wilayah tidak valid.");

// Cek apakah reward sudah diberikan
$cek = $koneksi->prepare("SELECT id FROM rewards_log WHERE user_id = ? AND wilayah = ?");
$cek->bind_param("is", $user_id, $wilayah);
$cek->execute();
$cek->store_result();
$alreadyGiven = $cek->num_rows > 0;
$cek->close();

if (!$alreadyGiven) {
  if ($rewardPoin > 0) {
    $stmt = $koneksi->prepare("UPDATE users SET poin = poin + ? WHERE id = ?");
    $stmt->bind_param("ii", $rewardPoin, $user_id);
    $stmt->execute();
    $stmt->close();
  }

  $stmt = $koneksi->prepare("UPDATE progress_user SET selesai = 1 WHERE user_id = ? AND wilayah = ?");
  $stmt->bind_param("is", $user_id, $wilayah);
  $stmt->execute();
  $stmt->close();

  $stmt = $koneksi->prepare("INSERT INTO rewards_log (user_id, wilayah, item, reward_poin) VALUES (?, ?, ?, ?)");
  $stmt->bind_param("issi", $user_id, $wilayah, $item, $rewardPoin);
  $stmt->execute();
  $stmt->close();

  $reward_id = uniqid();
  $gambar = '';
  $stmt = $koneksi->prepare("INSERT INTO koleksi (user_id, reward_id, nama_reward, gambar) VALUES (?, ?, ?, ?)");
  $stmt->bind_param("isss", $user_id, $reward_id, $item, $gambar);
  $stmt->execute();
  $stmt->close();

  $index = array_search($wilayah, $urutanWilayah);
  if ($index !== false && isset($urutanWilayah[$index + 1])) {
    $next = $urutanWilayah[$index + 1];
    $cekNext = $koneksi->prepare("SELECT id FROM progress_user WHERE user_id = ? AND wilayah = ?");
    $cekNext->bind_param("is", $user_id, $next);
    $cekNext->execute();
    $cekNext->store_result();
    if ($cekNext->num_rows === 0) {
      $stmt = $koneksi->prepare("INSERT INTO progress_user (user_id, wilayah, level, selesai) VALUES (?, ?, 1, 0)");
      $stmt->bind_param("is", $user_id, $next);
      $stmt->execute();
      $stmt->close();
    }
    $cekNext->close();
  }

  // Sinkronkan kembali
  syncUserPoin($koneksi, $user_id);
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Reward Petualangan</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&display=swap" rel="stylesheet">
  <style>
    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
    .font-roboto   { font-family: 'Roboto', sans-serif; }
  </style>
</head>
<body class="bg-[#9B4D1B] min-h-screen flex items-center justify-center px-4 py-8 font-roboto">
  <div class="bg-[#B35A1B] max-w-md w-full rounded-xl p-6 shadow-lg text-center text-[#F9B233]">
    <h1 class="font-luckiest text-3xl mb-4 drop-shadow-[2px_2px_0_#7A3B0E]">Selamat!</h1>
    <p class="text-lg font-bold mb-2">Kamu berhasil menyelesaikan misi budaya 🎉</p>
    <div class="my-6">
      <p class="text-sm">Reward:</p>
      <p class="text-2xl font-bold"><?= htmlspecialchars($reward); ?></p>
      <p class="text-lg mt-2">Item Baru: <strong><?= htmlspecialchars($item); ?></strong></p>
    </div>
    <a href="map.php" class="mt-6 inline-block bg-[#F9B233] text-[#7A3B0E] font-bold py-2 px-6 rounded hover:bg-[#f7c14a] transition">
      Lanjut Petualangan
    </a>
  </div>
</body>
</html>
