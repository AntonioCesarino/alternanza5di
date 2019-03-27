<?php 

$hostname = '127.0.0.1';
$dbname = 'car_pooling';
$user = '5di';
$password = '5di';

$db = new PDO("mysql:host=$hostname;dbname=$dbname", $user, $password);

if(!$db) {
  die('Errore di connessione');
}

$query = "INSERT INTO autisti (nome, cognome, telefono, foto, numero_patente, scadenza_patente) VALUE ('".$_POST['nome']."', '".$_POST['cognome']."', '".$_POST['telefono']."', '', '".$_POST['numero_patente']."', '".$_POST['scadenza_patente']."')";

$result = $db->query($query);

header("location:index.php?messaggio=inserimento+corretto");
?>