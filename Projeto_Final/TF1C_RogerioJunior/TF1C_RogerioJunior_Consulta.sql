-- -----------------------------   << Trabalho Final - Video Games (Tema 1) - Grupo C  >>   -----------------------------
--
--                                           SCRIPT DE CONSULTAR (DDL E DML)                                            
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

-- Consulta para saber quantidade de vendas e quanto de desconto foi dado por cada funcionário em um determinado dia
SELECT P.nomeCompleto, COUNT(V.matFuncionario) as qtdVendas, SUM(V.desconto) as totalDesconto
    FROM VENDA AS V
        INNER JOIN FUNCIONARIO AS F
            ON V.matFuncionario = F.matFuncionario
        INNER JOIN PESSOA AS P
            ON P.cpf = F.cpfFuncionario
        WHERE V.data LIKE '2019-11-27%'
    GROUP BY V.matFuncionario;

-- Consulta para saber a quantidade de concertos que um técnico é capaz de fazer em um dia
SELECT P.nomeCompleto, COUNT(M.tecnico) as qtdConcertos
    FROM MANUTENCAO AS M
        INNER JOIN FUNCIONARIO AS F
            ON M.tecnico = F.matFuncionario
        INNER JOIN PESSOA AS P
            ON P.cpf = F.cpfFuncionario
        WHERE M.dtSaida LIKE '2019-12-04%'
    GROUP BY M.tecnico;

-- Visão para facilitar e melhorar o acesso a todos os dados de um item novo
CREATE OR REPLACE VIEW ESTOQUE_NOVO
    (descricao, quantidade, valorEntrada, valorSaida, dtEntrada, marca, modelo, ncm, armazenamento, localizacao)
AS
    SELECT I.descricao, N.quantidade, N.valorEntrada, N.valorSaida, I.dtEntrada, MA.nome, MO.nome, I.ncm, I.armazenamento, I.localizacao
        FROM NOVO AS N
            INNER JOIN ITEM AS I
                ON N.idItem = I.idItem
            INNER JOIN MARCA AS MA
                ON I.idMarca = MA.idMarca
            INNER JOIN MODELO AS MO
                ON I.idModelo = MO.idModelo;