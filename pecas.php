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
          <form action="carrinho.php" method="post">
            <h5><label>Quant</label>
            <input type="number" name="quantcomprada" value="1"
            style=width:50px;></h5>
            <input type="hidden" name="codigopeca" value="<?php echo $codigopeca; ?>">
          <input type="submit" class="btn btn-primary" value="Comprar">
          </form>
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