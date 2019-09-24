-- --------     << Clínica Médica - V5 >>     ------------
-- 
--                    SCRIPT DE APAGAR (DDL)
-- 
-- Data Criacao ...........: 23/09/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdClinica
-- 
-- Data Ultima Alteracao ..: 23/09/2019
--   => Criação do script para apagar as tabelas do banco
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

use bdClinica;

DROP TABLE IF EXISTS contem;
DROP TABLE IF EXISTS MEDICAMENTO;
DROP TABLE IF EXISTS RECEITA;
DROP TABLE IF EXISTS CONSULTA;
DROP TABLE IF EXISTS telefone;
DROP TABLE IF EXISTS PACIENTE;
DROP TABLE IF EXISTS possui;
DROP TABLE IF EXISTS ESPECIALIDADE;
DROP TABLE IF EXISTS MEDICO;