<?php

include_once 'conexao.php';

$dadoscad = filter_input_array(INPUT_POST, FILTER_DEFAULT);

    if(!empty($dadoscad["btncad"])){
       

        $vazio = false;

        $dadoscad = array_map('trim', $dadoscad);
        if (in_array("", $dadoscad)) {
            $vazio = true;
           
            echo "<script>
            alert('Preencher todos os campos!');
            parent.location = 'frmfuncionario.php';
            </script>";

        } else if(!filter_var($dadoscad['email'], FILTER_VALIDATE_EMAIL)) {
            $vazio = true;
            echo "<script>
            alert('Informe um email válido!');
            parent.location = 'frmfuncionario.php';
            </script>";
        }
        
        if(!$vazio){

        
        $senha = password_hash($dadoscad['senha'], PASSWORD_DEFAULT);

        $sql = "insert into funcionario(nome,telefone,cpf,qualificacao,
        experiencia,cep,numerocasa,complemento,email,senha)values
        (:nome,:telefone,:cpf,:qualificacao,:experiencia,:cep,
        :numerocasa,:complemento,:email,:senha)";

        $salvar= $conn->prepare($sql);
        $salvar->bindParam(':nome', $dadoscad['nome'], PDO::PARAM_STR);
        $salvar->bindParam(':telefone', $dadoscad['telefone'], PDO::PARAM_STR);
        $salvar->bindParam(':cpf', $dadoscad['cpf'], PDO::PARAM_STR);
        $salvar->bindParam(':qualificacao', $dadoscad['qualificacao'], PDO::PARAM_STR);
        $salvar->bindParam(':experiencia', $dadoscad['experiencia'], PDO::PARAM_STR);
        $salvar->bindParam(':cep', $dadoscad['cep'], PDO::PARAM_STR);
        $salvar->bindParam(':numerocasa', $dadoscad['numero'], PDO::PARAM_INT);
        $salvar->bindParam(':complemento', $dadoscad['complemento'], PDO::PARAM_STR);
        $salvar->bindParam(':email', $dadoscad['email'], PDO::PARAM_STR);
        $salvar->bindParam(':senha', $senha, PDO::PARAM_STR);
        $salvar->execute();

        if ($salvar->rowCount()) {
            echo "<script>
            alert('Cadastrado com Sucesso!');
            parent.location = 'frmfuncionario.php';
            </script>";
            unset($dadoscad); 
        } else {
            echo "<script>
            alert('Erro : Usuário não cadastrado!');
            parent.location = 'frmfuncionario.php';
            </script>";
        }
           
 }
 
}
<<<<<<< HEAD

if(!empty($dadoscad["btneditar"])){

    $dadoscad = array_map('trim', $dadoscad);
    
    if(!filter_var($dadoscad['email'], FILTER_VALIDATE_EMAIL)) {
        $vazio = true;
        echo "<script>
        alert('Informe um email válido!');
        parent.location = 'frmfuncionario.php';
        </script>";
    }
    
    $sql = "UPDATE funcionario set nome = :nome, telefone = :telefone, cpf = :cpf, 
    qualificacao = :qualificacao, experiencia = :experiencia, cep = :cep, numerocasa = :numerocasa,
    complemento= :complemento, email = :email WHERE matricula = :matricula"; 
    
    $salvar= $conn->prepare($sql);
    $salvar->bindParam(':nome', $dadoscad['nome'], PDO::PARAM_STR);
    $salvar->bindParam(':telefone', $dadoscad['telefone'], PDO::PARAM_STR);
    $salvar->bindParam(':cpf', $dadoscad['cpf'], PDO::PARAM_STR);
    $salvar->bindParam(':qualificacao', $dadoscad['qualificacao'], PDO::PARAM_STR);
    $salvar->bindParam(':experiencia', $dadoscad['experiencia'], PDO::PARAM_STR);
    $salvar->bindParam(':cep', $dadoscad['cep'], PDO::PARAM_STR);
    $salvar->bindParam(':numerocasa', $dadoscad['numero'], PDO::PARAM_INT);
    $salvar->bindParam(':complemento', $dadoscad['complemento'], PDO::PARAM_STR);
    $salvar->bindParam(':email', $dadoscad['email'], PDO::PARAM_STR);
    $salvar->bindParam(':matricula', $dadoscad['matricula'], PDO::PARAM_INT);
    $salvar->execute();

    if ($salvar->rowCount()) {
        echo "<script>
        alert('Dados Atualizados!');
        parent.location = 'relfuncionario.php';
        </script>";
        unset($dadoscad); 
    } else {
        echo "<script>
        alert('Erro : Funcionário não encontrado!');
        parent.location = 'relfuncionario.php';
        </script>";
    }

}

=======
>>>>>>> 49c67a6cad0bd40eb36323f02b26d25ba91b8b1b
?>