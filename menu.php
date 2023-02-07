<?php

session_start();
ob_start();

if(!isset($_SESSION["quant"])){       
$_SESSION["quant"]=0;
}
?>

<nav class="navbar navbar-expand-lg navbar-light  menu">
       <a class="navbar-brand" href="#">Marquinho's</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
             <span class="navbar-toggler-icon"></span>
          </button>
              
      <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
           <ul class="navbar-nav mr-auto">
               <li class="nav-item active">
                      <a class="nav-link" href="#">Home <span class="sr-only">(página atual)</span></a>
              </li>
              <li class="nav-item">
                     <a class="nav-link" href="pecas.php">Nossa Loja</a>
              </li>
             <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     Serviços
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Carros</a>
                        <a class="dropdown-item" href="#">Aluguel</a>
                        <a class="dropdown-item" href="#">Compra</a>
                    </div>
             </li>

             <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     Loja
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Peças</a>
                        <a class="dropdown-item" href="#">Acessórios</a>
                    </div>
             </li>
             <li class="nav-item">
                    <a class="nav-link" href="#">Fale Conosco</a>
             </li>
             <li class="nav-item">
                    <a class="nav-link" href="login.php">Área do Cliente</a>
             </li>
           </ul>
              <form class="form-inline my-2 my-lg-0">
                  <img src="imagens/carrinho.png" style=width:60px;height:60px;>
                     <?php
                        if($_SESSION["quant"]>0){
                         echo $_SESSION["quant"];
                       }
                     ?>
                  </form>
       </div>
     </nav>