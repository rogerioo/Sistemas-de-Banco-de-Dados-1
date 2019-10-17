-- --------------------- P1 - A 2019/1 ------------------------
-- Linguagem: Mysql
-- 
-- 01 Base de Dados
-- 06 Tabelas
-- 
-- ------------------------------------------------------------

USE p1A;

INSERT INTO
  ALUNO (cpfAluno, dtNascimento, nome)
VALUES
  (
    12345678912,
    '1999-09-21',
    'Rogério Júnior'
  ),
  (
    12345678934,
    '1960-12-30',
    'Glenda Soares'
  ),
  (
    12345678967,
    '1998-11-20',
    'Youssef Muhamad'
  );

INSERT INTO
  telefone (cpfAluno, telefone)
VALUES
  (12345678912, 982034567),
  (12345678934, 982034568),
  (12345678967, 982034569);

INSERT INTO
  DOCENTE (cpfDocente, dtNascimento,nome)
VALUES
  (
    12345678909,
    '1930-04-03',
    'Felipe Duerno'
  ),
  (
    12345678987,
    '1975-05-13',
    'Vandor Rissoli'
  ),
  (
    12345678965,
    '1970-09-03',
    'Edson Alves'
  );

INSERT INTO
  UNIVERSIDADE (area, cep, cgc, cidade, estado, nome)
VALUES
  (
    'Area industrial do Gama',
    72430204,
    12345678909812,
    'Gama',
    'DF',
    'FGA'
  ),
   (
    'Area especial 05',
    74653908,
    12345678909834,
    'São Paulo',
    'SP',
    'PUC'
  ),
   (
    'Perto da praia',
    72908760,
    12345678909856,
    'Rio de Janeiro',
    'RJ',
    'UFRJ'
  );

INSERT INTO
  CURSO (areaAtuacao, nome)
VALUES
  (
    'Exatas',
    'Engenharia de Sofwtare'
  ),
  (
    'Informática',
    'Ciência da Computação'
  ),
  (
    'Saude',
    'Psicologia'
  );

INSERT INTO
  ADMITIDO (
    cgc,
    cpfAluno,
    cpfDocente,
    dtIngresso,
    idCurso
  )
VALUES
  (
    12345678909812,
    12345678912,
    12345678909,
    '2017-03-01',
    1
  ),
  (
    12345678909856,
    12345678934,
    12345678965,
    '2015-03-05',
    3
  ),
  (
    12345678909834,
    12345678967,
    12345678987,
    '2019-03-13',
    1
  );