-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Jan-2022 às 14:34
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estoque`
--
CREATE DATABASE IF NOT EXISTS `estoque` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `estoque`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cd_cliente` int(11) NOT NULL,
  `nm_razao` varchar(255) NOT NULL,
  `nm_fantasia` varchar(255) NOT NULL,
  `cd_cpf` varchar(18) NOT NULL,
  `cd_cep` varchar(10) DEFAULT NULL,
  `ds_endereco` varchar(150) DEFAULT NULL,
  `cd_numero` varchar(6) DEFAULT NULL,
  `nm_bairro` varchar(50) DEFAULT NULL,
  `nm_cidade` varchar(50) DEFAULT NULL,
  `nm_estado` varchar(2) DEFAULT NULL,
  `nm_pais` varchar(100) DEFAULT NULL,
  `nm_email` varchar(100) DEFAULT NULL,
  `cd_telvendedor1` varchar(15) DEFAULT NULL,
  `cd_telvendedor2` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `despesa`
--

CREATE TABLE `despesa` (
  `cd_despesa` int(11) NOT NULL,
  `ds_despesa` varchar(255) NOT NULL,
  `dt_pagamento` date NOT NULL,
  `dt_compra` date NOT NULL,
  `vl_despesa` decimal(5,2) NOT NULL,
  `tipo_despesa_cd_despesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `cd_fornecedor` int(11) NOT NULL,
  `nm_razao` varchar(255) NOT NULL,
  `nm_fantasia` varchar(255) NOT NULL,
  `cd_cnpj` varchar(18) NOT NULL,
  `cd_ie` varchar(25) NOT NULL,
  `cd_cep` varchar(10) DEFAULT NULL,
  `ds_endereco` varchar(150) DEFAULT NULL,
  `cd_numero` varchar(6) DEFAULT NULL,
  `nm_bairro` varchar(50) DEFAULT NULL,
  `nm_cidade` varchar(50) DEFAULT NULL,
  `nm_estado` varchar(2) DEFAULT NULL,
  `nm_pais` varchar(100) DEFAULT NULL,
  `cd_telvendedor1` varchar(15) DEFAULT NULL,
  `cd_telvendedor2` varchar(15) DEFAULT NULL,
  `nm_email` varchar(100) DEFAULT NULL,
  `nm_site` varchar(100) DEFAULT NULL,
  `nm_vendedor` varchar(100) DEFAULT NULL,
  `nom_vendedor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`cd_fornecedor`, `nm_razao`, `nm_fantasia`, `cd_cnpj`, `cd_ie`, `cd_cep`, `ds_endereco`, `cd_numero`, `nm_bairro`, `nm_cidade`, `nm_estado`, `nm_pais`, `cd_telvendedor1`, `cd_telvendedor2`, `nm_email`, `nm_site`, `nm_vendedor`, `nom_vendedor`) VALUES
