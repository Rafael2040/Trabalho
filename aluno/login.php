<?php

require '../bd/conexao.php';

if($_SERVER['REQUEST_METHOD'] == 'POST'){
$email = $_POST['email'];
$entrar = $_POST['entrar'];
$senha = MD5($_POST['senha']);

    if (isset($entrar)) {
    	$query = "SELECT * FROM aluno WHERE email = '$email' AND senha = '$senha'";
      	$verifica = mysqli_query($conexao, $query) or die($connect->error);

      	var_dump(mysqli_num_rows($verifica));
        if (mysqli_num_rows($verifica) <= 0){
         	echo"<script>alert('Login e/ou senha incorretos');window.location.href='login.php';</script>";

          die();

        }else{
        	session_start();
        	$dados = mysqli_fetch_assoc($verifica);
        	$_SESSION['nome'] = $dados['nome'];
        	$_SESSION['id'] = $dados['id'];
          	header("Location: ./index.php");
        }
    }
}        
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="utf-8">
  <title>Login de Aluno</title>
</head>
<body>
  <form method="POST" action="login.php">
    <center>
      <h2>Login de Aluno</h2>
      <label for="email">Email</label>
      <input type="email" name="email" id="email"><br><br>

      <label for="senha">Senha</label>
      <input type="password" name="senha" id="senha"><br><br>

      <input type="submit" value="Logar" id="entrar" name="entrar">

      <a href="cadastro.php">Cadastre-se</a>
    </center>
  </form>
</body>
</html>