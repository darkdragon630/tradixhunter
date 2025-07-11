<?php
session_start();
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

$wilayah = htmlspecialchars($_GET['wilayah'] ?? 'jawa');
$userId = $_SESSION['user_id'] ?? null;

$bgImage = "../assets/images/bg_{$wilayah}.jpeg";

if (isset($_GET['reset']) && $_GET['reset'] === 'true') {
  unset($_SESSION['soal'], $_SESSION['soal_ke'], $_SESSION['skor'], $_SESSION['wilayah'], $_SESSION['last_jawaban_benar'], $_SESSION['redirect_to']);
  header("Location: quiz.php?wilayah=$wilayah");
  exit;
}

// Cek jika user sudah menyelesaikan
$stmt = $koneksi->prepare("SELECT id FROM rewards_log WHERE user_id = ? AND wilayah = ?");
$stmt->bind_param("is", $userId, $wilayah);
$stmt->execute();
$stmt->store_result();
if ($stmt->num_rows > 0) {
  echo "<script>alert('Kuis wilayah ini sudah diselesaikan!'); window.location.href='map.php';</script>";
  exit;
}
$stmt->close();

// Ambil soal jika belum disimpan atau beda wilayah
if (!isset($_SESSION['soal']) || $_SESSION['wilayah'] !== $wilayah) {
  $query = $koneksi->prepare("SELECT * FROM kuis WHERE wilayah = ? ORDER BY RAND() LIMIT 15");
  $query->bind_param("s", $wilayah);
  $query->execute();
  $result = $query->get_result();
  $_SESSION['soal'] = $result->fetch_all(MYSQLI_ASSOC);
  $_SESSION['soal_ke'] = 0;
  $_SESSION['skor'] = 0;
  $_SESSION['wilayah'] = $wilayah;
  $query->close();
}

// Proteksi jika soal sudah habis tapi masih render efek
$jumlah_soal = isset($_SESSION['soal']) ? count($_SESSION['soal']) : 15;
$soal_ke = $_SESSION['soal_ke'] ?? $jumlah_soal;

$soal = $_SESSION['soal'][$soal_ke] ?? ['pertanyaan' => '', 'jawaban' => '', 'gambar' => ''];
$id = (int) ($soal['id'] ?? 0);

// Ambil opsi jika soal masih valid
$opsi = [];
if ($id > 0) {
  $ambil = $koneksi->prepare("SELECT kode, teks_opsi FROM opsi_kuis WHERE kuis_id = ?");
  $ambil->bind_param("i", $id);
  $ambil->execute();
  $result = $ambil->get_result();
  while ($row = $result->fetch_assoc()) {
    $opsi[strtoupper($row['kode'])] = $row['teks_opsi'];
  }
  $ambil->close();
}

$jawaban_benar = strtoupper($soal['jawaban'] ?? '');
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $jawaban_user = strtoupper($_POST['jawaban'] ?? '');

  if ($jawaban_user === $jawaban_benar) {
    $_SESSION['skor'] += 10;
    $_SESSION['last_jawaban_benar'] = true;

    $stmt = $koneksi->prepare("INSERT INTO kuis_jawaban (user_id, kuis_id, wilayah, jawaban_user, jawaban_benar, skor) VALUES (?, ?, ?, ?, ?, 10)");
    $stmt->bind_param("iisss", $userId, $id, $wilayah, $jawaban_user, $jawaban_benar);
    $stmt->execute();
    $stmt->close();

    $_SESSION['soal_ke']++;

    if ($_SESSION['soal_ke'] >= count($_SESSION['soal'])) {
      $total = $_SESSION['skor'];
      $item = match ($wilayah) {
        'jawa' => 'Batik Jawa',
        'sumatera' => 'Songket Sumatera',
        'kalimantan' => 'Mandau Kalimantan',
        'sulawesi' => 'Tenun Sulawesi',
        'ntt' => 'Kain Ikat NTT',
        'papua' => 'Koteka Papua',
        default => 'Item Budaya'
      };

      $_SESSION['redirect_to'] = "reward.php?reward=+$total Poin&item=$item&wilayah=$wilayah";
      unset($_SESSION['soal'], $_SESSION['soal_ke'], $_SESSION['skor'], $_SESSION['wilayah']);
    } else {
      $_SESSION['redirect_to'] = "quiz.php?wilayah=" . urlencode($wilayah);
    }
  } else {
    $error = 'Jawaban salah. Coba lagi.';
  }
}

