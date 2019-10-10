-- --------     Aula4Exer6 ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 01/10/2019
-- Autor(es) ..............: Renan Welz Schadt
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: detran
-- 
-- 
-- 
-- -----------------------------------------------------------------

USE detran;

INSERT INTO CATEGORIA(codigoCategoria, descCategoria) VALUES (
	NULL, 'AUTOMOVEL'
);

INSERT INTO CATEGORIA(codigoCategoria, descCategoria) VALUES (
	NULL, 'BARCO'
);

INSERT INTO CATEGORIA(codigoCategoria, descCategoria) VALUES (
	NULL, 'MOTO'
);

INSERT INTO MODELO(codigoModelo, descModelo) VALUES (
	NULL, 'Gol'
);

INSERT INTO MODELO(codigoModelo, descModelo) VALUES (
	NULL, 'Fox'
);

INSERT INTO MODELO(codigoModelo, descModelo) VALUES (
	NULL, 'CG50'
);

INSERT INTO PROPRIETARIO(sexo, estado, cidade, bairro, cpf, nome, dtNascimento, rua, numero, cep) VALUES (
	'M', 'DF', 'Brasilia', 'Aguas Lindas', 056090, 'Renan', '1996-11-30', 'Norte', 1, 72430205
);

INSERT INTO PROPRIETARIO(sexo, estado, cidade, bairro, cpf, nome, dtNascimento, rua, numero, cep) VALUES (
	'F', 'GO', 'Goiania', 'Aguas Claras', 056091, 'Carla', '1998-08-30', 'Sul', 2, 72430206
);

INSERT INTO PROPRIETARIO(sexo, estado, cidade, bairro, cpf, nome, dtNascimento, rua, numero, cep) VALUES (
	'M', 'SP', 'Araraquara', 'Aguas Turbulentas', 056092, 'Juca', '1999-10-30', 'Norte', 3, 72430207
);

INSERT INTO VEICULO(anoFab, corPredominante, chassi, placa, codigoCategoria, codigoModelo, cpf) VALUES (
	2002, 'Azul', '1qwerasdf', 'abc1234', 1, 1, 056090
);

INSERT INTO VEICULO(anoFab, corPredominante, chassi, placa, codigoCategoria, codigoModelo, cpf) VALUES (
	2015, 'Branco', '1qwrrasdf', 'abd1234', 1, 2, 056091
);

INSERT INTO VEICULO(anoFab, corPredominante, chassi, placa, codigoCategoria, codigoModelo, cpf) VALUES (
	2017, 'Rosa', '1qarasdf', 'abe1234', 3, 3, 056092
);

INSERT INTO TIPO_INFRACAO(valorInfracao, descInfracao, codigoInfracao) VALUES (
	1200.10, 'Furou Sinal Vermelho', NULL
);

INSERT INTO TIPO_INFRACAO(valorInfracao, descInfracao, codigoInfracao) VALUES (
	500.50, 'Não Usou Cadeirinha', NULL
);

INSERT INTO TIPO_INFRACAO(valorInfracao, descInfracao, codigoInfracao) VALUES (
	200.00, 'Não Usou Cinto de Segurança', NULL
);

INSERT INTO AGENTE(matriculaFuncional, nome, dtContratacao) VALUES (
	1000, 'Joaquim', '2010-08-30'
);

INSERT INTO AGENTE(matriculaFuncional, nome, dtContratacao) VALUES (
	1010, 'Cristiano', '2012-09-30'
);

INSERT INTO AGENTE(matriculaFuncional, nome, dtContratacao) VALUES (
	1100, 'Jorge', '2015-08-10'
);

INSERT INTO LOCAL(codigoLocal, latitude, longitude, velocidadePermitida) VALUES (
	NULL, 54.125417, 311.649218, '80'
);

INSERT INTO LOCAL(codigoLocal, latitude, longitude, velocidadePermitida) VALUES (
	NULL, 30.192874, 301.109231, '80'
);

INSERT INTO LOCAL(codigoLocal, latitude, longitude, velocidadePermitida) VALUES (
	NULL, 20.122479, 102.139232, '60'
);

INSERT INTO INFRACAO(idInfracao,dtHora, placa, codigoLocal, codigoInfracao, matriculaFuncional) VALUES (
	NULL, '20150810220530', 'abc1234', 1, 1, 1000
);

INSERT INTO INFRACAO(idInfracao,dtHora, placa, codigoLocal, codigoInfracao, matriculaFuncional) VALUES (
	NULL, '20150810220535', 'abd1234', 2, 2, 1010
);

INSERT INTO INFRACAO(idInfracao,dtHora, placa, codigoLocal, codigoInfracao, matriculaFuncional) VALUES (
	NULL, '20150810220540', 'abe1234', 3, 3, 1000
);

INSERT INTO telefone(cpf, numero) VALUES (
	056090, 958256080
);

INSERT INTO telefone(cpf, numero) VALUES (
	056091, 958856080
);

INSERT INTO telefone(cpf, numero) VALUES (
	056092, 958276080
);