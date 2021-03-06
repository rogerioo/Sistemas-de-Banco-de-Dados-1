-- -----------------------------   << Trabalho Final - Video Games (Tema 1) - Grupo C  >>   -----------------------------
--
--                                          SCRIPT DE CRIAÇÃO DE USUÁRIOS (DDL)                                          
-- 
-- Data Criacao ...........: 04/12/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior, Iolane C. Alves de Andrade, Indiara Duarte e Lucas Gomes
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF1C_Rogerio
--
-- PROJETO => 01 Base de Dados
--         => 25 Tabelas
-- 
-- ----------------------------------------------------------------------------------------------------------------------

USE TF1C_Rogerio;

CREATE USER 'admin'@'localhost' IDENTIFIED BY '@d2019';
GRANT ALL PRIVILEGES ON  TF1C_Rogerio. * TO 'admin'@'localhost';

CREATE USER 'user'@'localhost' IDENTIFIED BY 'uso2019';
GRANT SELECT ON  TF1C_Rogerio. * TO 'user'@'localhost';

FLUSH PRIVILEGES;
