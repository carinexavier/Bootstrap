-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Fev-2023 às 00:36
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `marquinhos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` char(12) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cep` char(9) NOT NULL,
  `numerocasa` int(11) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `nome`, `telefone`, `cep`, `numerocasa`, `complemento`) VALUES
('111234567-10', 'Jubiscleio', '(21)1123-4567', '23098-030', 2, 'Lote 6'),
('123456789-10', 'Josefina', '(21)1231-54265', '23085-610', 100, 'Apartamneto 10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `cep` char(9) NOT NULL,
  `rua` varchar(60) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `cidade` varchar(40) NOT NULL,
  `uf` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`cep`, `rua`, `bairro`, `cidade`, `uf`) VALUES
('23065-075', 'Rua Oswaldo Cruz', 'Paciência', 'Rio de Janeiro', 'RJ'),
('23085-610', 'Rua Padre Pauwels', 'Campo Grande', 'Rio de Janeiro', 'RJ'),
('23098-030', 'Rua Manoel Gregorio', 'Santissimo', 'Rio de Janeiro', 'RJ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cpf` char(12) NOT NULL,
  `qualificacao` varchar(30) NOT NULL,
  `experiencia` varchar(20) NOT NULL,
  `cep` char(9) NOT NULL,
  `numerocasa` int(11) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`matricula`, `nome`, `telefone`, `cpf`, `qualificacao`, `experiencia`, `cep`, `numerocasa`, `complemento`, `email`, `senha`, `status`, `foto`) VALUES
(1, 'Everaldo', '(21)9945-00002', '112345678-10', 'Mecanico', '10 Anos', '23098-030', 62, 'Casa Linda', 'raldoeve@gmail.com', '123', 'A', ''),
(2, 'Poliane', '(21)9965-00000', '002154637-00', 'Operadora de Caixa', '5 Anos', '23085-610', 50, 'Sem Complemento', 'polinane@gmail.com', '1234', 'A', ''),
(3, 'Rafaella', '(21)96583-00000', '125497526-25', 'MBA logistica empresarial', '8 Anos', '23065-075', 65, 'Casa', 'rafa.ella@gmail.com', '321', 'A', ''),
(4, 'maria', '(21)98563-6512', '123.654.789-', 'programadora', '2 anos', '23098-030', 630, 'apartamento', 'maria@prog.com', '$2y$10$B7wJIi3o5kj.AXKY5sj/n.P7oBVytT3oSG.6eg8B61Tj9CweusBs.', 'A', 'fotos/63d316a4f3b13.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `peca`
--

CREATE TABLE `peca` (
  `codigopeca` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `marca` varchar(40) NOT NULL,
  `quantidade` int(100) NOT NULL,
  `preco` double NOT NULL,
  `modeloano` varchar(250) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `peca`
--

INSERT INTO `peca` (`codigopeca`, `nome`, `marca`, `quantidade`, `preco`, `modeloano`, `foto`) VALUES
(1, 'Amortecedor', 'bomdemais', 100, 125, 'citroen 2009', 'produtos/amortecedor.jpg'),
(2, 'freio', 'paradacerta', 150, 20, 'Renault 2015', 'produtos/63d8601d3522d.webp'),
(3, 'Bieleta', 'magneti marelli', 15, 65, 'de 2009 a 2015', 'produtos/bieleta.jpg'),
(4, 'Vela', 'universal', 70, 15, 'de 2000/2018', 'imagens/vela.webp'),
(5, 'Porta treco', 'universal', 70, 40, 'universal', 'imagens/portatreco.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `ordemservico` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `formapagamento` varchar(20) NOT NULL,
  `valor` double NOT NULL,
  `garantia` varchar(50) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date NOT NULL,
  `placa` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`ordemservico`, `descricao`, `formapagamento`, `valor`, `garantia`, `dataentrada`, `datasaida`, `placa`) VALUES
(1, 'troca de peca', 'credito', 250, '3 meses', '2022-05-25', '2022-05-27', 'lsv3A86'),
(2, 'compra de peca', 'dinheiro', 60, '3 meses', '2022-05-28', '2022-05-28', 'mmm1B55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicofunc`
--

CREATE TABLE `servicofunc` (
  `idservicofunc` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `ordemservico` int(11) NOT NULL,
  `matricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `servicofunc`
--

INSERT INTO `servicofunc` (`idservicofunc`, `descricao`, `ordemservico`, `matricula`) VALUES
(1, 'troca de peca', 1, 1),
(2, 'compra de peca', 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicopeca`
--

CREATE TABLE `servicopeca` (
  `idservicopeca` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `codigopeca` int(11) NOT NULL,
  `ordemservico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `servicopeca`
--

INSERT INTO `servicopeca` (`idservicopeca`, `quantidade`, `codigopeca`, `ordemservico`) VALUES
(1, 2, 1, 1),
(2, 3, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `placa` char(7) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `cor` varchar(20) NOT NULL,
  `ano` char(4) NOT NULL,
  `cpf` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`placa`, `modelo`, `marca`, `cor`, `ano`, `cpf`) VALUES
('lsv3A86', 'c3', 'citroen', 'preto', '2009', '123456789-10'),
('mmm1B55', 'Logan', 'Renault', 'prata', '2015', '111234567-10');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `cep` (`cep`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`cep`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `cep` (`cep`);

--
-- Índices para tabela `peca`
--
ALTER TABLE `peca`
  ADD PRIMARY KEY (`codigopeca`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`ordemservico`),
  ADD KEY `placa` (`placa`);

--
-- Índices para tabela `servicofunc`
--
ALTER TABLE `servicofunc`
  ADD PRIMARY KEY (`idservicofunc`),
  ADD KEY `ordemservico` (`ordemservico`),
  ADD KEY `matricula` (`matricula`);

--
-- Índices para tabela `servicopeca`
--
ALTER TABLE `servicopeca`
  ADD PRIMARY KEY (`idservicopeca`),
  ADD KEY `codigopeca` (`codigopeca`),
  ADD KEY `ordemservico` (`ordemservico`);

--
-- Índices para tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `peca`
--
ALTER TABLE `peca`
  MODIFY `codigopeca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `ordemservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `servicofunc`
--
ALTER TABLE `servicofunc`
  MODIFY `idservicofunc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `servicopeca`
--
ALTER TABLE `servicopeca`
  MODIFY `idservicopeca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cep`) REFERENCES `endereco` (`cep`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cep`) REFERENCES `endereco` (`cep`);

--
-- Limitadores para a tabela `servico`
--
ALTER TABLE `servico`
  ADD CONSTRAINT `servico_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `veiculo` (`placa`);

--
-- Limitadores para a tabela `servicofunc`
--
ALTER TABLE `servicofunc`
  ADD CONSTRAINT `servicofunc_ibfk_1` FOREIGN KEY (`ordemservico`) REFERENCES `servico` (`ordemservico`),
  ADD CONSTRAINT `servicofunc_ibfk_2` FOREIGN KEY (`matricula`) REFERENCES `funcionario` (`matricula`);

--
-- Limitadores para a tabela `servicopeca`
--
ALTER TABLE `servicopeca`
  ADD CONSTRAINT `servicopeca_ibfk_1` FOREIGN KEY (`codigopeca`) REFERENCES `peca` (`codigopeca`),
  ADD CONSTRAINT `servicopeca_ibfk_2` FOREIGN KEY (`ordemservico`) REFERENCES `servico` (`ordemservico`);

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `cliente` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
