DROP DATABASE IF EXISTS marquinhos;
CREATE DATABASE marquinhos CHARACTER SET utf8 collate utf8_general_ci;
USE marquinhos;

CREATE TABLE endereco (
	cep CHAR (9) PRIMARY KEY,
	rua VARCHAR (60) NOT NULL,
	bairro VARCHAR (40) NOT NULL,
	cidade VARCHAR (40) NOT NULL,
	uf CHAR (2) NOT NULL);

CREATE TABLE cliente (
	cpf CHAR (12) PRIMARY KEY,
	nome VARCHAR (60) NOT NULL,
	telefone VARCHAR (15) NOT NULL,
	cep char (9) NOT NULL,
	numerocasa INTEGER NOT NULL,
	complemento VARCHAR (30),
	FOREIGN KEY (cep) REFERENCES endereco (cep));
	
CREATE TABLE funcionario (
	matricula INTEGER PRIMARY KEY auto_increment,
	nome VARCHAR (60) NOT NULL,
	telefone VARCHAR (15) NOT NULL,
	cpf CHAR (12) NOT NULL,
	qualificacao VARCHAR (30) NOT NULL,
	experiencia VARCHAR (20) NOT NULL,
	cep char (9) NOT NULL,
	numerocasa INTEGER NOT NULL,
	complemento VARCHAR (30),
	email varchar (150) not null,
	senha varchar (255) not null,
	status CHAR (1),
	FOREIGN KEY (cep) REFERENCES endereco (cep));
	
CREATE TABLE veiculo (
	placa CHAR (7) PRIMARY KEY,
	modelo VARCHAR (20) NOT NULL,
	marca VARCHAR (20) NOT NULL,
	cor VARCHAR (20) NOT NULL,
	ano CHAR (4) NOT NULL,
	cpf CHAR (12) NOT NULL,
	FOREIGN KEY (cpf) REFERENCES cliente (cpf));
	
CREATE TABLE servico (
	ordemservico INTEGER PRIMARY KEY auto_increment,
	descricao VARCHAR (100) NOT NULL,
	formapagamento VARCHAR (20) NOT NULL,
	valor DOUBLE NOT NULL,
	garantia VARCHAR (50) NOT NULL,
	dataentrada DATE NOT NULL,
	datasaida DATE NOT NULL,
	placa CHAR (7) NOT NULL,
	FOREIGN KEY (placa) REFERENCES veiculo (placa));
	
CREATE TABLE peca (
	codigopeca INTEGER PRIMARY KEY auto_increment,
	nome VARCHAR (60) NOT NULL,
	marca VARCHAR (40) NOT NULL,
	quantidade INTEGER (100) NOT NULL,
	preco DOUBLE NOT NULL,
	modeloano VARCHAR (250) NOT NULL);
	
CREATE TABLE servicopeca (
	idservicopeca INTEGER PRIMARY KEY auto_increment,
	quantidade INTEGER NOT NULL,
	codigopeca INTEGER NOT NULL,
	ordemservico INTEGER NOT NULL,
	FOREIGN KEY (codigopeca) REFERENCES peca (codigopeca),
	FOREIGN KEY (ordemservico) REFERENCES servico (ordemservico)); 
	
CREATE TABLE servicofunc (
	idservicofunc INTEGER PRIMARY KEY auto_increment,
	descricao VARCHAR (100) NOT NULL,
	ordemservico INTEGER NOT NULL,
	matricula INTEGER NOT NULL,
	FOREIGN KEY (ordemservico) REFERENCES servico (ordemservico),
	FOREIGN KEY (matricula) REFERENCES funcionario (matricula));
	
INSERT INTO endereco (cep, rua, bairro, cidade, uf) VALUES
	('23085-610', 'Rua Padre Pauwels', 'Campo Grande', 'Rio de Janeiro', 'RJ'),
	('23098-030', 'Rua Manoel Gregorio', 'Santissimo', 'Rio de Janeiro', 'RJ'),
	('23065-075', 'Rua Oswaldo Cruz', 'Paciência', 'Rio de Janeiro', 'RJ');

