<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');
require_once('../functions/sync_poin.php');

$user_id = $_SESSION['user_id'] ?? null;
if (!$user_id) {
  header("Location: ../auth/login.php");
  exit;
}

// ✅ Sync poin dari rewards_log
syncUserPoin($koneksi, $user_id);

// Ambil avatar & nama
$avatar = $_SESSION['avatar'] ?? 'default.png';
$nama   = $_SESSION['nama'] ?? 'Pengguna';

// Daftar wilayah dan posisi pin
$wilayahList = [
  ['nama' => 'Jawa', 'x' => 37.83, 'y' => 59.13],
  ['nama' => 'Sumatera', 'x' => 15.61, 'y' => 36.90],
  ['nama' => 'Kalimantan', 'x' => 42.33, 'y' => 35.71],
  ['nama' => 'Sulawesi', 'x' => 56.35, 'y' => 42.46],
  ['nama' => 'NTT', 'x' => 57.67, 'y' => 62.30],
  ['nama' => 'Papua', 'x' => 90.21, 'y' => 48.81],
];
$urutanWilayah = array_map(fn($w) => strtolower($w['nama']), $wilayahList);

// Ambil progress user
$progress = [];
$res = mysqli_query($koneksi, "SELECT wilayah, level, selesai FROM progress_user WHERE user_id = $user_id");
while ($row = mysqli_fetch_assoc($res)) {
  $progress[strtolower($row['wilayah'])] = $row;
}

// ✅ Buka wilayah pertama jika belum ada
if (!isset($progress['jawa'])) {
  mysqli_query($koneksi, "INSERT INTO progress_user (user_id, wilayah, level, selesai) VALUES ($user_id, 'jawa', 1, 0)");
  $progress['jawa'] = ['wilayah' => 'jawa', 'level' => 1, 'selesai' => 0];
}

