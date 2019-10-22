-- ---------------------     << Prova 01 >>     ---------------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 17/10/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: RogerioJunior
-- 
-- Data Ultima Alteracao ..: 21/10/2019
--   => Retira chave primaria da tabela 'tem'
--   => Adaptação ao collate padrão do mySQL 5.7 
--
-- PROJETO => 07 Base de Dados
--         => 11 Tabelas
--
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS RogerioJunior;
USE RogerioJunior;

CREATE TABLE CARACTERISTICA (
    idCaracteristica INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,

    CONSTRAINT CARACTERISTICA_PK PRIMARY KEY (idCaracteristica)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PESSOA (
    idPessoa  INT NOT NULL AUTO_INCREMENT,
    primeiroNome VARCHAR(30) NOT NULL,
    ultimoNome VARCHAR(80) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    dtNascimento DATE NOT NULL,
    apelido VARCHAR(20) NOT NULL,

    CONSTRAINT PESSOA_PK PRIMARY KEY (idPessoa)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE INTERESSE (
    idInteresse INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,

    CONSTRAINT idInteresse_PK PRIMARY KEY (idInteresse)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE email (
    idPessoa INT NOT NULL,
    email VARCHAR(50) NOT NULL,

    CONSTRAINT email_UK UNIQUE(email)
) ENGINE = InnoDB;

CREATE TABLE relaciona (
    idPessoa  INT NOT NULL,
    idAmigo  INT NOT NULL,

    CONSTRAINT relaciona_UK UNIQUE (idPessoa , idAmigo),

    CONSTRAINT relaciona_PESSOA_FK FOREIGN KEY (idPessoa)
      REFERENCES PESSOA(idPessoa),
    CONSTRAINT relaciona_PESSOA_amigo_FK FOREIGN KEY (idAmigo)
      REFERENCES PESSOA(idPessoa)
) ENGINE = InnoDB;

CREATE TABLE possui (
    idCaracteristica INT NOT NULL,
    idPessoa  INT NOT NULL,

    CONSTRAINT possui_UK UNIQUE (idCaracteristica, idPessoa),

    CONSTRAINT possui_CARACTERISTICA_FK FOREIGN KEY (idCaracteristica)
      REFERENCES CARACTERISTICA(idCaracteristica),
    CONSTRAINT possui_PESSOA_FK FOREIGN KEY (idPessoa)
      REFERENCES PESSOA(idPessoa)
) ENGINE = InnoDB;

CREATE TABLE tem (
    idPessoa INT NOT NULL,
    idInteresse INT NOT NULL,

    CONSTRAINT tem_UK UNIQUE (idPessoa, idInteresse),

    CONSTRAINT tem_INTERESSE_FK FOREIGN KEY (idInteresse)
      REFERENCES INTERESSE(idInteresse),
    CONSTRAINT tem_PESSOA_FK FOREIGN KEY (idPessoa)
      REFERENCES PESSOA(idPessoa)
) ENGINE = InnoDB;