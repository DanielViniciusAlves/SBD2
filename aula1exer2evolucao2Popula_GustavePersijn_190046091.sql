-- ---------------------   << Empresa de Vendas  >>   ---------------------
--
--                    SCRIPT DE POPULA (DML)
-- 
-- Data Criacao ...........: 08/11/2022
-- Autor(es) ..............: Gustave A. Persijn
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- -------------------------------------------------------------------------

USE aula1exer2ev2;

INSERT INTO FUNCIONARIO
  (cpf, nome, senha)
VALUES
  (12345678912, 'Gustave Persijn', '12345'),
  (12345678913, 'Giovanni Almeida', '123456'),
  (12345678914, 'Vandor Rissoli', '112233'),
  (12345678915, 'Harry Potter', '111222'),
  (12345678916, 'Rock Lee', '1234567'),
  (12345678917, 'Scott Summers', '12345678');

INSERT INTO GERENTE
  (idGerente, formacaoGerente, email, cpf)
VALUES
  (1, 'Ensino Superior Completo', 'gustave@gmail.com', 12345678912),
  (2, 'Ensino Médio', 'giovanni@gmail.com', 12345678913),
  (3, 'Ensino Fundamental', 'vandor@hotmail.com', 12345678914);

INSERT INTO EMPREGADO
  (matriculaEmpregado, endereco, cpf)
VALUES
  (1, 'Quadra 01 Conjunto A Casa 1', '12345678915'),
  (2, 'Quadra 02 Conjunto B Casa C', '12345678916'),
  (3, 'Quadra 03 Conjunto C Casa 3', '12345678917');

INSERT INTO telefone
  (matriculaEmpregado, telefone)
VALUES
  (1, 61998116544),
  (2, 61998116545),
  (3, 61998116546);

INSERT INTO AREA
  (idArea, descricao)
VALUES
  (1, 'Esportes'),
  (2, 'Livros'),
  (3, 'Vestuario');
  
INSERT INTO SUPERVISAO_monitora
  (idSupervisao, idGerente, matriculaEmpregado, idArea)
VALUES
  (1, 1, 3, 3),
  (2, 2, 1, 2),
  (3, 3, 2, 1);

INSERT INTO PRODUTO
  (idProduto, descricao, preco, idArea)
VALUES
  (1, 'Blusa azul GG', 30.99, 1),
  (2, 'Celular S20 Plus', 2000.00, 2),
  (3, 'Livro Narnia', 10.00, 3);
  
INSERT INTO VENDA
  (idVenda, dataVenda, total, matriculaEmpregado)
VALUES
  (1, '2019-12-30 11:34:09', 10.00, 2),
  (2, '2020-01-08 16:22:56', 20.00, 3),
  (3, '2020-03-02 14:41:22', 35.00, 1);

INSERT INTO contem
  (idProduto, idVenda, quantidade)
VALUES
  (1, 1, 10),
  (2, 2, 15),
  (3, 3, 7);
