-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/05/2022 às 03:00
-- Versão do servidor: 10.4.13-MariaDB
-- Versão do PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pratica_3`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `chamados`
--

CREATE TABLE `chamados` (
  `idchamado` int(11) NOT NULL,
  `datahora` datetime DEFAULT NULL,
  `prioridade` varchar(30) NOT NULL,
  `problema` varchar(80) NOT NULL,
  `solucao` varchar(60) NOT NULL,
  `avaliacao` varchar(60) NOT NULL,
  `idusr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `chamados`
--

INSERT INTO `chamados` (`idchamado`, `datahora`, `prioridade`, `problema`, `solucao`, `avaliacao`, `idusr`) VALUES
(1, '2022-02-25 17:23:05', 'Sim', 'Erro no Cadastro', 'Contatar Suporte Técnico', '7', 1),
(2, '2022-04-12 13:30:00', 'Não', 'Problema com o contrato', 'Contatar Contratante', '7', 2),
(3, '2022-01-22 12:00:50', 'Não', 'Erro no Cadastro', 'Contatar Suporte Técnico', '6', 3),
(4, '2022-05-11 15:06:12', 'Sim', 'Defeito no Produto', 'Contatar Fornecedor', '9', 4),
(5, '2022-12-02 10:54:45', 'Não', 'Erro no Cadastro', 'Contatar Suporte Técnico', '10', 5),
(6, '2022-05-26 11:32:33', 'Sim', 'Defeito no Produto', 'Contatar Fornecedor', '4', 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusr` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `setor` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idusr`, `nome`, `setor`) VALUES
(1, 'José da Silva', 'Administração'),
(2, 'Antônio Arruda', 'Recursos Humanos'),
(3, 'Maria Joaquina', 'TI'),
(4, 'Larissa Isabelle', 'Engenharia'),
(5, 'Fernanda Pereira', 'TI'),
(6, 'Clarissa Armando', 'Engenharia');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `chamados`
--
ALTER TABLE `chamados`
  ADD PRIMARY KEY (`idchamado`),
  ADD UNIQUE KEY `datahora` (`datahora`),
  ADD KEY `idusr` (`idusr`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusr`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `chamados`
--
ALTER TABLE `chamados`
  MODIFY `idchamado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `chamados`
--
ALTER TABLE `chamados`
  ADD CONSTRAINT `chamados_ibfk_1` FOREIGN KEY (`idusr`) REFERENCES `usuario` (`idusr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
