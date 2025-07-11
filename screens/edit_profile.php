<?php
require_once('../auth/cek_session.php');
require_once('../config/koneksi.php');

$id = $_SESSION['user_id'];
$pesan = "";

// Ambil data pengguna
$user = $koneksi->query("SELECT * FROM users WHERE id=$id")->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $nama = htmlspecialchars($_POST['nama']);
  $avatar = $_FILES['avatar'];

  // Cek apakah ada file avatar baru diupload
  if (!empty($avatar['name']) && $avatar['error'] === 0) {
    $ext = strtolower(pathinfo($avatar['name'], PATHINFO_EXTENSION));
    $newName = 'avatar_' . time() . '.' . $ext;
    $target = '../assets/images/' . $newName;

    // Coba upload file
    if (move_uploaded_file($avatar['tmp_name'], $target)) {
      $query = "UPDATE users SET nama='$nama', avatar='$newName' WHERE id=$id";
      $_SESSION['avatar'] = $newName;
      $user['avatar'] = $newName;
    } else {
      $pesan = "❌ Gagal mengunggah avatar. Gunakan nama saja.";
      $query = "UPDATE users SET nama='$nama' WHERE id=$id";
    }
  } else {
    // Hanya ubah nama
    $query = "UPDATE users SET nama='$nama' WHERE id=$id";
  }

  // Simpan ke database
  if ($koneksi->query($query)) {
    $_SESSION['nama'] = $nama;
    header("Location: profile.php");
    exit;
  } else {
    $pesan = "❌ Gagal menyimpan perubahan.";
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
  <title>Edit Profil</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body class="bg-[#9B4D1B] min-h-screen flex flex-col items-center justify-center px-6 py-8">

  <div class="bg-[#B35A1B] w-full max-w-md rounded-xl p-6 shadow-md text-center space-y-4">
    <h1 class="text-2xl text-[#F9B233] font-bold mb-4">Edit Profil</h1>

    <?php if ($pesan): ?>
      <p class="text-sm text-red-300"><?= $pesan; ?></p>
    <?php endif; ?>

    <img src="../assets/images/<?= htmlspecialchars($user['avatar'] ?? 'default.png'); ?>" 
         alt="Avatar Saat Ini" class="w-24 h-24 mx-auto rounded-full border-4 border-[#7A3B0E] mb-4">

    <form method="POST" enctype="multipart/form-data" class="space-y-4">
      <div>
        <label class="block text-[#F9B233] mb-1 text-left">Nama Lengkap</label>
        <input type="text" name="nama" value="<?= htmlspecialchars($user['nama']); ?>"
               class="w-full px-3 py-2 rounded focus:outline-none text-[#7A3B0E]" required>
      </div>

      <div>
        <label class="block text-[#F9B233] mb-1 text-left">Avatar Baru</label>
        <input type="file" name="avatar" accept="image/*" class="text-white">
        <p class="text-xs text-[#F9B233] mt-1">Biarkan kosong jika tidak ingin mengganti avatar.</p>
      </div>

      <button type="submit" class="w-full bg-[#F9B233] text-[#7A3B0E] font-bold py-2 rounded hover:bg-[#f7c14a] transition">
        Simpan Perubahan
      </button>
    </form>

    <a href="profile.php" class="block mt-4 text-[#F9B233] hover:underline">← Kembali ke Profil</a>
  </div>

</body>
</html>
