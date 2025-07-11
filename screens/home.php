<?php
session_start();
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');
require_once('../functions/sync_poin.php');

// ✅ Ambil user ID lebih awal
$user_id = $_SESSION['user_id'] ?? null;
$nama = $_SESSION['nama'] ?? 'Pengguna';
$avatar = $_SESSION['avatar'] ?? 'default.png';

// ✅ Sinkronisasi poin jika login
if ($user_id) {
  syncUserPoin($koneksi, $user_id);
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Beranda | Tradix</title>

  <!-- Preload halaman penting -->
  <link rel="prefetch" href="profile.php">
  <link rel="prefetch" href="map.php">
  <link rel="prefetch" href="achievements.php">
  <link rel="prefetch" href="collection.php">
  <link rel="prefetch" href="edukasi.php">
  <link rel="prefetch" href="multiplayer.php">

  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="../assets/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

  <style>
    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
    .font-roboto { font-family: 'Roboto', sans-serif; }
    button:active { transform: scale(0.98); }
  </style>
</head>
<body class="bg-[#9B4D1B] min-h-screen flex flex-col justify-between items-center px-4 pt-6 pb-4 relative overflow-hidden font-roboto">

  <!-- Header user -->
  <div class="absolute top-4 left-4 z-10">
    <div class="flex items-center bg-[#B35A1B] px-3 py-1 rounded-xl shadow-lg">
      <img src="../assets/images/<?= htmlspecialchars($avatar) ?>" class="w-8 h-8 rounded-full border-2 border-[#7A3B0E]" alt="Avatar">
      <div class="ml-2">
        <p class="font-luckiest text-[#F9B233] text-xs leading-4 drop-shadow-[1px_1px_0_#7A3B0E] truncate max-w-[100px]">
          <?= htmlspecialchars($nama) ?>
        </p>
        <p class="text-[10px] text-[#F9B233]">Poin Budaya: <strong id="poinText">Memuat...</strong></p>
      </div>
    </div>
  </div>

  <!-- Tombol Settings -->
  <button onclick="goTo('profile.php')"
     class="absolute top-4 right-4 bg-[#F9B233] text-[#7A3B0E] font-bold py-2 px-4 rounded-full shadow hover:bg-[#f7c14a] transition text-xs z-10">
    <i class="fas fa-cog mr-1"></i> Settings
  </button>

  <!-- Menu Tengah -->
  <div class="w-full max-w-md flex flex-col items-center justify-center flex-grow space-y-3 mt-8 mb-6">
    <button onclick="goTo('edukasi.php')" class="block w-full bg-[#7A3B0E] text-[#F9B233] text-center font-bold py-3 rounded-xl shadow hover:bg-[#5a2a0a] transition">
      <i class="fas fa-book mr-2"></i> Mode Edukasi Budaya
    </button>
    <button onclick="goTo('multiplayer.php')" class="block w-full bg-[#7A3B0E] text-[#F9B233] text-center font-bold py-3 rounded-xl shadow hover:bg-[#5a2a0a] transition">
      <i class="fas fa-users mr-2"></i> Battle Multiplayer
    </button>
  </div>

  <!-- Menu Bawah -->
  <div class="grid grid-cols-3 gap-4 max-w-md w-full">
    <button onclick="goTo('achievements.php')" class="bg-[#F9B233] text-[#7A3B0E] rounded-xl p-4 flex flex-col items-center justify-center shadow-md hover:bg-[#f7c14a] transition">
      <i class="fas fa-award text-xl"></i>
      <span class="mt-2 font-bold text-xs text-center">Pencapaian</span>
    </button>
    <button onclick="goTo('map.php')" class="bg-[#F9B233] text-[#7A3B0E] rounded-xl p-4 flex flex-col items-center justify-center shadow-md hover:bg-[#f7c14a] transition">
      <i class="fas fa-map text-xl"></i>
      <span class="mt-2 font-bold text-xs text-center">Petualangan</span>
    </button>
    <button onclick="goTo('collection.php')" class="bg-[#F9B233] text-[#7A3B0E] rounded-xl p-4 flex flex-col items-center justify-center shadow-md hover:bg-[#f7c14a] transition">
      <i class="fas fa-box-open text-xl"></i>
      <span class="mt-2 font-bold text-xs text-center">Koleksi</span>
    </button>
  </div>

  <script>
    function goTo(url) {
      window.location.replace(url);
    }

    async function fetchPoin() {
      try {
        const res = await fetch('../auth/get_poin.php', { headers: { 'Accept': 'application/json' } });
        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        const data = await res.json();
        if (data.success && typeof data.poin === 'number') {
          document.getElementById('poinText').textContent = new Intl.NumberFormat().format(data.poin);
        }
      } catch (err) {
        console.error('Gagal memuat poin:', err.message);
      }
    }

    fetchPoin();
    setInterval(fetchPoin, 5000);
  </script>

</body>
</html>
