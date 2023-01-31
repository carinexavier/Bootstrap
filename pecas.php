<?php
    require_once 'head.php';
    require_once 'menu.php';
    require_once 'conexao.php';

    $sql = "SELECT * from peca";
    $resultado = $conn->prepare($sql);
    $resultado -> execute();

    if(($resultado) and ($resultado->rowCount()!=0)){
     
 ?>

<div class="container-fluid pecas">
  <div class="row">
    <?php
    while ($linha = $resultado->fetch(PDO::FETCH_ASSOC)){
    extract($linha);
    ?>
    <div class="col-md-2 ">
      <div class="card">
        <img class="card-img-top" src="<?php echo $foto;?>" alt="Imagem de capa do card">
          <div class="card-body">
          <h5 class="card-title"></h5>
          <p class="card-text"><?php echo $nome;?></p>
          <p>Preço R$ <?php echo $preco;?></p>
          <button type="button" class="btn btn-primary">Comprar</button>
          </div>
      </div>
    </div>
   
<?php
  }
}
?>
  </div>
</div>

<?php
require_once 'footer.php';
?>