-- ------------------     << Clínica Médica  >>     ------------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 18/09/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer5Evolucao6
-- 
-- Data Ultima Alteracao ..: 14/10/2019
--   => Criação do modelo físico do banco
--   => Alterando o nome das tabelas e atributos de acordo com modificações feitas no MER/DER
--   => Formatar CONSTRAINTS FK's para forma padrão
--   => Formatar CONTRAINTS das PK's para forma padrão
--   => Definido InnoDB para todas as tabelas
--   => Definindo set de caracteres padrão para todo o banco
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer5Evolucao6
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE aula4exer5Evolucao6;

CREATE TABLE IF NOT EXISTS MEDICO (
    crm BIGINT NOT NULL,
    estado CHAR(2) NOT NULL,
    nomeCompleto VARCHAR(50) NOT NULL,

    CONSTRAINT MEDICO_PK PRIMARY KEY(crm, estado)
) ENGINE = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS PACIENTE (
    idPaciente INT NOT NULL AUTO_INCREMENT,
    nomeCompleto VARCHAR(50) NOT NULL,
    dtNascimento DATE NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    complemento VARCHAR(100),
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep BIGINT NOT NULL,

    CONSTRAINT PACIENTE_PK PRIMARY KEY (idPaciente)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS CONSULTA (
    idConsulta INT NOT NULL AUTO_INCREMENT,
    dataHora TIMESTAMP NOT NULL,
    crm BIGINT NOT NULL,
    estado CHAR(2) NOT NULL,
    idPaciente INT NOT NULL,

    CONSTRAINT CONSULTA_PK PRIMARY KEY (idConsulta),

    CONSTRAINT CONSULTA_MEDICO_FK FOREIGN KEY (crm, estado)
        REFERENCES MEDICO (crm, estado),
    CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY (idPaciente)
        REFERENCES PACIENTE (idPaciente)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS RECEITA (
    idReceita INT NOT NULL AUTO_INCREMENT,
    posologia VARCHAR(100) NOT NULL,
    idConsulta INT NOT NULL,

    CONSTRAINT RECEITA_PK PRIMARY KEY (idReceita),

    CONSTRAINT RECEITA_CONSULTA_FK FOREIGN KEY (idConsulta)
        REFERENCES CONSULTA (idConsulta)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS MEDICAMENTO (
    idMedicamento INT NOT NULL AUTO_INCREMENT,
    principioAtivo VARCHAR(30) NOT NULL,

    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (idMedicamento)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS ESPECIALIDADE (
    idEspecialidade INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS telefone (
    idPaciente INT NOT NULL,
    telefone BIGINT NOT NULL,

    CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (idPaciente)
        REFERENCES PACIENTE (idPaciente)
) ENGINE = InnoDB, DEFAULT CHARSET utf8;

CREATE TABLE IF NOT EXISTS contem (
    idReceita INT NOT NULL,
    idMedicamento INT NOT NULL,

    CONSTRAINT contem_RECEITA_FK FOREIGN KEY (idReceita)
        REFERENCES RECEITA (idReceita),
    CONSTRAINT contem_MEDICAMENTO_PK FOREIGN KEY (idMedicamento)
        REFERENCES MEDICAMENTO (idMedicamento)    
) ENGINE = InnoDB, DEFAULT CHARSET utf8;

CREATE TABLE IF NOT EXISTS possui (
    crm BIGINT NOT NULL,
    estado CHAR(2) NOT NULL,
    idEspecialidade INT NOT NULL,

    CONSTRAINT possui_MEDICO_FK FOREIGN KEY (crm, estado)
        REFERENCES MEDICO (crm, estado),
    CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade)
        REFERENCES ESPECIALIDADE (idEspecialidade)
) ENGINE = InnoDB, DEFAULT CHARSET utf8;