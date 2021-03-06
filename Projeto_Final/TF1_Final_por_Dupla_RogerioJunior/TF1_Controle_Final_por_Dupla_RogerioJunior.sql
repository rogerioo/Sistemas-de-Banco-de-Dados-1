-- ---------------------   << Trabalho Final - Video Games (Tema 1)  >>   ---------------------
--
--                              SCRIPT DE CRIAÇÃO DE USUÁRIOS (DDL)                              
-- 
-- Data Criacao ...........: 04/12/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior e Iolane C. Alves de Andrade
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF1_Rogerio
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 23 Tabelas
-- 
-- --------------------------------------------------------------------------------------------

USE TF1_Rogerio;

CREATE USER 'admin'@'localhost' IDENTIFIED BY '@d2019';
GRANT ALL PRIVILEGES ON  aula4exer7. * TO 'admin'@'localhost';

CREATE USER 'user'@'localhost' IDENTIFIED BY 'uso2019';
GRANT SELECT ON  aula4exer7. * TO 'user'@'localhost';

FLUSH PRIVILEGES;
