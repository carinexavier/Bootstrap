<?php
  require_once 'head.php';
  include_once 'conexao.php';
  session_start();
  ob_start();
?>

<?php
  $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
  if(!empty($dados["btnlogin"])){
  var_dump($dados);
    $sql = "SELECT matricula, nome, email, senha
              FROM funcionario
              WHERE email =:usuario
              LIMIT 1";
    $resultado= $conn->prepare($sql);
    $resultado->bindParam (':usuario', $dados['usuario'], PDO::PARAM_STR);
    $resultado->execute();
    if (($resultado) AND ($resultado->rowCount() !=0)) {
      $linha = $resultado->fetch (PDO::FETCH_ASSOC);
      var_dump($linha);
      if (password_verify($dados['senha'], $linha['senha'])){
        $_SESSION['nome'] = $linha['nome'];
        header("Location: administrativo.php");
      }
      else{
        $_SESSION['msg'] = "Usuário ou Senha não encontrados";
      }
    }
    else{
      $_SESSION['msg'] = "Usuário ou Senha não encontrados";     
    }
  }
    if(isset($_SESSION['msg'])){
      echo $_SESSION['msg'];
      unset($_SESSION['msg']);
    }
?>

  <body class="login body">
    <div class="wrapper fadeInDown">
      <div id="formContent">
    
        <div class="fadeIn first">
          <h1>Faça Login</h1>
        </div>
    
        <form method="POST" action="">
          <input type="text" id="login" class="fadeIn second" placeholder="Nome de Usuário" name="usuario">
          <input type="text" id="password" class="fadeIn third" placeholder="Senha" name="senha">
          <input type="submit" class="fadeIn fourth" value="Entrar" name="btnlogin">
          <input type="submit" class="fadeIn fourth" value="Cadastre-se" name="btnlogin">
        </form>
    
        <div id="formFooter">
          <a class="underlineHover" href="#">Esqueceu a Senha?</a>
        </div>
    
      </div>
    </div>

    <link rel="stylesheet" href="login.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>