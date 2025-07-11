<?php
function syncUserPoin(mysqli $koneksi, int $userId): void {
  $stmt = $koneksi->prepare("
    SELECT COALESCE(SUM(reward_poin), 0) AS total_poin 
    FROM rewards_log 
    WHERE user_id = ?
  ");
  $stmt->bind_param("i", $userId);
  $stmt->execute();
  $res = $stmt->get_result();

  if ($row = $res->fetch_assoc()) {
    $totalPoin = $row['total_poin'];
    $update = $koneksi->prepare("UPDATE users SET poin = ? WHERE id = ?");
    $update->bind_param("ii", $totalPoin, $userId);
    $update->execute();
    $update->close();
    $_SESSION['poin'] = $totalPoin;
  }

  $stmt->close();
}
