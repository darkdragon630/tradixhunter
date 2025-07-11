<?php
session_start();
require_once('../config/koneksi.php');

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $nama     = trim($_POST['nama']);
  $email    = trim($_POST['email']);
  $password = $_POST['password'];

  if ($nama && $email && $password) {
    // Cek apakah email sudah terdaftar
    $stmt = $koneksi->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
      $error = "Email sudah terdaftar!";
    } else {
      // Hash password
      $hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

      // Insert user baru
      $stmt = $koneksi->prepare("INSERT INTO users (nama, email, password, avatar, poin) VALUES (?, ?, ?, 'default.jpg', 0)");
      $stmt->bind_param("sss", $nama, $email, $hash);
      if ($stmt->execute()) {
        $user_id = $stmt->insert_id;

        // Buka wilayah awal "jawa" dengan status selesai
        $progress = $koneksi->prepare("INSERT INTO progress_user (user_id, wilayah, level, selesai) VALUES (?, 'jawa', 1, 0)");
        $progress->bind_param("i", $user_id);
        $progress->execute();
        $progress->close();

        header("Location: login.php");
        exit;
      } else {
        $error = "Registrasi gagal!";
      }
      $stmt->close();
    }
  } else {
    $error = "Semua field harus diisi!";
  }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Daftar | Tradix</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../assets/css/style.css">

  <style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      overflow-y: auto;
      -webkit-overflow-scrolling: touch;
    }

    input, button, textarea, select {
      font-size: 16px; /* Hindari zoom otomatis di Android */
    }

    input:focus {
      scroll-margin-top: 100px; /* Pastikan fokus tidak tertutup keyboard */
    }

    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
    .font-roboto { font-family: 'Roboto', sans-serif; }
  </style>
</head>

<body class="bg-[#9B4D1B] min-h-screen flex justify-center items-center px-4">
  <div class="bg-[#B35A1B] p-8 rounded-lg shadow-lg w-full max-w-md">
    <h1 class="font-luckiest text-5xl text-[#F9B233] text-center drop-shadow-[2px_2px_0_#7A3B0E]">TRADIX</h1>
    <p class="font-roboto text-[#F9B233] text-center mb-6">Buat Akun Petualangan</p>

    <?php if ($error): ?>
      <p class="text-red-300 text-center mb-4"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>

    <form method="POST" class="flex flex-col space-y-4">
      <input type="text" name="nama" placeholder="Nama Lengkap" required
        class="px-3 py-2 rounded-md focus:outline-none focus:ring-2 text-[#7A3B0E] font-semibold focus:ring-[#F9B233] bg-white">

      <input type="email" name="email" placeholder="Email" required
        class="px-3 py-2 rounded-md focus:outline-none focus:ring-2 text-[#7A3B0E] font-semibold focus:ring-[#F9B233] bg-white">

      <input type="password" name="password" placeholder="Kata Sandi" required
        class="px-3 py-2 rounded-md focus:outline-none focus:ring-2 text-[#7A3B0E] font-semibold focus:ring-[#F9B233] bg-white">

      <button type="submit" class="bg-[#F9B233] text-[#7A3B0E] font-bold rounded-md py-3 shadow-md hover:bg-[#f7c14a] transition">
        Daftar
      </button>
    </form>

    <p class="mt-4 text-center text-[#F9B233] text-sm font-roboto">
      Sudah punya akun? <a href="login.php" class="underline">Login di sini</a>
    </p>
  </div>
</body>
</html>
