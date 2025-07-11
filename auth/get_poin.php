<?php
session_start();
require_once('../config/koneksi.php');
require_once('../functions/sync_poin.php');

header('Content-Type: application/json');

// ✅ Cek login
if (!isset($_SESSION['user_id'])) {
  http_response_code(401);
  echo json_encode(['success' => false, 'message' => 'Unauthorized']);
  exit;
}

$user_id = $_SESSION['user_id'];

// ✅ Sinkronisasi poin dari rewards_log ke users.poin
syncUserPoin($koneksi, $user_id);

// ✅ Siapkan query
$stmt = $koneksi->prepare("SELECT poin FROM users WHERE id = ?");
if (!$stmt) {
  http_response_code(500);
  echo json_encode(['success' => false, 'message' => 'Query preparation failed']);
  exit;
}

$stmt->bind_param("i", $user_id);
if (!$stmt->execute()) {
  http_response_code(500);
  echo json_encode(['success' => false, 'message' => 'Query execution failed']);
  exit;
}

$result = $stmt->get_result();
if ($result && $row = $result->fetch_assoc()) {
  echo json_encode(['success' => true, 'poin' => (int)$row['poin']]);
} else {
  http_response_code(404);
  echo json_encode(['success' => false, 'message' => 'User not found']);
}

$stmt->close();
$koneksi->close();
exit;