// ✅ Buka wilayah berikutnya jika sebelumnya sudah selesai
foreach ($urutanWilayah as $i => $wil) {
  if ($i > 0) {
    $prev = $urutanWilayah[$i - 1];
    if (isset($progress[$prev]) && $progress[$prev]['selesai'] == 1 && !isset($progress[$wil])) {
      mysqli_query($koneksi, "INSERT INTO progress_user (user_id, wilayah, level, selesai) VALUES ($user_id, '$wil', 1, 0)");
      $progress[$wil] = ['wilayah' => $wil, 'level' => 1, 'selesai' => 0]; // ✅ penting
      break;
    }
  }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Peta Petualangan | Tradix</title>

  <!-- Preload gambar WebP -->
  <link rel="preload" as="image" href="../assets/images/petaindonesia.webp" fetchpriority="high">
  <link rel="prefetch" href="home.php">

  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

  <style>
    html, body {
      height: 100%;
      overflow: hidden;
      touch-action: none;
    }
    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
    .font-roboto { font-family: 'Roboto', sans-serif; }
    @keyframes pulse-glow {
      0% { box-shadow: 0 0 0px #F9B233; }
      50% { box-shadow: 0 0 10px #F9B233; }
      100% { box-shadow: 0 0 0px #F9B233; }
    }
    @keyframes fadeZoom {
      from { opacity: 0; transform: scale(0.95); }
      to { opacity: 1; transform: scale(1); }
    }
    @keyframes bounceIn {
      0% { transform: translate(-50%, 100%) scale(0.8); opacity: 0; }
      60% { transform: translate(-50%, -20%) scale(1.05); opacity: 1; }
      100% { transform: translate(-50%, -50%) scale(1); opacity: 1; }
    }
    .pulse { animation: pulse-glow 2s infinite; }
    .fade-zoom-in { animation: fadeZoom 0.6s ease-out both; }
    .pin-animate { animation: bounceIn 0.8s ease forwards; }
    .map-container {
      position: relative;
      width: 100%;
      max-width: 1000px;
      aspect-ratio: 1536 / 1024;
      margin: auto;
    }
    .bg-map {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
    .pin-wilayah {
      position: absolute;
      background-color: #F9B233;
      color: #7A3B0E;
      font-size: 11px;
      font-weight: bold;
      padding: 6px 10px;
      border-radius: 14px;
      white-space: nowrap;
      z-index: 20;
      cursor: pointer;
      opacity: 0;
      transform: translate(-50%, 100%);
    }
    .pin-wilayah::after {
      content: "";
      position: absolute;
      bottom: -6px;
      left: 50%;
      transform: translateX(-50%);
      border-left: 6px solid transparent;
      border-right: 6px solid transparent;
      border-top: 8px solid #F9B233;
    }
    .pin-wilayah:hover { background-color: #f7c14a; }
    .grayscale { filter: grayscale(100%); pointer-events: none; }
  </style>
</head>

<body class="bg-[#9B4D1B] font-roboto h-full w-full overflow-hidden">
<audio id="clickSound" src="../assets/audio/click.mp3" preload="auto"></audio>

<!-- Header -->
<div class="flex justify-between items-center px-4 pt-4 absolute top-0 left-0 w-full z-30">
  <div class="bg-[#B35A1B] px-3 py-1 rounded-lg shadow flex items-center space-x-2">
    <img src="../assets/images/<?= htmlspecialchars($avatar) ?>" class="w-8 h-8 rounded-full border border-[#7A3B0E]" />
    <div>
      <p class="text-xs font-luckiest text-[#F9B233]"><?= htmlspecialchars($nama) ?></p>
      <p class="text-[10px] text-[#F9B233]">Poin Budaya: <strong id="poinText">Memuat...</strong></p>
    </div>
  </div>
  <a id="btnBeranda" href="home.php"
     class="bg-[#F9B233] text-[#7A3B0E] font-bold px-3 py-2 rounded shadow text-xs ml-2" rel="prefetch">
    <i class="fas fa-arrow-left mr-1"></i> Beranda
  </a>
</div>

<!-- Judul -->
<h1 class="font-luckiest text-center text-[#F9B233] text-2xl mt-24 mb-4 drop-shadow-md">Peta Petualangan</h1>

<!-- Peta -->
<div class="map-container fade-zoom-in">
  <picture>
    <source srcset="../assets/images/petaindonesia.webp?v=<?= time(); ?>" type="image/webp">
    <img src="../assets/images/petaindonesia.png?v=<?= time(); ?>" alt="Peta Indonesia" class="bg-map" loading="eager" />
  </picture>

  <?php foreach ($wilayahList as $i => $w):
    $wil = strtolower($w['nama']);
    $isUnlocked = isset($progress[$wil]);
    $isSelesai  = $isUnlocked && $progress[$wil]['selesai'];
    $class = 'pin-wilayah pulse pin-animate';
    if (!$isUnlocked) $class .= ' opacity-50 grayscale';
    $link = 'loading.php?wilayah=' . $wil;
    $desc = 'Jelajahi budaya ' . $w['nama'] . ' di Tradix!';
    $delay = 0.2 + ($i * 0.1);
  ?>
    <div class="<?= $class ?>" style="top:<?= $w['y'] ?>%; left:<?= $w['x'] ?>%; animation-delay:<?= $delay ?>s"
         onclick="<?= $isUnlocked ? "playClick(); openModal('{$w['nama']}', '{$desc}', '{$link}')" : '' ?>">
      <?= $w['nama'] ?><?= $isSelesai ? ' ✅' : '' ?>
    </div>
  <?php endforeach; ?>
</div>

<!-- Modal -->
<div id="modalInfo" class="fixed inset-0 bg-black/50 z-50 hidden items-center justify-center p-4">
  <div class="bg-[#FFF3E0] text-[#7A3B0E] w-full max-w-sm rounded-xl p-6 text-center shadow-xl relative">
    <button onclick="closeModal()" class="absolute top-2 right-3 text-[#7A3B0E] text-xl font-bold">&times;</button>
    <h2 id="modalJudul" class="font-bold text-lg mb-2"></h2>
    <p id="modalIsi" class="text-sm leading-relaxed mb-4"></p>
    <button id="btnMulai" class="bg-[#F9B233] text-[#7A3B0E] font-bold px-4 py-2 rounded hover:bg-[#f7c14a] transition">Mulai Kuis</button>
  </div>
</div>

<!-- Tombol Petunjuk -->
<button onclick="openGuide()" class="fixed bottom-4 right-4 bg-[#F9B233] text-[#7A3B0E] font-bold px-4 py-2 rounded-full shadow hover:bg-[#f7c14a] z-40 text-sm">
  ❓ Petunjuk
</button>

<!-- Modal Petunjuk -->
<div id="modalGuide" class="fixed inset-0 bg-black/50 z-50 hidden items-center justify-center p-4">
  <div class="bg-[#FFF3E0] text-[#7A3B0E] w-full max-w-lg rounded-xl p-6 text-sm shadow-xl relative overflow-y-auto max-h-[90vh] font-roboto">
    <button onclick="closeGuide()" class="absolute top-2 right-3 text-[#7A3B0E] text-xl font-bold">&times;</button>

    <h2 class="font-bold text-lg mb-3 text-center">🎮 Petunjuk Game – “TRADIX: The Heritage Hunt”</h2>
    
    <p>Selamat datang di <strong>TRADIX</strong>, game petualangan edukatif seru yang akan menguji pengetahuanmu tentang budaya Indonesia!</p>
    <p class="mt-2">Untuk menyelesaikan permainan ini, kamu harus menyelesaikan setiap <em>level</em> dengan benar. Di setiap level, kamu akan menghadapi soal-soal interaktif seputar <em>adat, tradisi, dan budaya lokal</em>.</p>

    <hr class="my-3 border-[#F9B233]">

    <h3 class="font-bold text-base mb-2">🕹️ Cara Bermain:</h3>
    <ol class="list-decimal ml-5 space-y-3">
      <li>
        <strong>🔓 Mulai dari Level 1.</strong><br>
        <span class="ml-2 block">• Setiap level terdiri dari <em>1 hingga 15 soal pilihan ganda</em>.</span>
        <span class="ml-2 block">• Soal mencakup gambar, audio, atau video singkat.</span>
      </li>
      <li>
        <strong>✅ Jawab dengan Benar.</strong><br>
        <span class="ml-2 block">• Pilih <em>jawaban yang benar</em> dari 4 opsi yang tersedia.</span>
        <span class="ml-2 block">• Jika jawabanmu benar, kamu akan lanjut ke soal berikutnya.</span>
        <span class="ml-2 block">• Jika jawabanmu salah, kamu <em>harus mengulang soal tersebut</em>.</span>
      </li>
      <li>
        <strong>🚪 Naik Level.</strong><br>
        <span class="ml-2 block">• Setelah menyelesaikan semua soal di satu level, kamu akan membuka <em>level berikutnya</em>.</span>
        <span class="ml-2 block">• Semakin tinggi level, semakin menantang soal dan informasi budayanya!</span>
      </li>
      <li>
        <strong>🏆 Kumpulkan Poin & Lencana.</strong><br>
        <span class="ml-2 block">• Dapatkan <em>poin budaya</em> untuk setiap jawaban benar.</span>
        <span class="ml-2 block">• Kumpulkan <em>lencana tradisi</em> untuk setiap daerah yang berhasil kamu taklukkan.</span>
        <span class="ml-2 block">• Buka <em>bonus misi budaya</em> di level tertentu untuk hadiah tambahan.</span>
      </li>
    </ol>

    <hr class="my-3 border-[#F9B233]">

    <h3 class="font-bold text-base mb-1">🎯 Tujuan Game:</h3>
    <ul class="list-disc ml-5 space-y-2">
      <li>Menyelesaikan seluruh level dari berbagai provinsi di Indonesia.</li>
      <li>Mengenal lebih dalam tradisi, pakaian adat, rumah adat, makanan khas, dan upacara adat setiap daerah.</li>
    </ul>
  </div>
</div>


<script>
  const audio = document.getElementById('clickSound');

  function playClick() {
    if (audio) audio.play();
  }

  function openModal(judul, isi, link) {
    document.getElementById('modalJudul').innerText = judul;
    document.getElementById('modalIsi').innerText = isi;
    document.getElementById('btnMulai').setAttribute('onclick', `window.location.href='${link}'`);
    document.getElementById('modalInfo').classList.remove('hidden');
    document.getElementById('modalInfo').classList.add('flex');
  }

  function closeModal() {
    document.getElementById('modalInfo').classList.add('hidden');
    document.getElementById('modalInfo').classList.remove('flex');
  }

  async function updatePoinHeader() {
    try {
      const res = await fetch('../auth/get_poin.php');
      const data = await res.json();
      if (data.success && typeof data.poin === 'number') {
        document.getElementById('poinText').textContent = new Intl.NumberFormat().format(data.poin);
      }
    } catch (err) {
      console.error('Gagal memuat poin:', err.message);
    }
  }

  document.addEventListener('DOMContentLoaded', () => {
    updatePoinHeader();
    setInterval(updatePoinHeader, 5000);

    document.getElementById('btnBeranda')?.addEventListener('click', function(e) {
      e.preventDefault();
      location.replace(this.href);
    });
  });

  function openGuide() {
    document.getElementById('modalGuide').classList.remove('hidden');
    document.getElementById('modalGuide').classList.add('flex');
  }

  function closeGuide() {
    document.getElementById('modalGuide').classList.add('hidden');
    document.getElementById('modalGuide').classList.remove('flex');
  }
</script>
</body>
</html>
