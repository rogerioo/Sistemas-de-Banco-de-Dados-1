-- ---------------------     << Clinica >>     ---------------------
--
--                    SCRIPT DE CONSULTAS (DML)
--
-- Data Criacao ...........: 30/10/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer5evolucao6
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

USE aula4exer5evolucao6;

--  01) Mostrar todos medicamentos de 1 receita
SELECT C.idReceita, M.idMedicamento, M.principioAtivo 
  FROM contem as C 
  INNER JOIN MEDICAMENTO as M 
    on C.idMedicamento = M.idMedicamento 
    WHERE C.idReceita = 2
ORDER BY M.principioAtivo;

-- 02) Listar todas as especialidades e indicar quais médicos estão em cada uma, além das especialidades que estão sem médico
SELECT E.nome, M.nome, M.crm, M.estado 
  FROM ESPECIALIDADE AS E 
  LEFT JOIN possui AS P 
    INNER JOIN MEDICO AS M 
      ON P.crm = M.crm AND P.estado = M.estado 
    ON E.idEspecialidade = P.idEspecialidade
ORDER BY M.nome;

-- 03) Mostrar os médicos e os pacientes que foram atendidos em uma data específica
SELECT M.nome, M.crm, M.estado, P.nome, P.cpf, C.dtHora FROM MEDICO AS M 
  INNER JOIN CONSULTA_atende AS C 
    ON M.crm = C.crm AND M.estado = C.estado
  INNER JOIN PACIENTE AS P 
    ON C.cpf = P.cpf
      WHERE C.dtHora LIKE '2009-11-28%'
ORDER BY C.dtHora;

-- 04) Apresentar quantos pacientes cada médico atendeu (sem identificar os pacientes - mostrar somente a quantidade numérica)
SELECT M.nome, M.crm, M.estado, 
  COUNT(DISTINCT C.cpf) AS qtdPacientes 
    FROM MEDICO AS M 
    LEFT JOIN CONSULTA_atende AS C 
      ON M.crm = C.crm AND M.estado = C.estado
  GROUP BY M.nome, M.crm, M.estado
ORDER BY M.nome;

-- 05) Mostrar todos os dados de pacientes consultado por parte do nome fornecido na pesquisa
SELECT * 
  FROM PACIENTE AS P 
    WHERE P.nome LIKE '%Ana%'
ORDER BY P.nome;