INSERT INTO cliente (cpf, nome, telefone, cep, numerocasa, complemento) VALUES
	('123456789-10', 'Josefina', '(21)1231-54265', '23085-610', '100', 'Apartamneto 10'),
	('111234567-10', 'Jubiscleio', '(21)1123-4567', '23098-030', '2', 'Lote 6'); 	
	
INSERT INTO funcionario (nome, telefone, cpf, qualificacao, experiencia, cep, numerocasa, complemento, email, senha) VALUES
	('Everaldo', '(21)9945-00002', '112345678-10', 'Mecanico', '10 Anos', '23098-030', '62', 'Casa Linda', 'raldoeve@gmail.com', '123', 'A'),
	('Poliane', '(21)9965-00000', '002154637-00', 'Operadora de Caixa', '5 Anos', '23085-610', '50', 'Sem Complemento', 'polinane@gmail.com', '1234', 'A'),
	('Rafaella', '(21)96583-00000', '125497526-25', 'MBA logistica empresarial', '8 Anos', '23065-075', '65', 'Casa', 'rafa.ella@gmail.com', '321', 'A');

INSERT INTO veiculo (placa, marca, modelo, cor, ano, cpf) VALUES
	('lsv3A86', 'citroen', 'c3', 'preto', '2009', '123456789-10'),
	('mmm1B55', 'Renault', 'Logan', 'prata', '2015', '111234567-10');

INSERT INTO servico (descricao, formapagamento, valor, garantia, dataentrada, datasaida, placa) VALUES
	('troca de peca', 'credito', '250', '3 meses', '2022-05-25', '2022-05-27', 'lsv3A86'),
	('compra de peca', 'dinheiro', '60', '3 meses', '2022-05-28', '2022-05-28', 'mmm1B55');

INSERT INTO peca (nome, marca, quantidade, preco, modeloano) VALUES
	('Amortecedor', 'bomdemais', '100', '125', 'citroen 2009'),
	('freio', 'paradacerta', '150', '20', 'Renault 2015');
	
INSERT INTO servicopeca (quantidade, codigopeca, ordemservico) VALUES
	('2', '1', '1'),
	('3', '2', '2');
	
INSERT INTO servicofunc (descricao, ordemservico, matricula) VALUES
	('troca de peca', '1', '1'),
	('compra de peca', '2', '2');
	
