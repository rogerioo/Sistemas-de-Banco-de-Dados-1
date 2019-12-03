-- --------     << Detran >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 30/10/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer6Evolucao4
--
-- Data Ultima Alteracao ..: 14/10/2019
--   => Correção das contraints de fk's
--   => Correção dos nomes das chaves estrangeiras
--   => Adição da engine com auto increment
--   => Adição do innodb em todas as tabelas
--   => Definição do charset padrão em todas as tabelas e no banco
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao4
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE aula4exer6Evolucao4;

CREATE TABLE PROPRIETARIO (
  cpf BIGINT(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  sexo ENUM('M', 'F') NOT NULL,
  dtNascimento DATE NOT NULL,
  rua VARCHAR(30) NOT NULL,
  numero INT NOT NULL,
  bairro VARCHAR(30) NOT NULL,
  complemento VARCHAR(50),
  cidade VARCHAR(50) NOT NULL,
  estado CHAR(2) NOT NULL,
  cep BIGINT(8) NOT NULL,

  CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf) 
) Engine = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE telefone (
  cpf BIGINT(11) NOT NULL,
  numero BIGINT(14) NOT NULL,
  CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO(cpf)
) Engine = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE CATEGORIA (
  codigoCategoria INT(2) NOT NULL AUTO_INCREMENT,
  descCategoria VARCHAR(30) NOT NULL,

  CONSTRAINT CATEGORIA_PK PRIMARY KEY (codigoCategoria)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE MODELO (
  codigoModelo INT(2) NOT NULL AUTO_INCREMENT,
  descModelo VARCHAR(30) NOT NULL,

  CONSTRAINT MODELO_PK PRIMARY KEY (codigoModelo)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE VEICULO (
  placa VARCHAR(7) NOT NULL,
  chassi VARCHAR(17) NOT NULL,
  anoFab INT(4) NOT NULL,
  corPredominante VARCHAR(20) NOT NULL,
  cpf BIGINT(11) NOT NULL,
  codigoModelo INT(2) NOT NULL,
  codigoCategoria INT(2) NOT NULL,

  CONSTRAINT VEICULO_PK PRIMARY KEY (placa),

  CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO(cpf),
  CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codigoCategoria)
    REFERENCES CATEGORIA(codigoCategoria),
  CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codigoModelo)
    REFERENCES MODELO(codigoModelo)
) Engine = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE AGENTE (
  matriculaFuncional BIGINT(9) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  dtContratacao DATE NOT NULL,

  CONSTRAINT AGENTE_PK PRIMARY KEY(matriculaFuncional)
) Engine = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE LOCAL (
  codigoLocal BIGINT(10) NOT NULL AUTO_INCREMENT,
  longitude DECIMAL(9, 6) NOT NULL,
  latitude DECIMAL(8, 6) NOT NULL,
  velocidadePermitida INT(3) NOT NULL,

  CONSTRAINT LOCAL_PK PRIMARY KEY (codigoLocal)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE TIPO_INFRACAO (
  codigoInfracao INT(5) NOT NULL AUTO_INCREMENT,
  descInfracao VARCHAR(100) NOT NULL,
  valorInfracao DECIMAL(6, 2) NOT NULL,

  CONSTRAINT TIPO_INFRACAO_PK PRIMARY KEY (codigoInfracao)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE INFRACAO (
  idInfracao BIGINT NOT NULL AUTO_INCREMENT,
  dtHora DATETIME NOT NULL,
  velocidadeAferida INT(3),
  placa VARCHAR(7) NOT NULL,
  codigoLocal BIGINT(10) NOT NULL,
  codigoInfracao INT(5) NOT NULL,
  matriculaFuncional BIGINT(9) NOT NULL,

  CONSTRAINT INFRACAO PRIMARY KEY (idInfracao),

  CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa)
    REFERENCES VEICULO(placa),
  CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matriculaFuncional)
    REFERENCES AGENTE(matriculaFuncional),
  CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codigoLocal)
    REFERENCES LOCAL(codigoLocal),
  CONSTRAINT INFRACAO_TIPO_INFRACAO_FK FOREIGN KEY (codigoInfracao)
    REFERENCES TIPO_INFRACAO(codigoInfracao)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;