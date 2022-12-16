<?php
    require_once 'head.php';
    require_once 'menu.php';
 ?>

<div class="container-fluid">
    <div class="row pecas">
        <div class="col-md-3">
            <div class="card">
               <img class="card-img-top" src="imagens/amortecedor.jpg" alt="Imagem de capa do card">
                <div class="card-body">
                  <h5 class="card-title">Amortecedor</h5>
                  <p class="card-text">Referência nos ramos de peças de suspensão.</p>
                  <p>R$120,00</p>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#amortecedor">
                  Comprar
                  </button>
               </div>
             </div>
          </div>

          <div class="col-md-3">
            <div class="card">
               <img class="card-img-top" src="imagens/bieleta.jpg" alt="Imagem de capa do card">
                <div class="card-body">
                  <h5 class="card-title">Bieleta</h5>
                  <p class="card-text">Ande sempre com segurança e estabilidade.</p>
                  <p>R$40,00</p>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bieleta">
                  Comprar
                  </button>
               </div>
             </div>
          </div>

          <div class="col-md-3">
            <div class="card">
               <img class="card-img-top" src="imagens/freio.webp" alt="Imagem de capa do card">
                <div class="card-body">
                  <h5 class="card-title">Freio</h5>
                  <p class="card-text">Alto desempenho e ótima duração.</p>
                  <p>R$100,00</p>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#freio">
                  Comprar
                  </button>
               </div>
             </div>
          </div>

          <div class="col-md-3">
            <div class="card">
               <img class="card-img-top" src="imagens/vela.webp" alt="Imagem de capa do card">
                <div class="card-body">
                  <h5 class="card-title">Vela</h5>
                  <p class="card-text">Peça de alta duração, a melhor escolha do mercado.</p>
                  <p>R$80,00</p>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#vela">
                  Comprar
                  </button>
               </div>
             </div>
          </div>


  
    </div>
</div>

<div class="modal fade" id="amortecedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Amortecedor</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <img class="img-fluid" src="imagens/amortecedor.jpg">
      <h4>Amortecedores</h4>
      <p>Referência nos ramos de peças de suspensão.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary">Adicionar ao carrinho</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="bieleta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Bieleta</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <img class="img-fluid" src="imagens/bieleta.jpg">
      <h4>Bieletas</h4>
      <p>Ande sempre com segurança e estabilidade.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary">Adicionar ao carrinho</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="freio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Freio</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <img class="img-fluid" src="imagens/freio.webp">
      <h4>Freios</h4>
      <p>Alto desempenho e ótima duração.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary">Adicionar ao carrinho</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="vela" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Vela</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <img class="img-fluid" src="imagens/vela.webp" >
      <h4>Vela</h4>
      <p>Peça de alta duração, a melhor escolha do mercado.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary">Adicionar ao carrinho</button>
      </div>
    </div>
  </div>
</div>

<?php
require_once 'footer.php';
?>