-- --------     << Detran >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 30/09/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdDetran
--
-- Data Ultima Alteracao ..: 23/09/2019
--   => Criação do modelo físico do banco
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------
CREATE DATABASE bdDetran;
USE bdDetran;

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
  idCategoria INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nomeCategoria VARCHAR(30) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MODELO (
  idModelo INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nomeModelo VARCHAR(30) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VEICULO (
  corPredominante VARCHAR(20) NOT NULL,
  chassi VARCHAR(17) NOT NULL,
  placaVeiculo VARCHAR(7) PRIMARY KEY NOT NULL,
  cpf BIGINT(11) NOT NULL,
  idCategoria INT(2) NOT NULL,
  idModelo INT(2) NOT NULL,
  CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO(cpf),
  CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (idCategoria)
    REFERENCES CATEGORIA(idCategoria),
  CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (idModelo)
    REFERENCES MODELO(idModelo)
);

CREATE TABLE AGENTE (
  matriculaAgente BIGINT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  dtContratacao DATE NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE LOCAL (
  velocidadePermitida INT(3) NOT NULL,
  logitude DECIMAL(9, 6) NOT NULL,
  latitude DECIMAL(8, 6) NOT NULL,
  codigoLocal BIGINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TIPO_INFRACAO (
  codigoInfracao INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(100) NOT NULL,
  classificacao ENUM('Leve', 'Média', 'Grave', 'Gravíssima') NOT NULL,
  valor DECIMAL(6, 2) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE INFRACAO (
  dataHora DATETIME NOT NULL,
  idInfracao BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  velocidadeAferida INT(3),
  placaVeiculo VARCHAR(7) NOT NULL,
  matriculaAgente BIGINT(9) NOT NULL,
  codigoLocal BIGINT(10) NOT NULL,
  codigoInfracao INT(5) NOT NULL,
  CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placaVeiculo)
    REFERENCES VEICULO(placaVeiculo),
  CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matriculaAgente)
    REFERENCES AGENTE(matriculaAgente),
  CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codigoLocal)
    REFERENCES LOCAL(codigoLocal),
  CONSTRAINT INFRACAO_TIPO_INFRACAO_FK FOREIGN KEY (codigoInfracao)
    REFERENCES TIPO_INFRACAO(codigoInfracao)
) ENGINE = InnoDB AUTO_INCREMENT = 1;