/*<? php 		
	$host = "localhost";
	$user = "root";
	$pass = "";
	$dbname = "marquinhos";
	$port = 3306;
	
try(
	$conn = new PDO ("mysql:host=$host;port=$port;dbname=" . $dbname, $user, $pass);
		echo "Conexão com banco de dados realizados com sucesso!";
	)catch (PDOException $erro) {
		echo "Erro: Conexão com banco de dados não realizada." .$erro;
	}
	
	?>

/*funcionaria Rafa
nome => Rafaella Santos /telefone =>(21)96583-1545 /cpf => 125.497.526-25 /qualificacao => MBA Logística empresarial
experiencia => 8 anos /email => rafa.ella@gmail.com/ cep => 23065-075 /rua => Rua Oswaldo Cruz /numero => 56 
complemento => s/ /bairro => Paciência /cidade => Rio de Janeiro /uf => RJ /senha => 321

/*
 
	1) Pesquisar os dados de todos os clientes.

		select * from cliente;
	
	2) Pesquisar nome e telefone de todos os clientes.
	
		select nome, telefone from cliente;
		
	3) Pesquisar placa, marca e modelo de todos os veículos da cor preta
	
		select placa, marca, modelo from veiculo where cor = 'preto';
		
	4) Pesquisar placa, marca e modelo de todos os veiculos que tenham qualquer variação na cor preta
	
		select placa, marca, modelo from veiculo where cor like %preto%;
		
	- Editar os dados dos cliente de cpf 123456789-10 e 0000000000 e 00000000000 para acrescentar o sobrenome .
	
		update cliente set nome = 'Josefina Aparecida da Silva' where cpf = '123456789-10';
		
		update cliente set nome = 'Jubiscleio dos Santos' where cpf = '111234567-10';
	
	5) Pesquisar nome e telefone de todos os clientes que o nome comece com J
	
		select nome, telefone from cliente where nome like 'j%';
		
	6) Pesquisar o nome e telefone de todos os clientes que o ultimo sobrenome seja Silva. (usar "%" no final,
  	   pra saber no nome todo usar "%" no começo e no final)
	
		select nome, telefone from cliente where nome like '%Silva';
	
	7) Pesquisar ordem de serviço, placa e defeito apresentados pelos carros que deram entrada na oficina entre
	os dias 1/05/2022 e 24/05/2022 .
	
		select ordemservico, placa, descricao from servico 
		where dataentrada >= '2022-05-1' and datasaida <= '2022-05-24';
		
		select ordemservico, placa, descricao from servico 
		where dataentrada between '2022-05-1' and '2022-05-24';
		
	8) Pesquisar ordem de serviço, placa do veiculo, defeito dos veiculos que deram entrada na oficina nos dias 
	15 e 28 de maio.
	
		select ordemservico, placa, descricao
		from servico
		where dataentrada in ('2022-05-15', '2022-05-28');
		
	9) Mostrar a soma da quantidade das peças da oficina.
	
		select sum(quantidade) from peca;
		
	10) Mostrar o valor total em mercadorias no estoque.
	
		select sum(quantidade * preco) from peca;
		
	-- nomeando a coluna da pesquisa --
	
		select sum(quantidade * preco) as 'Valor Total do Estoque' from peca;
		
	11) Calcular o vslor médio das peças no estoque.
	
		select avg(preco) as 'Média de Preços' from peca;
		
	12) Mostrar a peça com menor preço do estoque.
	
		select min(preco) as 'Menor Preço' from peca;
		
	13) Mostrar a peça com o maior preço no estoque.
	
		select max(preco) as 'Maior Preço' from peca;
		
	14) Mostrar nome, telefone e qualificação de todos os funcionários.
	
		select nome, telefone, qualificacao from funcionarios;
	
	15) Mostrar nome e telefone de todos os eletricistas.
	
		select nome, telefone from funcionario where qualificacao = 'eletricista';
	
	16) Mostrar nome e preço de todos os produtos da marca frasle.
	
		select nome, preco from peca where marca = 'frasle';
	
	17) Mostrar ordem de servico e preço pago de todos os serviços que foram pagos a vista no dia 01/12/2022.
	
		select ordemservico, preco from servico where formapagamento= 'a vista' and dataentrada in ('2022-12-01');
	
	18) Pesquisar nome, telefone, nome da rua, numero da casa, bairro e cidade de todos os clientes da oficina. 
	
		select cliente.nome, cliente.telefone, endereco.rua, cliente.numerocasa, endereco.bairro, endereco.cidade 
		from endereco inner join cliente on endereco.cep = cliente.cep;
	
	19) Pesquisar nome, telefone, placa e modelo do carro de todos os clientes.
	
		select cliente.nome, cliente.telefone, veiculo.placa, veiculo.modelo
		from cliente inner join veiculo
		on cliente.cpf = veiculo.cpf;
	
	20) Pesquisar nome e quantidade de todas as pecas usadas na ordem de servico
	
		select nome.peca servicopeca.quantidade from peca
		inner join servicopeca on peca.codigopeca = servicopeca.codigopeca
		and servicopeca.ordemservico = 1;
		
	21) Pesquisar nome do cliente, telefone, placa do veiculo, ordem de servico e defeito de todos os serviços que ja 		  foram feitos na oficina.
	
		select cliente.nome, cliente.telefone, veiculo.placa, servico.ordemservico, servico.descricao
	    from cliente inner join veiculo
		on cliente.cpf = veiculo.cpf 
		inner join servico
		on veiculo.placa = servico.placa;
	
	
	
*/
