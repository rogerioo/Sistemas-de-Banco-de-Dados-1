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
--   => Criação do mockup de dados
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------
USE bdDetran;

-- --------
-- POPULA 1
-- --------

INSERT INTO PROPRIETARIO VALUES (
    16796523498,
    'Glenda Soares',
    'F',
    '1961-12-30',
    'Quadra 05 Conjunto E',
    107,
    'Setor Leste (Gama)',
    NULL,
    'Brasilia',
    'DF',
    72356879
);

INSERT INTO telefone VALUES(
    16796523498,
    982346798
);

INSERT INTO CATEGORIA VALUES (
	NULL,
    'Carro'
);

INSERT INTO AGENTE VALUES (
	NULL,
	'João Carlos Machado',
    '2010-04-12'
);

INSERT INTO LOCAL VALUES (
    80,
    301.109231,
    30.192874,
	NULL
);

INSERT INTO MODELO VALUES (
	NULL,
    'CERATTO 2.0'
);

INSERT INTO TIPO_INFRACAO VALUES (
	NULL,
    'Transitar 20% acima da velocidade permitida',
    'Gravissima',
    293.47
);

INSERT INTO VEICULO VALUES (
    'Prata',
    'D176509KL65413AB9',
    'JGT0221',
    16796523498,
    1,
    1
);

INSERT INTO INFRACAO VALUE (
    '2019-09-21 10:55:26',
    NULL,
    100,
    'JGT0221',
    1,
    1,
    1
);

-- --------
-- POPULA 2
-- --------

INSERT INTO PROPRIETARIO VALUES (
    16519265432,
    'Fabiana Luiza Ribas',
    'F',
    '1998-10-24',
    'QSD 18',
    17,
    'Taguatinga Sul (Taguatinga)',
    NULL,
    'Brasilia',
    'DF',
    724305678
);

INSERT INTO telefone VALUES(
    16519265432,
    995678324
);

INSERT INTO CATEGORIA VALUES (
	NULL,
    'Moto'
);

INSERT INTO AGENTE VALUES (
	NULL,
	'Maurício Esteves Solene',
    '2008-03-22'
);

INSERT INTO LOCAL VALUES (
    100,
    102.139232,
    20.122479,
	NULL
);

INSERT INTO MODELO VALUES (
	NULL,
    'Night Row 700 Cilindradas'
);

INSERT INTO TIPO_INFRACAO VALUES (
	NULL,
    'Ter seu veículo imobilizado na via por falta de combustível',
    'Media',
    165.43
);

INSERT INTO VEICULO VALUES (
    'Preto',
    'D45782TR968213AB9',
    'PCS3426',
    16519265432,
    2,
    2
);

INSERT INTO INFRACAO VALUE (
    '2019-05-28 23:59:27',
    NULL,
    NULL,
    'PCS3426',
    2,
    2,
    2
);

-- --------
-- POPULA 3
-- --------

INSERT INTO PROPRIETARIO VALUES (
    34589721367,
    'Youssef Muhamad Yacoub Falaneh',
    'M',
    '1999-11-20',
    'Rua 76',
    18,
    'Jardim Céu Azul',
    NULL,
    'Valparaíso de Goiás',
    'GO',
    72373086
);

INSERT INTO telefone VALUES(
    34589721367,
    982346798
);

INSERT INTO CATEGORIA VALUES (
	NULL,
    'Caminhonete'
);

INSERT INTO AGENTE VALUES (
	NULL,
	'Maurício Esteves Solene',
    '2008-03-22'
);

INSERT INTO LOCAL VALUES (
    60,
    311.649218,
    54.125417,
	NULL
);

INSERT INTO MODELO VALUES (
	NULL,
    'AMAROK 3.0 LTI'
);

INSERT INTO TIPO_INFRACAO VALUES (
	NULL,
    'Jogar água sobre os pedestres ou veículos',
    'Leve',
    90.36
);

INSERT INTO VEICULO VALUES (
    'Vermelho',
    'D985412PE43961UY7',
    'JKG7823',
    34589721367,
    3,
    3
);

INSERT INTO INFRACAO VALUE (
    '2019-09-21 10:55:26',
    NULL,
    NULL,
    'JGT0221',
    3,
    3,
    3
);