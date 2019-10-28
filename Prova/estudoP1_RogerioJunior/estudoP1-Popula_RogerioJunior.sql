-- -------------------------     << Prova 01 >>     -------------------------
--
--                    SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 17/10/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: RogerioJunior
-- 
-- Data Ultima Alteracao ..: 21/10/2019
--   => Melhora as queries de insert com a definição dos campos da tabela
--   => Retira campos NULL de id's de auto_increment
-- 
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--
-- ------------------------------------------------------------------------

USE RogerioJunior;

INSERT INTO PESSOA
  (primeiroNome, ultimoNome, sexo, dtNascimento, apelido)
VALUES
  ('Rogerio', 'Junior', 'M', '1999-09-21', 'Roger'),
  ('Fabiana', 'Ribas', 'F', '1997-08-23', 'Fabi'),
  ('Youssef', 'Muhamad', 'M', '1999-11-20', 'You'),
  ('Glenda', 'Soares', 'F', '1960-12-30', 'Glen');

INSERT INTO CARACTERISTICA
  (descricao, tipo)
VALUES
  ('Falador', 'P'),
  ('Carinhosa', 'P'),
  ('Ver Netflix', 'I'),
  ('Ler', 'I');

INSERT INTO email
  (idPessoa, email)
VALUES
  (1, 'roger@email.com'),
  (2, 'fabi@email.com'),
  (3, 'you@email.com'), 
  (4, 'glenda@email.com');

INSERT INTO relaciona
  (idPessoa, idAmigo)
VALUES
  (1,2),
  (1,3),
  (2,3),
  (4,1);

INSERT INTO possui
  (idCaracteristica, idPessoa)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4);