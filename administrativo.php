<?php 
    require_once 'head.php';
    include_once 'conexao.php';
    session_start();
    ob_start();
?>
    <h1 class="text center"> Área administrativa </h1>
    <?php
    echo "Bem Vindo(a) " . $_SESSION['nome'];
    ?>