-- --------------------- P1 - A 2019/1 ------------------------
-- Linguagem: Mysql
-- 
-- 01 Base de Dados
-- 06 Tabelas
-- 
-- ------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS p1A;
USE p1A;


CREATE TABLE ALUNO (
    cpfAluno BIGINT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dtNascimento DATE NOT NULL,

    CONSTRAINT ALUNO_PK PRIMARY KEY(cpfAluno)
) ENGINE = InnoDB;

CREATE TABLE UNIVERSIDADE (
    cgc BIGINT(14) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    area VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep BIGINT NOT NULL,

    CONSTRAINT UNIVERSIDADE_PK PRIMARY KEY (cgc)
) ENGINE = InnoDB;

CREATE TABLE DOCENTE (
    cpfDocente BIGINT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dtNascimento DATE NOT NULL,
    matricula BIGINT NOT NULL AUTO_INCREMENT,

    CONSTRAINT DOCENTE_PK PRIMARY KEY (cpfDocente),
    CONSTRAINT DOCENTE_UK UNIQUE(matricula)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE CURSO (
    idCurso INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    areaAtuacao VARCHAR(50) NOT NULL,

    CONSTRAINT CURSO_PK PRIMARY KEY (idCurso)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE telefone (
    cpfAluno BIGINT(11) NOT NULL,
    telefone BIGINT NOT NULL,

    CONSTRAINT telefone_FK FOREIGN KEY (cpfAluno)
      REFERENCES ALUNO(cpfAluno)
) ENGINE = InnoDB;

CREATE TABLE ADMITIDO (
    dtIngresso DATE,
    idCurso INT,
    cpfDocente BIGINT(11),
    cpfAluno BIGINT(11),
    cgc BIGINT(14),
    
    CONSTRAINT ADMITIDO_PK PRIMARY KEY (cgc, cpfAluno),

    CONSTRAINT ADMITIDO_CURSO_FK FOREIGN KEY (idCurso)
      REFERENCES CURSO(idCurso),
    CONSTRAINT ADMITIDO_DOCENTE_FK FOREIGN KEY (cpfDocente)
      REFERENCES DOCENTE(cpfDocente),
    CONSTRAINT ADMITIDO_ALUNO_FK FOREIGN KEY (cpfAluno)
      REFERENCES ALUNO(cpfAluno),
    CONSTRAINT ADMITIDO_UNIVERSIDADE_FK FOREIGN KEY (cgc)
      REFERENCES UNIVERSIDADE(cgc)
) ENGINE = InnoDB;