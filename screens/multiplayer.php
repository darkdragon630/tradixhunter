<?php
require_once('../auth/cek_session.php');
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <title>Battle Multiplayer | Tradix</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    .font-luckiest { font-family: 'Luckiest Guy', cursive; }
    .font-roboto { font-family: 'Roboto', sans-serif; }
  </style>
</head>
<body class="bg-[#9B4D1B] text-[#F9B233] min-h-screen px-4 py-6 font-roboto">

  <!-- Tombol kembali -->
  <a href="home.php" class="bg-[#F9B233] text-[#7A3B0E] font-bold px-4 py-2 rounded shadow hover:bg-[#f7c14a] text-sm">
    ← Beranda
  </a>

  <h1 class="text-center font-luckiest text-3xl mt-8 mb-4 drop-shadow-[2px_2px_0_#7A3B0E]">
    Battle Multiplayer
  </h1>

  <div class="bg-[#B35A1B] p-6 rounded-xl shadow max-w-md mx-auto text-center space-y-5">
    <p>💬 Tantang temanmu atau pemain lain secara online! Jawab kuis budaya secara real-time dan kumpulkan poin terbanyak!</p>

    <a href="../multiplayer/lobby.php" class="block bg-[#F9B233] text-[#7A3B0E] font-bold py-3 rounded-lg hover:bg-[#f7c14a] transition">
      🔥 Masuk ke Lobi Multiplayer
    </a>

    <a href="../multiplayer/leaderboard.php" class="block bg-[#7A3B0E] text-[#F9B233] font-bold py-3 rounded-lg hover:bg-[#5a2a0a] transition">
      🏆 Lihat Leaderboard
    </a>

    <a href="../multiplayer/multiplayer_result.php?poin=100" class="block text-xs text-[#FCD683] hover:underline mt-3">
      (🔧 Coba Hasil Multiplayer - Simulasi)
    </a>
  </div>

</body>
</html>
