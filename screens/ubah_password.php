<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

$id = $_SESSION['user_id'];
$pesan = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $lama = md5($_POST['password_lama']);
  $baru = md5($_POST['password_baru']);
  $konfirmasi = md5($_POST['konfirmasi_password']);

  $cek = $koneksi->query("SELECT * FROM users WHERE id=$id AND password='$lama'");
  if ($cek->num_rows === 1) {
    if ($baru === $konfirmasi) {
      $koneksi->query("UPDATE users SET password='$baru' WHERE id=$id");
      $pesan = "✅ Password berhasil diperbarui.";
    } else {
      $pesan = "❌ Konfirmasi password tidak cocok.";
    }
  } else {
    $pesan = "❌ Password lama salah.";
  }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
   <!-- ⚠️ Tambahkan ini -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Ganti Kata Sandi</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body class="bg-[#9B4D1B] min-h-screen flex flex-col items-center justify-center px-6 py-8">

  <div class="bg-[#B35A1B] w-full max-w-md rounded-xl p-6 shadow-md text-center space-y-4">
    <h1 class="text-2xl text-[#F9B233] font-bold mb-4">Ganti Kata Sandi</h1>

    <?php if ($pesan) echo "<p class='text-sm text-white mb-2'>$pesan</p>"; ?>

    <form method="POST" class="space-y-4">
      <div>
        <label class="block text-[#F9B233] mb-1 text-left">Kata Sandi Lama</label>
        <input type="password" name="password_lama" required
               class="w-full px-3 py-2 rounded focus:outline-none text-[#7A3B0E]">
      </div>

      <div>
        <label class="block text-[#F9B233] mb-1 text-left">Kata Sandi Baru</label>
        <input type="password" name="password_baru" required
               class="w-full px-3 py-2 rounded focus:outline-none text-[#7A3B0E]">
      </div>

      <div>
        <label class="block text-[#F9B233] mb-1 text-left">Konfirmasi Kata Sandi Baru</label>
        <input type="password" name="konfirmasi_password" required
               class="w-full px-3 py-2 rounded focus:outline-none text-[#7A3B0E]">
      </div>

      <button type="submit" class="w-full bg-[#F9B233] text-[#7A3B0E] font-bold py-2 rounded hover:bg-[#f7c14a] transition">
        Simpan Password Baru
      </button>
    </form>

    <a href="profile.php" class="block mt-4 text-[#F9B233] hover:underline">← Kembali ke Profil</a>
  </div>

</body>
</html>
