window.addEventListener('DOMContentLoaded', () => {
  const audio = document.getElementById('introSound');

  // Mainkan audio (jika browser atau WebView mengizinkan)
  if (audio) {
    audio.play().catch(err => {
      console.warn('Audio gagal diputar otomatis:', err);
    });
  }

  // Redirect ke login setelah 4 detik
  setTimeout(() => {
    window.location.href = "../auth/login.php";
  }, 4000);
});
