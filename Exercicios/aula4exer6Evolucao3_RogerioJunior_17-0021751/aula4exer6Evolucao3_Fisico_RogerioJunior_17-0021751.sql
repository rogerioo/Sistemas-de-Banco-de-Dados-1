-- --------     << Detran >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 30/10/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer6Evolucao3
--
-- Data Ultima Alteracao ..: 09/09/2019
--   => Correção das contraints de fk's
--   => Correção dos nomes das chaves estrangeiras
--   => Adição da engine com auto increment
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao3;
USE aula4exer6Evolucao3;

CREATE TABLE PROPRIETARIO (
  cpf BIGINT(11) NOT NULL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  sexo ENUM('M', 'F') NOT NULL,
  dtNascimento DATE NOT NULL,
  rua VARCHAR(30) NOT NULL,
  numero INT NOT NULL,
  bairro VARCHAR(30) NOT NULL,
  complemento VARCHAR(50),
  cidade VARCHAR(50) NOT NULL,
  estado CHAR(2) NOT NULL,
  cep BIGINT(8) NOT NULL
);

CREATE TABLE telefone (
  cpf BIGINT(11) NOT NULL,
  numero BIGINT(14) NOT NULL,
  CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO(cpf)
);

CREATE TABLE CATEGORIA (
  codigoCategoria INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descCategoria VARCHAR(30) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MODELO (
  codigoModelo INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descModelo VARCHAR(30) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VEICULO (
  placa VARCHAR(7) PRIMARY KEY NOT NULL,
  chassi VARCHAR(17) NOT NULL,
  anoFab INT(4) NOT NULL,
  corPredominante VARCHAR(20) NOT NULL,
  codigoCategoria INT(2) NOT NULL,
  codigoModelo INT(2) NOT NULL,
  cpf BIGINT(11) NOT NULL,

  CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO(cpf),
  CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codigoCategoria)
    REFERENCES CATEGORIA(codigoCategoria),
  CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codigoModelo)
    REFERENCES MODELO(codigoModelo)
);

CREATE TABLE AGENTE (
  matriculaFuncional BIGINT(9) NOT NULL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  dtContratacao DATE NOT NULL
);

CREATE TABLE LOCAL (
  codigoLocal BIGINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  longitude DECIMAL(9, 6) NOT NULL,
  latitude DECIMAL(8, 6) NOT NULL,
  velocidadePermitida INT(3) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TIPO_INFRACAO (
  codigoInfracao INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descInfracao VARCHAR(100) NOT NULL,
  valorInfracao DECIMAL(6, 2) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE INFRACAO (
  idInfracao BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  dtHora DATETIME NOT NULL,
  velocidadeAferida INT(3),
  placa VARCHAR(7) NOT NULL,
  codigoLocal BIGINT(10) NOT NULL,
  codigoInfracao INT(5) NOT NULL,
  matriculaFuncional BIGINT(9) NOT NULL,

  CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa)
    REFERENCES VEICULO(placa),
  CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matriculaFuncional)
    REFERENCES AGENTE(matriculaFuncional),
  CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codigoLocal)
    REFERENCES LOCAL(codigoLocal),
  CONSTRAINT INFRACAO_TIPO_INFRACAO_FK FOREIGN KEY (codigoInfracao)
    REFERENCES TIPO_INFRACAO(codigoInfracao)
) ENGINE = InnoDB AUTO_INCREMENT = 1;