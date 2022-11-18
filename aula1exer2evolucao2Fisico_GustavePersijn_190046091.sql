-- ----------------   << Empresa de Vendas >>   ----------------
--
--                    SCRIPT DE CRIAÇÃO (DDL)
-- 
-- Data Criacao ...........: 08/11/2022
-- Autor(es) ..............: Gustave A. Persijn
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2
-- 
-- Data Ultima Alteração ..: 11/11/2022
--   => Adição do unique para email
--   => Remoção da tabela contem e pertence
--   => Adição da tabela VENDA
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- -------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2ev2
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
    
USE aula1exer2ev2;

CREATE TABLE FUNCIONARIO (
    cpf BIGINT(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(30) NOT NULL,

    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;

CREATE TABLE GERENTE (
    idGerente INT(6) AUTO_INCREMENT NOT NULL,
    formacaoGerente VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    cpf BIGINT(11) NOT NULL,

    CONSTRAINT email_UK UNIQUE (email),
    
    CONSTRAINT GERENTE_PK PRIMARY KEY (idGerente),

    CONSTRAINT GERENTE_FUNCIONARIO_FK FOREIGN KEY (cpf)
        REFERENCES FUNCIONARIO (cpf)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE EMPREGADO (
    matriculaEmpregado INT(6) AUTO_INCREMENT NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cpf BIGINT(11) NOT NULL,

    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matriculaEmpregado),

    CONSTRAINT EMPREGADO_FUNCIONARIO_FK FOREIGN KEY (cpf)
        REFERENCES FUNCIONARIO (cpf)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE AREA (
    idArea INT(6) AUTO_INCREMENT NOT NULL,
    descricao VARCHAR(30) NOT NULL,

   CONSTRAINT AREA_PK PRIMARY KEY (idArea)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE SUPERVISAO_monitora (
    idSupervisao INT(6) AUTO_INCREMENT NOT NULL,
    idGerente INT(6) NOT NULL,
    matriculaEmpregado INT(6) NOT NULL,
    idArea INT(6) NOT NULL,

    CONSTRAINT SUPERVISAO_monitora_PK PRIMARY KEY (idSupervisao),
    
    CONSTRAINT SUPERVISAO_monitora_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado)
        REFERENCES EMPREGADO (matriculaEmpregado),
	CONSTRAINT SUPERVISAO_monitora_GERENTE_FK FOREIGN KEY (idGerente)
        REFERENCES GERENTE (idGerente),
	CONSTRAINT SUPERVISAO_monitora_AREA_FK FOREIGN KEY (idArea)
        REFERENCES AREA (idArea)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE PRODUTO (
    idProduto INT(6) AUTO_INCREMENT NOT NULL,
    descricao VARCHAR(30) NOT NULL,
    preco FLOAT(7,2) NOT NULL,
    idArea INT(6) NOT NULL,

	CONSTRAINT PRODUTO_AREA_FK FOREIGN KEY (idArea)
        REFERENCES AREA (idArea),
        
    CONSTRAINT PRODUTO_PK PRIMARY KEY (idProduto)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE telefone (
    matriculaEmpregado INT(6) NOT NULL,
    telefone BIGINT(13) NOT NULL,

    CONSTRAINT telefone_UK UNIQUE (matriculaEmpregado, telefone),

    CONSTRAINT telefone_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado)
        REFERENCES EMPREGADO(matriculaEmpregado)
) ENGINE = InnoDB;

CREATE TABLE VENDA (
	idVenda INT(6) AUTO_INCREMENT NOT NULL,
	matriculaEmpregado INT(6) NOT NULL,
    total FLOAT(7,2) NOT NULL,
    dataVenda DATETIME NOT NULL,
    
    CONSTRAINT vende_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado)
        REFERENCES EMPREGADO (matriculaEmpregado),
        
    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda)     
) ENGINE = InnoDB;

CREATE TABLE contem (
	idProduto INT(6) NOT NULL,
    idVenda INT(6) NOT NULL,
    quantidade INT NOT NULL,
    
    CONSTRAINT contem_PRODUTO_FK FOREIGN KEY (idProduto)
        REFERENCES PRODUTO (idProduto),
	CONSTRAINT contem_VENDA_FK FOREIGN KEY (idVenda)
        REFERENCES VENDA (idVenda)
) ENGINE = InnoDB;
