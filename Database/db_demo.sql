-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/01/2025 às 19:14
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_demo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id_Aluno` int(4) NOT NULL,
  `matricula` int(9) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `user_status` varchar(7) DEFAULT NULL,
  `data_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id_Aluno`, `matricula`, `nome`, `telefone`, `email`, `user_status`, `data_registro`) VALUES
(27, 202319202, 'Daniel Soares', '6200000-0000', 'daniel.soares@teste.com', 'Inativo', '2023-12-13 15:28:11'),
(28, 202319203, 'Dani Martins', '6200000-0000', 'dani.martins@teste.com', 'Inativo', '2023-12-13 16:58:23'),
(29, 202319204, 'Carol Maia', '6200000-0000', 'carol.maia@teste.com', 'Inativo', '2023-12-13 16:59:29'),
(30, 202320205, 'Eminem Soares', '6200000-0000', 'eminem.soares@teste.com', 'Ativo', '2023-12-13 17:00:42'),
(31, 202320206, 'Rafal oliveira', '62992594657', 'rafael.oliveira@teste.com', 'Ativo', '2023-12-13 17:01:24'),
(32, 202320207, 'Ivani Filho', '6200000-0000', 'ivani.filho@teste.com', 'Ativo', '2023-12-13 17:02:14'),
(33, 202320208, 'joão Gustavo', '6200000-0000', 'joao.gustavo@teste.com', 'Ativo', '2023-12-13 17:02:50'),
(34, 202320209, 'Debora Soares', '6200000-0000', 'debora.soares@teste.com', 'Ativo', '2023-12-13 17:03:26'),
(35, 548789889, 'Mia Silva', '62992594657', 'dani@email.com', 'Ativo', '2024-08-09 11:22:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `codEmprestimo` int(4) NOT NULL,
  `MatriculaAluno` int(9) NOT NULL,
  `NomeAluno` varchar(50) NOT NULL,
  `TituloLivro` varchar(100) NOT NULL,
  `SubTituloLivro` varchar(100) DEFAULT NULL,
  `DataEmprestimo` date NOT NULL,
  `DataDevolucao` date NOT NULL,
  `StatusEmprestimo` varchar(15) DEFAULT NULL,
  `data_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimo`
--

INSERT INTO `emprestimo` (`codEmprestimo`, `MatriculaAluno`, `NomeAluno`, `TituloLivro`, `SubTituloLivro`, `DataEmprestimo`, `DataDevolucao`, `StatusEmprestimo`, `data_registro`) VALUES
(13, 202320121, 'Maria', 'Poesias Efêmeras', 'Ana Poetisa', '2023-10-12', '2023-12-20', 'Disponível', '2023-12-13 11:01:50'),
(14, 202320120, 'Igor Silva', 'Noite de Mistérios ', 'Sombras Do Passado', '2023-11-15', '2023-12-20', 'Emprestado', '2023-12-13 11:04:46'),
(20, 202320209, 'Debora Soares', 'O Último Refúgio ', 'Entre Montanhas', '2023-12-13', '2023-12-20', 'Disponível', '2023-12-13 17:04:23'),
(21, 202320208, 'joão Gustavo', ' O Jardim Secreto', 'Flores da Esperança', '2023-12-22', '2023-12-20', 'Disponível', '2023-12-13 17:06:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `obra`
--

CREATE TABLE `obra` (
  `codObra` int(4) NOT NULL,
  `Isbn` varchar(20) DEFAULT NULL,
  `Titulo` varchar(100) NOT NULL,
  `SubTitulo` varchar(100) DEFAULT NULL,
  `Autor` varchar(100) DEFAULT NULL,
  `Edicao` int(11) DEFAULT NULL,
  `Ano` int(4) DEFAULT NULL,
  `Copia` int(4) NOT NULL,
  `Acervo` varchar(20) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Editora` varchar(60) DEFAULT NULL,
  `Situacao` varchar(15) DEFAULT NULL,
  `data_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `obra`
--

INSERT INTO `obra` (`codObra`, `Isbn`, `Titulo`, `SubTitulo`, `Autor`, `Edicao`, `Ano`, `Copia`, `Acervo`, `Genero`, `Editora`, `Situacao`, `data_registro`) VALUES
(13, '978-0-123456-7', 'Aventuras Fantásticas', 'Descobrindo Mundos ', 'Laura A. Escritora', 1, 2022, 2, 'GV-TR-1', 'Fantasia', 'Saraiva', 'Disponível', '2023-12-13 10:17:43'),
(14, '978-0-234567-8', 'Enigmas da Ciência', 'Desvendando o Inexplorado', 'Carlos Cientista', 3, 2020, 3, 'CA-LE-N2', 'Ciência', 'Imaginários Ltda.', 'Reservado', '2023-12-13 10:26:06'),
(15, '978-0-345678-9', ' O Jardim Secreto', 'Flores da Esperança', ' Sofia Jardineira', 2, 2019, 1, 'CA-LE-N2', 'Infantojuvenil', 'Imaginários Ltda.', 'Disponível', '2023-12-13 10:27:51'),
(16, '978-0-456789-0', 'Noite de Mistérios ', 'Sombras do Passado', 'Rodrigo Detetive', 1, 2021, 4, 'GB-4-L-1-2', 'Mistério', 'Imaginários Ltda.', 'Disponível', '2023-12-13 10:37:41'),
(17, ' 978-0-567890-1', 'Poesias Efêmeras', 'Versos do Coração ', 'Ana Poetisa  ', 4, 2018, 2, 'GB-4-L-1-2', 'Poesia', 'Imaginários Ltda.', 'Disponível', '2023-12-13 10:38:49'),
(18, '978-0-678901-2', 'O Último Refúgio ', 'Entre Montanhas', 'Victor Viajante', 5, 1995, 1, 'CA-LE-N2', 'Ficção Científica', 'Exploração Livros', 'Disponível', '2023-12-13 15:52:10'),
(19, '978-0-123456-0', 'Além das Estrelas ', 'Explorando o Cosmos', 'Lucas Astrônomo', 4, 2021, 1, 'GB-4-L-1-3', 'Aventura', 'Conhecimento Press', 'Disponível', '2023-12-13 16:03:35'),
(20, '978-0-234567-1', 'O Código da História', 'Desvendando o Passado', 'Clara Historiadora', 1, 1993, 5, 'CA-LE-N1', 'Poesia', 'Contos Coloridos', 'Disponível', '2023-12-13 16:11:20'),
(21, '978-0-345678-2', 'Entre Dois Mundos', 'A Fronteira Invisível', 'Roberto Viajante', 1, 1993, 5, 'GB-4-L-1-3', 'Mistério', 'Editora Enigma', 'Disponível', '2023-12-13 16:14:05'),
(22, '978-0-456789-7', 'Poemas da Meia-Noite', 'Versos Sob a Lua', 'Lídia Poetisa', 1, 1998, 1, 'GB-4-L-1-1', 'Literatura Infantojuvenil', 'Saraiva', 'Disponível', '2023-12-13 16:15:49'),
(23, '489-457-58-65', 'Livros de teste', 'Principe', 'Tiago,', 5, 1993, 4, 'CA-LE-N2', 'Historia', 'AstroEdições', 'Disponível', '2024-08-09 16:26:41'),
(24, '489-457-58-65', 'Livros de teste1', 'testando1', 'Igor Silva', 7, 1998, 1, 'CB-LD-WR', 'Historia', 'AstroEdições', 'Disponível', '2024-08-09 16:34:20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reservas`
--

