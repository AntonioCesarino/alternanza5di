<?php 

$hostname = 'localhost';
$dbname = 'car_pooling';
$user = 'root';
$password = '';

$db = new PDO("mysql:host=$hostname;dbname=$dbname", $user, $password);

if(!$db) {
  die('Errore di connessione');
}

$query = "INSERT INTO cliente (nome, cognome, telefono, foto, codice_fiscale) VALUE ('".$_POST['nome']."', '".$_POST['cognome']."', '".$_POST['telefono']."', '', '".$_POST['codice_fiscale']."')";

$result = $db->query($query);

header("location:clienti.php?messaggio=inserimento+corretto");
?>
