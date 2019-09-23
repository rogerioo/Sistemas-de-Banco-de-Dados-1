-- --------     << Rogério Silva dos Santos Júnior >>     ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 18/09/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdClinica
-- 
-- Data Ultima Alteracao ..: 18/09/2019
--   => Conversão do modelo lógico para o físico
--   => Conversão do modelo lógico para o físico
--   => Conversão do modelo lógico para o físico
-- 
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
-- -----------------------------------------------------------------

CREATE DATABASE bdClinica;
USE bdClinica;

CREATE TABLE MEDICO (
    idMedico INT NOT NULL PRIMARY KEY,
    nomeCompleto VARCHAR(30) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    matricula BIGINT NOT NULL
);

CREATE TABLE PACIENTE (
    idPaciente INT NOT NULL PRIMARY KEY,
    nomeCompleto VARCHAR(30) NOT NULL,
    dtNascimento TIMESTAMP NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    complemento VARCHAR(100),
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep BIGINT NOT NULL
);

CREATE TABLE CONSULTA_consulta (
    idConsulta INT NOT NULL PRIMARY KEY,
    data TIMESTAMP NOT NULL,
    hora TIMESTAMP NOT NULL,
    idMedico INT NOT NULL,
    idPaciente INT NOT NULL,

    CONSTRAINT consulta_MEDICO FOREIGN KEY (idMedico)
        REFERENCES MEDICO (idMedico),
    CONSTRAINT consulta_PACIENTE FOREIGN KEY (idPaciente)
        REFERENCES PACIENTE (idPaciente)
);

CREATE TABLE RECEITA (
    idReceita INT NOT NULL PRIMARY KEY,
    posologia VARCHAR(100) NOT NULL,
    idConsulta INT NOT NULL,

    CONSTRAINT RECEITA_CONSULTA FOREIGN KEY (idConsulta)
        REFERENCES CONSULTA_consulta (idConsulta)
);

CREATE TABLE FARMACO (
    idFarmaco INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30),
    principioAtivo VARCHAR(30) NOT NULL
);

CREATE TABLE ESPECIALIDADE (
    idEspecialidade INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    areaAtuacao VARCHAR(100)
);

CREATE TABLE telefone (
    idPaciente INT NOT NULL,
    telefone BIGINT NOT NULL,

    CONSTRAINT telefone_PACIENTE FOREIGN KEY (idPaciente)
        REFERENCES PACIENTE (idPaciente)
);

CREATE TABLE contem (
    idReceita INT NOT NULL,
    idFarmaco INT NOT NULL,

    CONSTRAINT contem_RECEITA_FK FOREIGN KEY (idReceita)
        REFERENCES RECEITA (idReceita),
    CONSTRAINT contem_FARMACO_PK FOREIGN KEY (idFarmaco)
        REFERENCES FARMACO (idFarmaco)    
);

CREATE TABLE possui (
    idMedico INT NOT NULL,
    idEspecialidade INT NOT NULL,

    CONSTRAINT possui_MEDICO FOREIGN KEY (idMedico)
        REFERENCES MEDICO (idMedico),
    CONSTRAINT possui_ESPECIALIDADE FOREIGN KEY (idEspecialidade)
        REFERENCES ESPECIALIDADE (idEspecialidade)
);