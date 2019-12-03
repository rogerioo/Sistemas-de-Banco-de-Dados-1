-- -----------------------     CLinica Médica     -----------------------
-- 
--                    SCRIPT ALTER (DDL e DML)
-- 
-- Data Criacao ...........: 21/11/2019
-- Autor(es) ..............: Rogério Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer5evolucao6
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- -----------------------------------------------------------------

USE aula4exer5evolucao6;

-- Questao 01
ALTER TABLE MEDICAMENTO ADD COLUMN codigoBarra VARCHAR(50);

-- Questao 02
UPDATE MEDICAMENTO SET codigoBarra = '';
ALTER TABLE MEDICAMENTO MODIFY COLUMN codigoBarra VARCHAR(50) DEFAULT '' NOT NULL;

-- Questao 03
ALTER TABLE telefone ADD CONSTRAINT telefone_UK UNIQUE (telefone, cpf);

-- Questao 04
ALTER TABLE MEDICO CHANGE COLUMN estado sigla VARCHAR(2) NOT NULL;


-- Questao 05

-- Altera o COLLATE do padrao do banco
ALTER DATABASE `aula4exer5evolucao6` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

-- Altera a senha de um usuario
CREATE USER 'rogerio' IDENTIFIED BY '123456';
ALTER USER 'rogerio' IDENTIFIED BY '1234NOVO'