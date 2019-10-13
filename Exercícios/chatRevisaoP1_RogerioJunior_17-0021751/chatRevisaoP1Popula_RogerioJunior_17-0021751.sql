-- -------------     << Sistema de Eleições >>     -----------------
--
--                    SCRIPT DE CRIACAO (DML)
--
-- Data Criacao ...........: 13/10/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: chatRevisaoP1
--
-- Data Ultima Alteracao ..: 13/10/2019
--   => Criação do mock de dados
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- -----------------------------------------------------------------

USE chatRevisaoP1;

INSERT INTO
  chatRevisaoP1.ELEITOR (dtNascimento, nome, tituloEleitor)
VALUES
  (
    '1999-09-21',
    'Rogerio Silva dos Santos Junior',
    123456789098
  ),
  (
    '1961-12-30',
    'Glenda Soares',
    123456789076
  ),
  (
    '1992-09-02',
    'Thaissa Soares Ramos',
    123456789054
  ),
  (
    '1999-11-20',
    'Youssef Muhamad Yacoub Falaneh',
    123456789032
  ),
  (
    '1930-04-03',
    'Áurea Caixeta Borges',
    123456789010
  );

INSERT INTO
  chatRevisaoP1.CANDIDATO (
    dtEleicao,
    numeroCandidato,
    tituloEleitor
  )
VALUES
  (
    '2018-10-10',
    1,
    123456789098
  ),
  (
    '2018-10-10',
    2,
    123456789032
  ),
  (
    '2014-10-15',
    1,
    123456789054
  );

INSERT INTO
  chatRevisaoP1.VOTO (dtEleicao, tituloEleitor)
VALUES
  (
    '2018-10-10',
    123456789076
  ),
  (
    '2018-10-10',
    123456789054
  ),
  (
    '2018-10-10',
    123456789010
  ),
  (
    '2014-10-15',
    123456789076
  ),
  (
    '2014-10-15',
    123456789054
  ),
  (
    '2014-10-15',
    123456789010
  );

INSERT INTO
  chatRevisaoP1.EFETIVO (idVoto, numeroCandidato)
VALUES
  (
    2,
    2
  ),
  (
    1,
    1
  ),
  (
    3,
    1
  );

INSERT INTO
  chatRevisaoP1.JUSTIFICADO (idVoto, jutificativa)
VALUES
  (
    4,
    'Nenhum candidato representa meus ideias'
  ),
  (
    5,
    'Meu partido não colocou um bom candidato para nos representar'
  ),
  (
    6,
    'Não participo de política'
  );