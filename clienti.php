<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <title>Creazione Cliente</title>
</head>
<style>
  .form-m {
    width: 350px;
    margin: 30px auto;
    padding: 20px;
    background-color: #f5f5f5;
    border-radius: 4px;
    box-shadow: 2px 2px 5px #ccc;
  }
</style>
<body>
  <div class="container" style="margin-top:40px;"> 
    
    

    

    <?php

    $messaggio = $_GET['messaggio'];

    $hostname = 'localhost';
    $dbname = 'car_pooling';
    $user = 'root';
    $password = '';

    $db = new PDO("mysql:host=$hostname;dbname=$dbname", $user, $password);

    $result = $db->query("SELECT * FROM cliente");

    $cliente = $result->fetchAll(PDO::FETCH_ASSOC);

?>

<?php
  if($messaggio) {
?>
  <div id="alert" class="alert alert-success alert-dismissible fade show" role="alert">
    <?php echo $messaggio;?>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
<?php
  }
?>
    <div class="text-center" style="margin-top:50px;">
      <h4>Lista Clienti</h4>
    </div>
    <table class="table">
      <thead>
        <tr>
          <th>#</th>
          <th>Nome</th>
          <th>Cognome</th>
          <th>Telefono</th>
          <th>Foto</th>
          <th>codice_fiscale</th>
          
        </tr>
      </thead>
      <tbody>
        <?php 
          foreach($cliente as $key => $row) {
            echo '<tr>';
            echo "<td>".($key+1)."</td>";
            echo "<td>$row[nome]</td>";
            echo "<td>$row[cognome]</td>";
            echo "<td>$row[telefono]</td>";
            echo "<td>$row[foto]</td>";
            echo "<td>$row[codice_fiscale]</td>";
            echo '</tr>';
          }
        ?>
      </tbody>
    </table>

    <form class="form-m" action="registra_clienti.php" method="POST">
      <div class="text-center">
        <h4>Crea Cliente</h4>
      </div>
      <div class="form-group">
        <label>Clienti</label>
        <select>
        <?php 
          foreach($cliente as $key => $row) {
            echo '<option value="'.$row['codice_fiscale'].'">'.$row['nome'].'</option>';
          }
        ?>
        </select>
      </div>
      <div class="form-group">
        <label>Nome</label>
        <input type="text" name="nome" class="form-control"/>
      </div>
      <div class="form-group">
        <label>Cognome</label>
        <input type="text" name="cognome" class="form-control"/>
      </div>
      <div class="form-group">
        <label>Telefono</label>
        <input type="text" name="telefono" class="form-control"/>
      </div>
      <div class="form-group">
        <label>Foto</label>
        <input type="text" name="foto" class="form-control"/>
      </div>
      <div class="form-group">
        <label>codice_fiscale</label>
        <input type="text" name="codice_fiscale" class="form-control"/>
      </div>

      <div class="text-center">
        <button type="submit" class="btn btn-primary">Salva</button>
      </div>
    </form>
    
    </div>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    

    <script>
      setTimeout(function(){
        $('#alert').alert('close')
      }, 1000);
    
    </script>


</body>
</html>
