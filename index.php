<?php
session_start();

// Jika sudah login, langsung arahkan ke beranda
if (isset($_SESSION['user_id'])) {
    header("Location: screens/home.php");
    exit;
}

// Jika belum login, tampilkan intro terlebih dahulu
header("Location: opening/intro.php");
exit;
?>