(1, 'SOLAR LTDA', 'Solar', '123456789123', '1234567', '11461090', 'av sao joao', '11', 'pae-cara', 'guarujá', 'sp', '1333412942', '(86) 9 94727163', '(86) 9 94727163', 'pedro.santos@grupovanguarda.com', 'www', '11988541142', 'Pedro'),
(2, 'AMBEV LTDA', 'Ambev', '123456789123', '1234567', '11461090', 'av sao joao', '11', 'pae-cara', 'guarujá', 'sp', '1333412942', '(86) 9 94727163', '(86) 9 94727163', 'pedro.santos@grupovanguarda.com', 'www', '11988541142', 'Ismenia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamento`
--

CREATE TABLE `lancamento` (
  `cd_lancamento` int(11) NOT NULL,
  `nm_fornecedor` varchar(255) DEFAULT NULL,
  `dt_lancamento` date NOT NULL,
  `qt_produto` int(11) NOT NULL,
  `nm_tipo_lancamento` varchar(255) NOT NULL,
  `cd_nfe` varchar(255) DEFAULT NULL,
  `produto_cd_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `lancamento`
--

INSERT INTO `lancamento` (`cd_lancamento`, `nm_fornecedor`, `dt_lancamento`, `qt_produto`, `nm_tipo_lancamento`, `cd_nfe`, `produto_cd_produto`) VALUES
(899, '1', '2022-01-12', 1, 'entrada', '123568', 1234);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notafiscal`
--

CREATE TABLE `notafiscal` (
  `cd_nfe` varchar(100) NOT NULL,
  `dt_emissao` datetime NOT NULL,
  `dt_criacao` datetime NOT NULL,
  `fornecedor_cd_fornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `notafiscal`
--

INSERT INTO `notafiscal` (`cd_nfe`, `dt_emissao`, `dt_criacao`, `fornecedor_cd_fornecedor`) VALUES
('123565', '2022-01-01 00:00:00', '2018-12-02 00:00:00', 2),
('123568', '2022-01-01 00:00:00', '2018-12-02 00:00:00', 1),
('123575', '2022-01-01 00:00:00', '2018-12-02 00:00:00', 2),
('123579', '2022-01-01 00:00:00', '2018-12-02 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `cd_produto` int(11) NOT NULL,
  `cd_ncm` int(11) NOT NULL,
  `ds_produto` varchar(255) NOT NULL,
  `nm_embalagem` varchar(100) NOT NULL,
  `qt_estoque` int(11) NOT NULL,
  `dt_validade` date DEFAULT NULL,
  `vl_unitario` decimal(5,2) NOT NULL,
  `vl_total` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`cd_produto`, `cd_ncm`, `ds_produto`, `nm_embalagem`, `qt_estoque`, `dt_validade`, `vl_unitario`, `vl_total`) VALUES
(1234, 22021000, 'REFRIGERANTE COCA COLA LATA', 'UN', 0, NULL, '2.00', '1.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `saida_produto`
--

CREATE TABLE `saida_produto` (
  `cd_produto` varchar(10) NOT NULL,
  `ds_produto` varchar(255) NOT NULL,
  `qt_produto` int(11) NOT NULL,
  `vl_unitario` decimal(5,2) NOT NULL,
  `vl_total` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `saida_produto`
--

INSERT INTO `saida_produto` (`cd_produto`, `ds_produto`, `qt_produto`, `vl_unitario`, `vl_total`) VALUES
('1234', 'REFRIGERANTE COCA COLA LATA', 10, '2.00', '0.00'),
('1234', 'REFRIGERANTE COCA COLA LATA', 10, '2.00', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_despesa`
--

CREATE TABLE `tipo_despesa` (
  `cd_despesa` int(11) NOT NULL,
  `nm_despesa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_despesa`
--

INSERT INTO `tipo_despesa` (`cd_despesa`, `nm_despesa`) VALUES
(1, 'loja'),
(2, 'pessoal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--
--Aqui voce altera para usuario e senha para entrar na aplicaçao
--gerardor de senhar que utilizei https://bcrypt-generator.com,
-- a senhar é 123
INSERT INTO `usuario` (`id`, `username`, `password`, `email`) VALUES
(1, 'pedro.santos', '$2a$12$CpWO3vslMdxnEVgGrH7Pie.3EkpPzBe8v0X.9PTXSMXdF/VB08PF6', 'pedro.santos@grupovanguarda.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cd_cliente`);

--
-- Índices para tabela `despesa`
--
ALTER TABLE `despesa`
  ADD PRIMARY KEY (`cd_despesa`),
  ADD KEY `fk_despesa_tipo_despesa2_idx` (`tipo_despesa_cd_despesa`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`cd_fornecedor`);

--
-- Índices para tabela `lancamento`
--
ALTER TABLE `lancamento`
  ADD PRIMARY KEY (`cd_lancamento`),
  ADD KEY `fk_lancamento_produto1_idx` (`produto_cd_produto`);

--
-- Índices para tabela `notafiscal`
--
ALTER TABLE `notafiscal`
  ADD PRIMARY KEY (`cd_nfe`),
  ADD KEY `fk_NotaFiscal_Fornecedor1_idx` (`fornecedor_cd_fornecedor`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cd_produto`);

--
-- Índices para tabela `tipo_despesa`
--
ALTER TABLE `tipo_despesa`
  ADD PRIMARY KEY (`cd_despesa`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cd_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `despesa`
--
ALTER TABLE `despesa`
  MODIFY `cd_despesa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `cd_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `lancamento`
--
ALTER TABLE `lancamento`
  MODIFY `cd_lancamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=900;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `cd_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1235;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `despesa`
--
ALTER TABLE `despesa`
  ADD CONSTRAINT `fk_despesa_tipo_despesa2` FOREIGN KEY (`tipo_despesa_cd_despesa`) REFERENCES `tipo_despesa` (`cd_despesa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `lancamento`
--
ALTER TABLE `lancamento`
  ADD CONSTRAINT `fk_lancamento_produto1` FOREIGN KEY (`produto_cd_produto`) REFERENCES `produto` (`cd_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `notafiscal`
--
ALTER TABLE `notafiscal`
  ADD CONSTRAINT `fk_NotaFiscal_Fornecedor1` FOREIGN KEY (`fornecedor_cd_fornecedor`) REFERENCES `fornecedor` (`cd_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