CREATE TABLE `reservas` (
  `CodReserva` int(4) NOT NULL,
  `Matricula` int(9) NOT NULL,
  `NomeAluno` varchar(50) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `SubTitulo` varchar(100) DEFAULT NULL,
  `DataReserva` date NOT NULL,
  `DataExpiracao` date NOT NULL,
  `Situacao` varchar(15) DEFAULT NULL,
  `data_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reservas`
--

INSERT INTO `reservas` (`CodReserva`, `Matricula`, `NomeAluno`, `Titulo`, `SubTitulo`, `DataReserva`, `DataExpiracao`, `Situacao`, `data_registro`) VALUES
(13, 202320209, 'Debora Soares', ' O Jardim Secreto', 'Flores da Esperança', '2024-08-09', '2024-08-16', 'Disponível', '2024-08-09 14:51:53'),
(15, 202320206, 'Rafal oliveira', 'Entre Dois Mundos', 'A Fronteira Invisível', '2024-08-09', '2024-08-16', 'Disponível', '2024-08-09 15:05:38'),
(16, 202320205, 'Eminem Soares', 'O Código da História', 'Desvendando o Passado', '2024-08-16', '2024-08-23', 'Disponível', '2024-08-09 15:06:17'),
(17, 202319204, 'Carol Maia', 'Enigmas da Ciência', 'Desvendando o Inexplorado', '2024-08-10', '2024-08-16', 'Reservado', '2024-08-09 15:07:18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(4) NOT NULL,
  `matricula` int(9) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `senha` varchar(150) NOT NULL,
  `user_status` varchar(7) DEFAULT NULL,
  `user_tipo` varchar(18) DEFAULT NULL,
  `data_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `matricula`, `nome`, `telefone`, `email`, `senha`, `user_status`, `user_tipo`, `data_registro`) VALUES
(19, 123456789, 'Demo', '62123456789', 'demo.dev@email.com', '$2y$10$xKwqcSpBnfPG90uT6zv1eOJ/tFX1.b5E.9kUDgU//Qp0egWXQcBZy', 'Ativo', 'Administrador', '2025-01-23 15:02:59');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id_Aluno`);

--
-- Índices de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`codEmprestimo`);

--
-- Índices de tabela `obra`
--
ALTER TABLE `obra`
  ADD PRIMARY KEY (`codObra`);

--
-- Índices de tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`CodReserva`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id_Aluno` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  MODIFY `codEmprestimo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `obra`
--
ALTER TABLE `obra`
  MODIFY `codObra` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `CodReserva` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
