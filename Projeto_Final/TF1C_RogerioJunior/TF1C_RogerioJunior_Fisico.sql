-- -----------------------------   << Trabalho Final - Video Games (Tema 1) - Grupo C  >>   -----------------------------
--
--                                            SCRIPT DE CRIAÇÃO (DDL)                                            
-- 
-- Data Criacao ...........: 04/12/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior, Iolane C. Alves de Andrade, Indiara Duarte e Lucas Gomes
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF1C_Rogerio
-- 
-- Data Ultima Alteracao ..: 08/12/2019
--  => Criação de tabelas PAGAMENTO e inclui
--  => Adição do campo percentualPago na tabela inclui
--  => Troca do nome da tabela VENDA de hora para dtHora
-- 
-- PROJETO => 01 Base de Dados
--         => 25 Tabelas
-- 
-- ---------------------------------------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS TF1C_Rogerio
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
USE TF1C_Rogerio;


CREATE TABLE PESSOA (
    cpf BIGINT(11) NOT NULL,
    nomeCompleto VARCHAR(100) NOT NULL,

    CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;

CREATE TABLE telefonePessoa (
    cpf BIGINT(11) NOT NULL,
    telefone BIGINT(12) NOT NULL,

    CONSTRAINT telefonePessoa_UK UNIQUE (telefone, cpf),

    CONSTRAINT telefonePessoa_PESSOA_FK FOREIGN KEY (cpf)
        REFERENCES PESSOA(cpf)
) ENGINE = InnoDB;

CREATE TABLE CLIENTE (
    cpfCliente BIGINT(11) NOT NULL,
    email VARCHAR(70) NOT NULL,
    credito FLOAT(8, 3) NOT NULL,

    CONSTRAINT CLIENTE_PK PRIMARY KEY (cpfCliente),
    CONSTRAINT CLIENTE_UK UNIQUE (email),

    CONSTRAINT CLIENTE_PESSOA_FK FOREIGN KEY (cpfCliente)
        REFERENCES PESSOA(cpf)
) ENGINE = InnoDB;

CREATE TABLE FUNCIONARIO (
    matFuncionario INT(5) AUTO_INCREMENT NOT NULL,
    cpfFuncionario BIGINT(11) NOT NULL,
    dtAdmissao DATE NOT NULL,
    localizacao ENUM('AC','SIA') NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INT(5) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep INT(8) NOT NULL,
    conta INT(10) NOT NULL,
    agencia BIGINT(12) NOT NULL,
    codigoBanco INT(3) NOT NULL,
    tipoConta ENUM('CC','CP','CS') NOT NULL,
    dtInadmissao DATE,

    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (matFuncionario),
    CONSTRAINT FUNCIONARIO_UK UNIQUE (cpfFuncionario),

    CONSTRAINT FUNCIONARIO_PESSOA_FK FOREIGN KEY (cpfFuncionario)
        REFERENCES PESSOA(cpf)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE AREA (
    idArea INT(3) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,

    CONSTRAINT AREA_PK PRIMARY KEY (idArea)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE FORNECEDOR (
    idFornecedor INT(5) AUTO_INCREMENT NOT NULL,
    cnpj BIGINT(14) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,

    CONSTRAINT FORNECEDOR_PK PRIMARY KEY (idFornecedor),
    CONSTRAINT FORNECEDOR_UK UNIQUE (cnpj)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE telefoneFornecedor (
    idFornecedor INT(5) NOT NULL,
    telefone BIGINT(12) NOT NULL,

    CONSTRAINT telefoneFornecedor_UK UNIQUE (telefone, idFornecedor),

    CONSTRAINT telefoneFornecedor_FK FOREIGN KEY (idFornecedor)
        REFERENCES FORNECEDOR(idFornecedor)
) ENGINE = InnoDB;

CREATE TABLE DEFEITO (
    idDefeito INT(5) AUTO_INCREMENT NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    valorServico FLOAT(8, 3) NOT NULL,

    CONSTRAINT DEFEITO_PK PRIMARY KEY (idDefeito)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MARCA (
    idMarca INT(5) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,

    CONSTRAINT MARCA_PK PRIMARY KEY (idMarca)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MODELO (
    idModelo INT(5) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,

    CONSTRAINT MODELO_PK PRIMARY KEY (idModelo)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PECA (
    idPeca INT(5) AUTO_INCREMENT NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    valor FLOAT(8, 3) NOT NULL,

    CONSTRAINT PECA_PK PRIMARY KEY (idPeca)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VENDA (
    idVenda INT(11) AUTO_INCREMENT NOT NULL,
    dtHora DATETIME NOT NULL,
    cpfCliente BIGINT(11) NOT NULL,
    matFuncionario INT(5) NOT NULL,
    desconto INT(3) DEFAULT 0,

    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),

    CONSTRAINT VENDA_CLIENTE_FK FOREIGN KEY (cpfCliente)
        REFERENCES CLIENTE (cpfCliente),
    CONSTRAINT VENDA_FUNCIONARIO_FK FOREIGN KEY (matFuncionario)
        REFERENCES FUNCIONARIO (matFuncionario)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE ITEM (
    idItem INT(11) AUTO_INCREMENT NOT NULL,
    ncm BIGINT(15) NOT NULL,
    localizacao ENUM('AC','SIA') NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    dtEntrada DATE NOT NULL,
    idMarca INT(5) NOT NULL,
    matFuncionario INT(5) NOT NULL,
    idModelo INT(5),
    armazenamento INT(5) DEFAULT 0,

    CONSTRAINT ITEM_PK PRIMARY KEY (idItem),
    CONSTRAINT ITEM_UK UNIQUE (idMarca, idModelo, localizacao),

    CONSTRAINT ITEM_FUNCIONARIO_FK FOREIGN KEY (matFuncionario)
        REFERENCES FUNCIONARIO (matFuncionario),
    CONSTRAINT ITEM_MARCA_FK FOREIGN KEY (idMarca)
        REFERENCES MARCA (idMarca),
    CONSTRAINT ITEM_MODELO_FK FOREIGN KEY (idModelo)
        REFERENCES MODELO (idModelo)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE NOVO (
    idItem INT(11) NOT NULL,
    quantidade INT(5) NOT NULL,
    valorEntrada FLOAT(8,3) NOT NULL,
    valorSaida FLOAT(8,3) NOT NULL,

    CONSTRAINT NOVO_PK PRIMARY KEY (idItem),

    CONSTRAINT NOVO_ITEM_FK FOREIGN KEY (idItem)
        REFERENCES ITEM (idItem)
) ENGINE = InnoDB;

CREATE TABLE SEMINOVO (
    idItem INT(11) NOT NULL,
    valorEntrada FLOAT(8, 3) NOT NULL,
    valorSaida FLOAT(8, 3) NOT NULL,
    quantidade INT(5) NOT NULL,

    CONSTRAINT SEMINOVO_PK PRIMARY KEY (idItem),

    CONSTRAINT SEMINOVO_ITEM_FK FOREIGN KEY (idItem)
        REFERENCES ITEM (idItem)
) ENGINE = InnoDB;

CREATE TABLE MANUTENCAO (
    idManutencao INT(11) AUTO_INCREMENT NOT NULL,
    numeroSerie VARCHAR(50) NOT NULL,
    descricaoItem VARCHAR(100) NOT NULL,
    localizacao ENUM('AC','SIA') NOT NULL,
    autorizacao ENUM('S','N') NOT NULL,
    status ENUM('E','A','O','P','M','R') NOT NULL,
    dtEntrada DATE NOT NULL,
    cpfCliente BIGINT(11) NOT NULL,
    responsavel INT(5) NOT NULL,
    dtSaida DATE,
    tecnico INT(5),
    idVenda INT(11),

    CONSTRAINT MANUTENCAO_PK PRIMARY KEY (idManutencao),

    CONSTRAINT MANUTENCAO_CLIENTE_FK FOREIGN KEY (cpfCliente)
        REFERENCES CLIENTE(cpfCliente),
    CONSTRAINT MANUTENCAO_FUNCIONARIO_RESPONSAVEL_FK FOREIGN KEY (responsavel)
        REFERENCES FUNCIONARIO(matFuncionario),
    CONSTRAINT MANUTENCAO_FUNCIONARIO_TECNICO_FK FOREIGN KEY (tecnico)
        REFERENCES FUNCIONARIO(matFuncionario),
    CONSTRAINT MANUTENCAO_VENDA_FK FOREIGN KEY (idVenda)
        REFERENCES VENDA (idVenda)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PAGAMENTO (
    idPagamento INT(2) NOT NULL AUTO_INCREMENT,
    forma VARCHAR(30) NOT NULL,

    CONSTRAINT PAGAMENTO_PK PRIMARY KEY (idPagamento)

) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE inclui (
    idVenda INT(11) NOT NULL,
    idPagamento INT(2) NOT NULL,
    percentualPago FLOAT(6,3) NOT NULL,

    CONSTRAINT inclui_VENDA_FK FOREIGN KEY (idVenda)
        REFERENCES VENDA(idVenda),
    CONSTRAINT inclui_PAGAMENTO_FK FOREIGN KEY (idPagamento)
        REFERENCES PAGAMENTO(idPagamento)

) ENGINE = InnoDB;


CREATE TABLE revendido (
    idItem INT(11) NOT NULL,
    idVenda INT(11) NOT NULL,
    quantidade INT(5) NOT NULL,

    CONSTRAINT revendido_ITEM_FK FOREIGN KEY (idItem)
        REFERENCES ITEM(idItem),
    CONSTRAINT revendido_VENDA_FK FOREIGN KEY (idVenda)
        REFERENCES VENDA(idVenda)
) ENGINE = InnoDB;

CREATE TABLE vendido (
    idItem INT(11) NOT NULL,
    idVenda INT(11) NOT NULL,
    quantidade INT(5) NOT NULL,

    CONSTRAINT vendido_ITEM_FK FOREIGN KEY (idItem)
        REFERENCES ITEM(idItem),
    CONSTRAINT vendido_VENDA_FK FOREIGN KEY (idVenda)
        REFERENCES VENDA(idVenda)
) ENGINE = InnoDB;

CREATE TABLE inserido (
    idArea INT(3) NOT NULL,
    matFuncionario INT(5) NOT NULL,

    CONSTRAINT inserido_AREA_FK FOREIGN KEY (idArea)
        REFERENCES AREA (idArea),
    CONSTRAINT inserido_FUNCIONARIO_FK FOREIGN KEY (matFuncionario)
        REFERENCES FUNCIONARIO (matFuncionario)
) ENGINE = InnoDB;

CREATE TABLE repara (
    idManutencao INT(11) NOT NULL,
    idDefeito INT(5) NOT NULL,

    CONSTRAINT repara_MANUTENCAO_FK FOREIGN KEY (idManutencao)
        REFERENCES MANUTENCAO (idManutencao),
    CONSTRAINT repara_DEFEITO_FK FOREIGN KEY (idDefeito)
        REFERENCES DEFEITO(idDefeito)
) ENGINE = InnoDB;

CREATE TABLE corrige (
    idDefeito INT(5) NOT NULL,
    idPeca INT(5) NOT NULL,

    CONSTRAINT corrige_DEFEITO_FK FOREIGN KEY (idDefeito)
        REFERENCES DEFEITO(idDefeito),
    CONSTRAINT corrige_PECA_FK FOREIGN KEY (idPeca)
        REFERENCES PECA(idPeca)
) ENGINE = InnoDB;

CREATE TABLE prove (
    idFornecedor INT(5) NOT NULL,
    idPeca INT(5) NOT NULL,

    CONSTRAINT prove_FORNECEDOR_FK FOREIGN KEY (idFornecedor)
        REFERENCES FORNECEDOR (idFornecedor),
    CONSTRAINT prove_PECA_FK FOREIGN KEY (idPeca)
        REFERENCES PECA (idPeca)
) ENGINE = InnoDB;

CREATE TABLE fornece (
    idItem INT(11) NOT NULL,
    idFornecedor INT(5) NOT NULL,

    CONSTRAINT fornece_ITEM_FK FOREIGN KEY (idItem)
        REFERENCES ITEM (idItem),
    CONSTRAINT fornece_FORNECEDOR_FK FOREIGN KEY (idFornecedor)
        REFERENCES FORNECEDOR (idFornecedor)
) ENGINE = InnoDB;
