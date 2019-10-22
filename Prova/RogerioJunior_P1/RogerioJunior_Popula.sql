-- --------     << Prova 01 >>     ------------
--
--                    SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 21/03/2018
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: RogerioJunior
--
-- PROJETO => 07 Base de Dados
--         => 11 Tabelas
--
-- -----------------------------------------------------------------

USE RogerioJunior;

INSERT INTO PESSOA VALUES
  (NULL, 'Rogerio', 'Junior', 'M', '199-09-21', 'Roger'),
  (NULL, 'Fabiana', 'Ribas', 'F', '1997-08-23', 'Fabi'),
  (NULL, 'Youssef', 'Muhamad', 'M', '1999-11-20', 'You');

INSERT INTO INTERESSE VALUES
  (NULL, 'Estudar'),
  (NULL, 'Comer'),
  (NULL, 'Ver Netflix');

INSERT INTO CARACTERISTICA VALUES
  (NULL, 'Falador'),
  (NULL, 'Carinhosa'),
  (NULL, 'Simpatico');

INSERT INTO email VALUES
  (1, 'roger@email.com'),
  (2, 'fabi@email.com'),
  (3, 'you@email.com');

INSERT INTO relaciona VALUES
  (1,2),
  (1,3),
  (2,3);

INSERT INTO tem VALUES
  (1,1),
  (2,2),
  (3,3);

INSERT INTO possui VALUES
  (1,1),
  (2,2),
  (3,3);