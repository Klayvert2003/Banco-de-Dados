-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/05/2022 às 03:16
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
-- Banco de dados: `aula3`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL,
  `curso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `curso`
--

INSERT INTO `curso` (`idcurso`, `curso`) VALUES
(1, 'SQL'),
(2, 'PHP'),
(3, 'Java'),
(4, 'PFSense');

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso_funcinario`
--

CREATE TABLE `curso_funcinario` (
  `idcursofunc` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idfuncionario` int(11) NOT NULL,
  `oferta` date DEFAULT NULL,
  `aprovado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `curso_funcinario`
--

INSERT INTO `curso_funcinario` (`idcursofunc`, `idcurso`, `idfuncionario`, `oferta`, `aprovado`) VALUES
(1, 3, 123, '2018-05-30', 'S'),
(2, 3, 152, '2018-05-30', 'N'),
(3, 3, 222, '2018-05-30', 'S'),
(4, 1, 123, '2018-10-20', 'S'),
(5, 1, 152, '2018-10-20', 'S'),
(6, 4, 222, '2018-11-27', 'S');

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `dNome` varchar(255) NOT NULL,
  `Orcamento` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `departamento`
--

INSERT INTO `departamento` (`idDepartamento`, `dNome`, `Orcamento`) VALUES
(1, 'Financeiro', '15000'),
(2, 'TI', '60000'),
(3, 'Gestão de Pessoas', '150000'),
(5, 'Jurídico', '1000'),
(6, 'Compras', '100000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Sobrenome` varchar(45) NOT NULL,
  `idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`idFuncionario`, `Nome`, `Sobrenome`, `idDepartamento`) VALUES
(123, 'Julio', 'Silva', 1),
(152, 'Arnaldo', 'Coelho', 1),
(222, 'Carol', 'Ferreira', 2),
(326, 'João', 'Silveira', 2),
(331, 'George', 'de la Rocha', 3),
(332, 'José', 'Oliveira', 1),
(546, 'José', 'Pereira', 2),
(631, 'David', 'Luz', 3),
(654, 'Zacarias', 'Ferreira', 2),
(745, 'Eric', 'Estrada', 2),
(788, 'Juliano', 'Souza', 6),
(845, 'Elizabeth', 'Coelho', 1),
(846, 'Joaquim', 'Goveia', 1),
(888, 'Paulo', 'Aguiar', 2);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idcurso`);

--
-- Índices de tabela `curso_funcinario`
--
ALTER TABLE `curso_funcinario`
  ADD PRIMARY KEY (`idcursofunc`),
  ADD KEY `idfuncionario` (`idfuncionario`),
  ADD KEY `idcurso` (`idcurso`);

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idDepartamento`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idFuncionario`),
  ADD KEY `fk_Funcionario_Departamento` (`idDepartamento`);

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `curso_funcinario`
--
ALTER TABLE `curso_funcinario`
  ADD CONSTRAINT `curso_funcinario_ibfk_1` FOREIGN KEY (`idfuncionario`) REFERENCES `funcionario` (`idFuncionario`),
  ADD CONSTRAINT `curso_funcinario_ibfk_2` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`);

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_Funcionario_Departamento` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
