USE p1B;

INSERT INTO
  `p1B`.`PESSOA` (cpfPessoa, dtNascimento, nome)
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
    12345678956,
    '1998-11-20',
    'Youssef Muhamad'
  );

INSERT INTO
  `p1B`.`email` (cpfPessoa, email)
VALUES
  (12345678912, 'email@hotmail.com'),
  (12345678934, 'email@gmail.com'),
  (12345678956, 'email@yahoo.com.br');

INSERT INTO
  `p1B`.`EMPRESA` (area, cep, cgc, cidade, estado, nome)
VALUES
  (
    'Pró-DF Gama',
    '72430204',
    12345678909812,
    'Gama',
    'DF',
    'Gerdau'
  ),
  (
    'Setor industrial',
    '71564230',
    12345678909834,
    'Brasilia',
    'DF',
    'Fabrica de Sofwtare'
  ),
  (
    'Vale do Silício',
    '08756421',
    12345678909856,
    'California',
    'CA',
    'Google'
  );

INSERT INTO
  `p1B`.`GERENTE` (cgc, cpfGerente, dtNascimento, matricula, nome)
VALUES
  (
    12345678909812,
    12345678909,
    '1992-09-02',
    123,
    'Thaissa Soares'
  ),
  (
    12345678909834,
    12345678987,
    '1997-03-15',
    456,
    'Esio Freitas'
  ),
  (
    12345678909856,
    12345678965,
    '1997-07-25',
    789,
    'Lucas Dutra'
  );

INSERT INTO
  `p1B`.`AREA` (cgc, departamento)
VALUES
  (
    12345678909812,
    'Gestão de Produção'
  ),
  (
    12345678909834,
    'Desenvolvedor'
  ),
  (
    12345678909856,
    'Manutenção de Software'
  );

INSERT INTO
  `p1B`.`EMPREGADO` (cgc, cpfGerente, cpfPessoa, dtIngresso, idArea)
VALUES
  (
    12345678909812,
    12345678909,
    12345678912,
    NULL,
    1
  ),
  (
    12345678909834,
    12345678987,
    12345678934,
    '2019-01-01',
    2
  ),
  (
    12345678909856,
    12345678965,
    12345678956,
    '2015-03-01',
    3
  );