$jawabanBenar = $_SESSION['last_jawaban_benar'] ?? false;
$redirectTo = $_SESSION['redirect_to'] ?? null;
unset($_SESSION['last_jawaban_benar'], $_SESSION['redirect_to']);
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Kuis Wilayah - <?= ucfirst($wilayah) ?></title>
  <link rel="preload" as="image" href="<?= $bgImage ?>">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="../assets/css/style.css">
  <style>
    body {
      background: url('<?= $bgImage ?>') no-repeat center center fixed;
      background-size: cover;
    }
    @keyframes flashFade {
      0% { opacity: 0.5; }
      100% { opacity: 0; }
    }
    .flash-green {
      position: fixed;
      top: 0; left: 0;
      width: 100vw; height: 100vh;
      background-color: rgba(0, 255, 0, 0.3);
      z-index: 9998;
      pointer-events: none;
      animation: flashFade 0.8s ease-out forwards;
    }
    .fade-out {
      animation: fadeOut 0.6s ease forwards;
    }
    @keyframes fadeOut {
      to {
        opacity: 0;
        transform: scale(0.98);
      }
    }
    .toast-success {
      transition: all 0.4s ease;
      opacity: 0;
    }
    .toast-show {
      opacity: 1;
    }
  </style>
</head>
<body class="text-[#F9B233] min-h-screen flex flex-col items-center px-4 py-8 font-sans">
  <div id="main-content" class="bg-[#B35A1B]/60 w-full max-w-xl rounded-xl p-6 shadow-lg transition z-10 relative">
    <h1 class="text-xl font-bold mb-4 text-center">Soal <?= $soal_ke + 1 ?> dari <?= $jumlah_soal ?></h1>

    <?php if ($error): ?>
      <div class="bg-red-600 text-white text-center rounded p-2 mb-4"><?= $error ?></div>
    <?php endif; ?>

    <form method="POST">
      <p class="mb-4 font-semibold"><?= htmlspecialchars($soal['pertanyaan']) ?></p>

      <?php if (!empty($soal['gambar'])): ?>
        <img src="../uploads/<?= htmlspecialchars($soal['gambar']) ?>" alt="Gambar Soal"
             class="w-full max-h-72 object-contain my-4 rounded-lg border border-yellow-300 shadow">
      <?php endif; ?>

      <?php foreach ($opsi as $kode => $teks): ?>
        <label class="block mb-2 flex items-start space-x-2">
          <input type="radio" name="jawaban" value="<?= $kode ?>" required class="mt-1">
          <span class="block text-sm leading-relaxed"><?= $kode ?>. <?= htmlspecialchars($teks) ?></span>
        </label>

      <?php endforeach; ?>

      <button type="submit" class="mt-4 w-full bg-[#F9B233] text-[#7A3B0E] font-bold py-2 px-4 rounded hover:bg-[#f7c14a] transition">
        Submit Jawaban
      </button>
    </form>

    <div class="mt-6 text-center">
      <a href="quiz.php?wilayah=<?= $wilayah ?>&reset=true" class="text-sm text-white underline hover:text-yellow-200">
        Ulangi kuis ini dari awal
      </a>
    </div>
  </div>

  <!-- Toast Notifikasi -->
  <div id="notif-benar" class="toast-success hidden fixed top-6 right-6 bg-green-500 text-white font-semibold py-3 px-5 rounded-lg shadow-lg z-[9999]">
    ✅ Jawaban Anda Benar!
  </div>

  <!-- Sound -->
  <audio id="sound-benar" src="../assets/sound/benar.mp3" preload="auto"></audio>
  <audio id="sound-salah" src="../assets/sound/salah.mp3" preload="auto"></audio>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const error = <?= json_encode($error) ?>;
      const jawabanBenar = <?= json_encode($jawabanBenar) ?>;
      const redirectTo = <?= json_encode($redirectTo) ?>;

      const audioBenar = document.getElementById('sound-benar');
      const audioSalah = document.getElementById('sound-salah');
      const notifBenar = document.getElementById('notif-benar');
      const mainContent = document.getElementById('main-content');

      const urlParams = new URLSearchParams(window.location.search);
      if (urlParams.get("reset") === "true") return;

      if (error) {
        audioSalah?.play().catch(console.warn);
      } else if (jawabanBenar) {
        audioBenar?.play().catch(console.warn);

        const flash = document.createElement('div');
        flash.className = 'flash-green';
        document.body.appendChild(flash);
        setTimeout(() => flash.remove(), 900);

        notifBenar?.classList.remove('hidden');
        notifBenar?.classList.add('toast-show');
        setTimeout(() => {
          notifBenar?.classList.add('hidden');
          notifBenar?.classList.remove('toast-show');
        }, 1300);

        if (redirectTo) {
          setTimeout(() => {
            mainContent?.classList.add('fade-out');
          }, 950);
          setTimeout(() => {
            window.location.href = redirectTo;
          }, 1600);
        }
      }
    });
  </script>
</body>
</html>