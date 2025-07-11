<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

// Ambil user ID
$user_id = $_SESSION['user_id'] ?? null;
if (!$user_id) {
  header("Location: ../auth/login.php");
  exit;
}

require_once('../functions/sync_poin.php');
syncUserPoin($koneksi, $user_id);

// Ambil data user dari database
$query = $koneksi->prepare("SELECT * FROM users WHERE id = ?");
$query->bind_param("i", $user_id);
$query->execute();
$result = $query->get_result();
$user = $result->fetch_assoc();
$query->close();
?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Profil | Tradix</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <style>
    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
    .font-roboto { font-family: 'Roboto', sans-serif; }
  </style>
</head>
<body class="bg-[#9B4D1B] min-h-screen flex flex-col items-center justify-start px-6 py-8 font-roboto">

  <h1 class="font-luckiest text-3xl text-[#F9B233] drop-shadow-[2px_2px_0_#7A3B0E] mb-6">Profil Saya</h1>

  <div class="bg-[#B35A1B] w-full max-w-md rounded-xl p-6 shadow-md text-center space-y-4">
    <img src="../assets/images/<?= htmlspecialchars($user['avatar'] ?? 'default.png'); ?>" alt="Avatar" class="w-24 h-24 mx-auto rounded-full border-4 border-[#7A3B0E]">
    
    <p class="text-[#F9B233] text-lg font-bold"><?= htmlspecialchars($user['nama'] ?? 'Pengguna'); ?></p>
    <p class="text-[#F9B233] text-sm">Email: <?= htmlspecialchars($user['email'] ?? '-'); ?></p>
    <p class="text-[10px] text-[#F9B233]">Poin Budaya: <strong id="poinText">Memuat...</strong></p>

    <div class="space-y-2 mt-4">
      <a href="edit_profile.php" class="block bg-[#F9B233] text-[#7A3B0E] font-semibold py-2 rounded-md hover:bg-[#f7c14a] transition">
        <i class="fas fa-edit mr-2"></i> Edit Profil
      </a>
      <a href="ubah_password.php" class="block bg-[#F9B233] text-[#7A3B0E] font-semibold py-2 rounded-md hover:bg-[#f7c14a] transition">
        <i class="fas fa-key mr-2"></i> Ganti Kata Sandi
      </a>
      <a href="../auth/logout.php" class="block bg-red-500 text-white font-semibold py-2 rounded-md hover:bg-red-600 transition">
        <i class="fas fa-sign-out-alt mr-2"></i> Keluar
      </a>
    </div>

    <div class="mt-4">
      <a href="home.php" class="inline-block bg-[#F9B233] text-[#7A3B0E] font-bold px-6 py-2 rounded-md shadow hover:bg-[#f7c14a] transition">
        <i class="fas fa-arrow-left mr-2"></i> Kembali ke Home
      </a>
    </div>
  </div>

<script>
  async function fetchPoin() {
    try {
      const res = await fetch('../auth/get_poin.php', {
        headers: { 'Accept': 'application/json' }
      });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const data = await res.json();
      if (data.success && typeof data.poin === 'number') {
        const poinEl = document.getElementById('poinText');
        poinEl.textContent = new Intl.NumberFormat().format(data.poin);
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
