-- ---------------------   << Empresa FUI  >>   ---------------------
--
--                    SCRIPT DE CRIAÇÃO (DDL)
-- 
-- Data Criacao ...........: 04/11/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer7
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
-- 
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer7
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
USE aula4exer7;

CREATE TABLE PESSOA (
    idPessoa INT(11) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    dtNascimento DATE NOT NULL,

    CONSTRAINT PESSOA_PK PRIMARY KEY (idPessoa)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE DEPENDENTE (
    idDependente INT(11) AUTO_INCREMENT NOT NULL,
    parentesco VARCHAR(20) NOT NULL,
    idPessoa INT(11) NOT NULL,

    CONSTRAINT DEPENDENTE_PK PRIMARY KEY (idDependente),

    CONSTRAINT DEPENDENTE_PESSOA_FK FOREIGN KEY (idPessoa)
        REFERENCES PESSOA(idPessoa)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE DEPARTAMENTO (
    idDepartamento INT(11) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,

    CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY (idDepartamento)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE LOCALIZACAO (
    idLocalizacao INT(11) AUTO_INCREMENT NOT NULL,
    bloco CHAR(1) NOT NULL,
    andar INT(2) NOT NULL,
    sala INT(4) NOT NULL,

    CONSTRAINT LOCALIZACAO_PK PRIMARY KEY (idLocalizacao)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PROJETO (
    idProjeto INT(11) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    idLocalizacao INT(11) NOT NULL,
    idDepartamento INT(11) NOT NULL,

    CONSTRAINT PROJETO_PK PRIMARY KEY (idProjeto),

    CONSTRAINT PROJETO_LOCALIZACAO_FK FOREIGN KEY (idLocalizacao)
        REFERENCES LOCALIZACAO(idLocalizacao),
    CONSTRAINT PROJETO_DEPARTAMENTO_FK FOREIGN KEY (idDepartamento)
        REFERENCES DEPARTAMENTO(idDepartamento)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE EMPREGADO (
    matricula INT(11) AUTO_INCREMENT NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INT(5) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    salario DOUBLE(7,2) NOT NULL,
    idPessoa INT(11) NOT NULL,
    idSupervisor INT,
    idDepartamento INT(11) NOT NULL,

    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matricula),
    CONSTRAINT EMPREGADO_UK UNIQUE KEY (idPessoa),

    CONSTRAINT EMPREGADO_PESSOA FOREIGN KEY (idPessoa)
        REFERENCES PESSOA(idPessoa),
    CONSTRAINT EMPREGADO_AUTO_FK FOREIGN KEY (idSupervisor)
        REFERENCES EMPREGADO(matricula),
    CONSTRAINT EMPREGADO_DEPARTAMENTO_FK FOREIGN KEY (idDepartamento)
        REFERENCES DEPARTAMENTO(idDepartamento)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE trabalha (
    matricula INT(11) NOT NULL,
    idProjeto INT(11) NOT NULL,
    horasSemanais INT(3) NOT NULL,

    CONSTRAINT trabalha_EMPREGADO_FK FOREIGN KEY (matricula)
        REFERENCES EMPREGADO(matricula),
    CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY (idProjeto)
        REFERENCES PROJETO(idProjeto)
) ENGINE = InnoDB;

CREATE TABLE ligacao (
    matricula INT(11) NOT NULL,
    idDependente INT(11) NOT NULL,

    CONSTRAINT ligacao_EMPREGADO_FK FOREIGN KEY (matricula)
        REFERENCES EMPREGADO(matricula),
    CONSTRAINT ligacao_DEPENDENTE_FK FOREIGN KEY (idDependente)
        REFERENCES DEPENDENTE(idDependente)
) ENGINE = InnoDB;

CREATE TABLE tem (
    idDepartamento INT(11) NOT NULL,
    idLocalizacao INT(11) NOT NULL,

    CONSTRAINT tem_DEPARTAMENTO_FK FOREIGN KEY (idDepartamento)
        REFERENCES DEPARTAMENTO(idDepartamento),
    CONSTRAINT tem_LOCALIZACAO_FK FOREIGN KEY (idLocalizacao)
        REFERENCES LOCALIZACAO(idLocalizacao)
) ENGINE = InnoDB;

CREATE TABLE gerencia (
    matricula INT(11) NOT NULL,
    idDepartamento INT(11) NOT NULL,
    dtInicio DATE NOT NULL,

    CONSTRAINT gerencia_EMPREGADO_FK FOREIGN KEY (matricula)
        REFERENCES EMPREGADO(matricula),
    CONSTRAINT gerencia_DEPARTAMENTO_FK FOREIGN KEY (idDepartamento)
        REFERENCES DEPARTAMENTO(idDepartamento)
) ENGINE = InnoDB;