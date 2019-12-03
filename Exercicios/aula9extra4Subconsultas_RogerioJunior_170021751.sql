-- ------------------     << Clinica Médica >>     ------------------
--
--                    SCRIPT DE CONSULTAS (DML)
--
-- Data Criacao ...........: 12/11/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer5evolucao6
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

USE aula4exer5evolucao6;

-- 1) Lista todos os medicamentos contidos dentro de uma receita
-- Poderia ser usado na hora de montar uma receita para ser impressa

SELECT
  M.principioAtivo,
  M.tarja
FROM MEDICAMENTO AS M
WHERE
  M.idMedicamento IN (
    SELECT
      C.idMedicamento
    FROM contem AS C
    WHERE
      C.idReceita = 2
  );

-- 2) Lista todos os telefones de um paciente
-- Seria útil para listar todos os telefones cadatrados do paciente

SELECT
  T.telefone
FROM telefone AS T
WHERE
  T.cpf IN (
    SELECT
      P.cpf
    FROM PACIENTE AS P
    WHERE
      P.nome LIKE '%Ana%'
  );
