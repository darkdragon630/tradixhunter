<?php
$host = "db.fr-pari1.bengt.wasmernet.com";
$user = "d71fb24e7190800061622660f179";
$pass = "0686d71f-b24e-72ea-8000-1b4b26dbc1fa";
$database = "tradix";
$port = 10272;

$koneksi = mysqli_connect("$host", "$user", "$pass", "$database", "$port");

if (!$koneksi) {
    die ("koneksi gagal:" . mysqli_connect_error());
}
?>