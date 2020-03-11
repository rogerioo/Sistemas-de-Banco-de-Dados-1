CREATE DATABASE IF NOT EXISTS p1B;
USE p1B;

CREATE TABLE PESSOA (
    cpfPessoa BIGINT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dtNascimento DATE NOT NULL,

    CONSTRAINT PESSOA_PK PRIMARY KEY (cpfPessoa)
) ENGINE = InnoDB;

CREATE TABLE email (
    cpfPessoa BIGINT(11) NOT NULL,
    email VARCHAR(70) NOT NULL,

    CONSTRAINT email_PESSOA_FK FOREIGN KEY (cpfPessoa)
      REFERENCES PESSOA(cpfPessoa)
) ENGINE = InnoDB;

CREATE TABLE EMPRESA (
    cgc BIGINT(14) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    area VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep BIGINT(8) NOT NULL,

    CONSTRAINT EMPRESA_PK PRIMARY KEY(cgc)
) ENGINE = InnoDB;

CREATE TABLE AREA (
    idArea INT NOT NULL AUTO_INCREMENT,
    departamento VARCHAR(50) NOT NULL,
    cgc BIGINT(14) NOT NULL,

    CONSTRAINT AREA_PK PRIMARY KEY (idArea),

    CONSTRAINT AREA_EMPRESA_FK FOREIGN KEY (cgc)
      REFERENCES EMPRESA(cgc)
) ENGINE = InnoDB;

CREATE TABLE GERENTE (
    cpfGerente BIGINT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dtNascimento DATE NOT NULL,
    matricula BIGINT NOT NULL,
    cgc BIGINT(14) NOT NULL,

    CONSTRAINT GERENTE_PK PRIMARY KEY (cpfGerente),

    CONSTRAINT GERENTE_EMPRESA_FK FOREIGN KEY (cgc)
      REFERENCES EMPRESA(cgc)
) ENGINE = InnoDB;

CREATE TABLE EMPREGADO (
    dtIngresso DATE,
    cpfGerente BIGINT(11) NOT NULL,
    idArea INT NOT NULL,
    cpfPessoa BIGINT(11) NOT NULL,
    cgc BIGINT(14) NOT NULL,

    CONSTRAINT EMPREGADO_GERENTE_FK FOREIGN KEY (cpfGerente)
      REFERENCES GERENTE(cpfGerente),
    CONSTRAINT EMPREGADO_AREA_FK FOREIGN KEY (idArea)
      REFERENCES AREA(idArea),
    CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (cpfPessoa)
      REFERENCES PESSOA(cpfPessoa)
) ENGINE = InnoDB;