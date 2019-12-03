-- ---------------------   << Empresa FUI  >>   ---------------------
--
--                    SCRIPT DE CRIAÇÂO DE USUÁRIO (DDL)
-- 
-- Data Criacao ...........: 04/11/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer7
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
-- 
-- -----------------------------------------------------------------

CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'ger2019';
GRANT ALL PRIVILEGES ON  aula4exer7.* TO 'gerente'@'localhost';

CREATE USER 'empregado'@'localhost' IDENTIFIED BY '2019emp';
GRANT SELECT ON  aula4exer7.* TO 'empregado'@'localhost';
GRANT INSERT ON  aula4exer7.PESSOA TO 'empregado'@'localhost';
GRANT INSERT ON  aula4exer7.DEPENDENTE TO 'empregado'@'localhost';

FLUSH PRIVILEGES;
