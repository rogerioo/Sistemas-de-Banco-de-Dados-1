-- -------------     << Sistema de Eleições >>     -----------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 13/10/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: chatRevisaoP1
--
-- Data Ultima Alteracao ..: 13/10/2019
--   => Criação do modelo físico
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS chatRevisaoP1
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE chatRevisaoP1;


CREATE TABLE ELEITOR (
    tituloEleitor BIGINT(12) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dtNascimento DATE NOT NULL,

    CONSTRAINT ELEITOR_PK PRIMARY KEY (tituloEleitor)
) DEFAULT CHARSET utf8;

CREATE TABLE CANDIDATO (
  tituloEleitor BIGINT(12) NOT NULL,
  dtEleicao DATE NOT NULL,
  numeroCandidato TINYINT(2) NOT NULL,

  CONSTRAINT CANDIDATO_PK 
    PRIMARY KEY (numeroCandidato, dtEleicao, tituloEleitor),

  CONSTRAINT CANDIDATO_ELEITOR_FK FOREIGN KEY (tituloEleitor)
    REFERENCES ELEITOR(tituloEleitor)
) DEFAULT CHARSET utf8;

CREATE TABLE VOTO (
  idVoto BIGINT NOT NULL AUTO_INCREMENT,
  dtEleicao DATE NOT NULL,
  tituloEleitor BIGINT(12) NOT NULL,
  
  CONSTRAINT VOTO_PK PRIMARY KEY (idVoto),
  CONSTRAINT VOTO_UK UNIQUE (dtEleicao, tituloEleitor),

  CONSTRAINT VOTO_ELEITOR_FK FOREIGN KEY (tituloEleitor)
    REFERENCES ELEITOR(tituloEleitor)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8;

CREATE TABLE EFETIVO (
  idVoto BIGINT NOT NULL,
  numeroCandidato TINYINT(2) NOT NULL,

  CONSTRAINT EFETIVO_PK PRIMARY KEY (idVoto),

  CONSTRAINT EFETIVO_VOTO FOREIGN KEY (idVoto)
    REFERENCES VOTO(idVoto),
  CONSTRAINT EFETIVO_CANDIDATO_FK FOREIGN KEY (numeroCandidato)
    REFERENCES CANDIDATO(numeroCandidato)
) DEFAULT CHARSET utf8;

CREATE TABLE JUSTIFICADO (
  idVoto BIGINT NOT NULL,
  jutificativa VARCHAR(1000) NOT NULL,

  CONSTRAINT JUSTIFICADO_PK PRIMARY KEY (idVoto),

  CONSTRAINT JUSTIFICADO_VOTO_FK FOREIGN KEY (idVoto)
    REFERENCES VOTO(idVoto)
) DEFAULT CHARSET utf8;