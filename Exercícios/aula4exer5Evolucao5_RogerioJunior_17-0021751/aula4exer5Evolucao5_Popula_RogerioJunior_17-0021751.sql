-- --------     << Clínica Médica - V5 >>     ------------
-- 
--                    SCRIPT DE POPULAR (DDL)
-- 
-- Data Criacao ...........: 23/09/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdClinica
-- 
-- Data Ultima Alteracao ..: 23/09/2019
--   => Criação do script para popular as tabelas do banco
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

USE bdClinica;

-- --------
-- POPULA 1
-- --------

INSERT INTO MEDICO VALUES (
    NULL,
    'Marco Antonio da Costa Carvalho',
    13341
);

INSERT INTO PACIENTE VALUES (
    NULL,
    'Rogério Silva dos Santos Júnior',
    '1999-09-21',
    'M',
    'Quadra 3 Conjunto H',
    107,
    'Setor Leste (Gama)',
    NULL,
    'Brasília',
    'DF',
    72420207
);

INSERT INTO MEDICAMENTO VALUES (
    NULL,
    "Ibuprofeno"
);

INSERT INTO MEDICAMENTO VALUES (
    NULL,
    "Paracetamol"
);

INSERT INTO ESPECIALIDADE VALUES (
    NULL,
    'Clinico Medico'
);

INSERT INTO ESPECIALIDADE VALUES (
    NULL,
    'Angiologista'
);

INSERT INTO CONSULTA VALUES (
    NULL,
    NOW(),
    1,
    1
);

INSERT INTO RECEITA VALUES (
    NULL,
    '3 vezes ao dia / 2 vezes ao dia',
    1
);

INSERT INTO contem VALUES (
    1, 
    1
);

INSERT INTO contem VALUES (
    1, 
    2
);

INSERT INTO possui VALUES (
    1,
    1
);

INSERT INTO possui VALUES (
    1,
    2
);

INSERT INTO telefone VALUES (
    1,
    982347659
);

-- --------
-- POPULA 2
-- --------

INSERT INTO MEDICO VALUES (
    NULL,
    'Alexandre Antônio da Silva',
    11349
);

INSERT INTO PACIENTE VALUES (
    NULL,
    'Youssef Muhamad Yacoub Falaneh',
    '1999-11-20',
    'M',
    'Rua 76',
    18,
    'Jardim Céu Azul',
    NULL,
    'Valparaíso de Goiás',
    'GO',
    72373086
);

INSERT INTO MEDICAMENTO VALUES (
    NULL,
    "Amoxilina"
);

INSERT INTO MEDICAMENTO VALUES (
    NULL,
    "Nimesulida"
);

INSERT INTO ESPECIALIDADE VALUES (
    NULL,
    'Gastrologista'
);

INSERT INTO CONSULTA VALUES (
    NULL,
    NOW(),
    2,
    2
);

INSERT INTO RECEITA VALUES (
    NULL,
    '12 em 12 horas / 8 em 8 horas',
    2
);

INSERT INTO contem VALUES (
    2, 
    3
);

INSERT INTO contem VALUES (
    2, 
    4
);

INSERT INTO possui VALUES (
    2,
    1
);

INSERT INTO possui VALUES (
    2,
    3
);

INSERT INTO telefone VALUES (
    2,
    986573289
);

-- --------
-- POPULA 3
-- --------

INSERT INTO MEDICO VALUES (
    NULL,
    'Liliane Cristina Cugula Couto',
    11349
);

INSERT INTO PACIENTE VALUES (
    NULL,
    'Glenda Soares',
    '1961-12-30',
    'F',
    'QMSW 4 Lote 2',
    8,
    'Sudoeste',
    'Próximo ao Parque do Sudoeste',
    'Brasília',
    'DF',
    70680406
);

INSERT INTO MEDICAMENTO VALUES (
    NULL,
    "Cloridrato de Fluoxetina"
);

INSERT INTO ESPECIALIDADE VALUES (
    NULL,
    'Psiquiatra'
);

INSERT INTO CONSULTA VALUES (
    NULL,
    NOW(),
    3,
    3
);

INSERT INTO RECEITA VALUES (
    NULL,
    '1 comprimido ao dia',
    2
);

INSERT INTO contem VALUES (
    3, 
    5
);

INSERT INTO possui VALUES (
    3,
    4
);

INSERT INTO telefone VALUES (
    3,
    984569023
);