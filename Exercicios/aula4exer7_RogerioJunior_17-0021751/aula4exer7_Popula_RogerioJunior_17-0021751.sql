-- ---------------------   << Empresa FUI  >>   ---------------------
--
--                    SCRIPT DE POPULAR (DML)
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

USE aula4exer7;

INSERT INTO PESSOA
    (nome, sexo, dtNascimento)
VALUES 
    ('Rogerio Junior','M','1999-09-21'),
    ('Youssef Muhamad','M','1999-11-20'),
    ('Glenda Soares','F','1960-12-30'),
    ('Thaissa Soares','F','1992-09-02'),
    ('Lucas Dutra','M','1998-12-10'),
    ('Fabiana Luiza','F','1998-08-23');

INSERT INTO DEPENDENTE 
    (parentesco, idPessoa)
VALUES 
    ('Filha',4),
    ('Irmao',5),
    ('Prima',6);

INSERT INTO DEPARTAMENTO
    (nome)
VALUES 
    ('Recursos Humanos'),
    ('Informatica'),
    ('Contabilidade');

INSERT INTO LOCALIZACAO 
    (bloco,andar,sala)
VALUES 
    ('A',1,101),
    ('B',2,201),
    ('C',3,301);

INSERT INTO PROJETO
    (nome,idLocalizacao,idDepartamento)
VALUES 
    ('Sentimentos x Produtividade',1,1),
    ('Algoritmos de Alta Performance',2,2),
    ('Como reduzir custos?',3,3);

INSERT INTO EMPREGADO
    (rua,numero,bairro,cidade,salario,idPessoa,idSupervisor,idDepartamento)
VALUES 
    ('Quadra 04',107,'Setor Norte','Gama',9654.87,1,NULL,2),
    ('Quadra 05',108,'Setor Oeste','Gama',8500.10,2,1,1),
    ('Quadra 06',109,'Setor Sul','Gama',1234.60,3,1,3);

INSERT INTO ligacao
    (matricula,idDependente)
VALUES 
    (1,1),
    (2,2),
    (3,3);

INSERT INTO trabalha 
    (matricula,idProjeto,horasSemanais)
VALUES 
    (1,2,15),
    (2,1,10),
    (3,3,12);

INSERT INTO gerencia
    (matricula,idDepartamento,dtInicio)
VALUES 
    (1,2,'2018-01-10'),
    (2,1,'2016-05-30'),
    (3,3,'2017-03-10');

INSERT INTO tem 
    (idDepartamento,idLocalizacao)
VALUES 
    (1,1),
    (2,2),
    (3,3);
