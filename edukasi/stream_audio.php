<?php
require_once('../auth/cek_session.php'); // Jika hanya pengguna login yang boleh akses

$file = $_GET['file'] ?? '';
$path = '../assets/audio/' . basename($file); // Hindari path traversal

if (!preg_match('/\.mp3$/', $file)) {
  http_response_code(403);
  echo "Format file tidak diizinkan.";
  exit;
}

if (file_exists($path)) {
  header('Content-Type: audio/mpeg');
  header('Content-Length: ' . filesize($path));
  header('Content-Disposition: inline; filename="' . basename($file) . '"');
  readfile($path);
  exit;
} else {
  http_response_code(404);
  echo "File tidak ditemukan.";
}
?>