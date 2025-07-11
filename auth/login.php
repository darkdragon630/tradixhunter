<?php
session_start();
require_once('../config/koneksi.php');

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['emailPhone'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($email && $password) {
        $stmt = $koneksi->prepare("SELECT id, nama, email, password, avatar, poin FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $res = $stmt->get_result();

        if ($res->num_rows === 1) {
            $user = $res->fetch_assoc();

            if (password_verify($password, $user['password'])) {
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['nama'] = $user['nama'];
                $_SESSION['avatar'] = $user['avatar'];
                $_SESSION['poin'] = $user['poin'];

                // ✅ Cek apakah sebelumnya user diarahkan
                if (isset($_SESSION['redirect_after_login'])) {
                    $redirect = $_SESSION['redirect_after_login'];
                    unset($_SESSION['redirect_after_login']);
                    header("Location: $redirect");
                    exit;
                }

                // ✅ Jika tidak ada redirect, arahkan ke home
                header("Location: ../screens/home.php");
                exit;
            } else {
                $error = "Kata sandi salah!";
            }
        } else {
            $error = "Email tidak ditemukan!";
        }

        $stmt->close();
    } else {
        $error = "Semua kolom harus diisi!";
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
  <title>Login | Tradix</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="../assets/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

  <style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      overflow-y: auto;
      -webkit-overflow-scrolling: touch;
    }

    input, button, textarea, select {
      font-size: 16px; /* Mencegah zoom otomatis di Android */
    }

    input:focus {
      scroll-margin-top: 100px; /* Agar input tidak tertutup keyboard */
    }

    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
    .font-roboto { font-family: 'Roboto', sans-serif; }
  </style>
</head>

<body class="bg-[#9B4D1B] min-h-screen flex justify-center items-center px-4">
  <div class="bg-[#B35A1B] p-8 rounded-lg shadow-lg w-full max-w-md">
    <h1 class="font-luckiest text-5xl text-[#F9B233] text-center drop-shadow-[2px_2px_0_#7A3B0E]">TRADIX</h1>
    <p class="font-roboto text-[#F9B233] text-center mb-6">Petualangan Seru Menjelajah Budaya Nusantara</p>

    <?php if ($error): ?>
      <p class="text-red-300 text-center mb-4"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>

    <form method="POST" class="flex flex-col space-y-4">
      <label class="font-roboto text-[#F9B233] text-sm">
        Email
        <input type="email" name="emailPhone" placeholder="Masukkan email" required
          class="mt-1 px-3 py-2 rounded-md w-full focus:outline-none focus:ring-2 text-[#7A3B0E] font-semibold focus:ring-[#F9B233] bg-white">
      </label>

      <label class="font-roboto text-[#F9B233] text-sm">
        Kata Sandi
        <input type="password" name="password" placeholder="Masukkan kata sandi" required
          class="mt-1 px-3 py-2 rounded-md w-full focus:outline-none focus:ring-2 text-[#7A3B0E] font-semibold focus:ring-[#F9B233] bg-white">
      </label>

      <button type="submit" class="bg-[#F9B233] text-[#7A3B0E] font-bold rounded-md py-3 shadow-md hover:bg-[#f7c14a] transition">
        Masuk
      </button>
    </form>

    <div class="flex justify-between mt-4 text-sm text-[#F9B233] font-semibold">
      <a href="register.php" class="hover:underline">Daftar Akun Baru</a>
      <a href="#" onclick="alert('Fitur Lupa Kata Sandi belum tersedia.')" class="hover:underline">Lupa Kata Sandi?</a>
    </div>

    <div class="flex justify-center space-x-4 mt-6">
      <button type="button" onclick="alert('Login dengan Google belum tersedia.')"
        class="flex items-center space-x-2 bg-[#F9B233] text-[#7A3B0E] font-semibold rounded-md px-4 py-2 shadow-md hover:bg-[#f7c14a] transition">
        <i class="fab fa-google"></i> <span>Google</span>
      </button>

      <button type="button" onclick="alert('Login dengan Facebook belum tersedia.')"
        class="flex items-center space-x-2 bg-[#F9B233] text-[#7A3B0E] font-semibold rounded-md px-4 py-2 shadow-md hover:bg-[#f7c14a] transition">
        <i class="fab fa-facebook-f"></i> <span>Facebook</span>
      </button>
    </div>
  </div>
</body>
</html>
