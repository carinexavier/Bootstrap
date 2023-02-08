<?php

session_start ();
ob_start ();

include_once 'conexao.php';

$buscacod = filter_input_array(INPUT_POST, FILTER_DEFAULT);
$codigopeca = $buscacod["codigopeca"];
//var_dump($dadoscad);

if(!empty($buscacod["excluir"])){

  

    $sqlexcluir = "DELETE from carrinho where codigopeca = $codigopeca";
    $resulbusca = $conn->prepare($sqlexcluir);
    $resulbusca->execute();

    $_SESSION["quant"]-=1;
}else{
    if(!isset($_SESSION["nome"])){
        $_SESSION["carrinho"]=true;
        echo "<script>
        alert('Faça login ou cadastre-se!');
        parent.location = 'login.php';
        </script>";
    }else{
        //fazer pagamento
    }
}

?>