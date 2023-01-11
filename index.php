 <?php
    require_once 'head.php';
    require_once 'menu.php';

    include_once 'conexao.php';
 ?> 
  <div class="container-fluid">
        <div class="row text-center carrossel">
            <div class="col-md-1"></div>
              <div class="col-md-10">
              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img class="d-block w-100" src="imagens/Carroscapa.jpg" alt="Primeiro Slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="imagens/relampago.webp" alt="Segundo Slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="imagens/relampagomarquinho.jpg" alt="Terceiro Slide">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Anterior</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Próximo</span>
                </a>
              </div>
              <div class="col-md-1"></div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
      <div class="row text-center">
          <div class="col-md-12">
              <h1>Conheça nossos carros</h1>
          </div>
      </div>
  </div>

  <div class="container-fluid">
    <div class="row text-center servicos" >
        <div class="col-md-4">
          <img src="imagens/carrosazul.jpg" class="img-fluid">
          <h4>Porche 911 - Sally</h4>
        </div>

        <div class="col-md-4">
          <img src="imagens/carrosmarrom.jpg" class="img-fluid">
          <h4>Pickup - Mate</h4>
        </div>

        <div class="col-md-4">
          <img src="imagens/carrosazulescuro.webp" class="img-fluid">
          <h4>Cadillac - Jackson</h4>
        </div>

        <div class="container-fluid">
          <div class="row text-center">
              <div class="col-md-12">
                  <h1></h1>
              </div>
          </div>
      </div>
   </div>
  </div>

  <?php
  require_once 'footer.php';
  ?>