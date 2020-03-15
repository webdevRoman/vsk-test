<?php
$host = '127.0.0.1';
$db = '***********';
$user = '***********';
$pass = '***********';

$dsn = "pgsql:host=$host;dbname=$db";
$opt = [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
  PDO::ATTR_EMULATE_PREPARES => false,
];
$pdo = new PDO($dsn, $user, $pass, $opt);