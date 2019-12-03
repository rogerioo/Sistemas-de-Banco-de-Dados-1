-- ----------------------     << Detran >>     ----------------------
--
--                    SCRIPT POPULA (DML)
--
-- Data Criacao ...........: 30/10/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer6Evolucao4
--
-- Data Ultima Alteracao ..: 14/10/2019
--   => Troca da instrução para ser mais precisa e clara
--   => Troca dos dados para estar compatível com a evolução
--   => Formatação das queries para serem mais legíveis
--   => Compactação do insert de uma tabela em uma só intrução
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

USE aula4exer6Evolucao4;

INSERT INTO PROPRIETARIO
	(cpf, sexo, dtNascimento, estado, cidade, bairro, nome, rua, numero, cep) 
VALUES
	(1234567893, 'M', DATE('1990-12-30'), 'DF', 'Brasilia', 'Aguas Lindas', 'Renan', 'Norte', 1, 72430205),
	(1923192389, 'F', DATE('1994-11-04'), 'GO', 'Goiania', 'Aguas Claras', 'Carla', 'Sul', 2, 72430206),
	(1201293022, 'M', DATE('1988-8-20'), 'SP', 'Araraquara', 'Aguas Turbulentas', 'Juca', 'Norte', 3, 72430207);

INSERT INTO telefone
	(cpf, numero) 
VALUES
	( 1201293022, 1234567893 ),
	( 1234567893, 1234567893 ),
	( 1923192389, 1923192389 );

INSERT INTO CATEGORIA
	(descCategoria) 
VALUES 
	('AUTOMOVEL'),
	('BARCO'),
	('MOTO');

INSERT INTO MODELO
	(descModelo)
VALUES 
	('Gol'),
	('Fox'),
	('CG50');

INSERT INTO VEICULO
	(anoFab, corPredominante, chassi, placa, codigoCategoria, codigoModelo, cpf) 
VALUES 
	( 2002, 'Azul', '1qwerasdf', 'abc1234', 1, 1, 1234567893 ),
	(	2015, 'Branco', '1qwrrasdf', 'abd1234', 1, 2, 1923192389 ),
	(2017, 'Vermelho', '1qarasdf', 'abe1234', 3, 3, 1201293022 );

INSERT INTO AGENTE
	(matriculaFuncional, nome, dtContratacao)
VALUES
	( 1000, 'Joaquim', '2010-08-30' ),
	( 1010, 'Cristiano', '2012-09-30' ),
	( 1100, 'Jorge', '2015-08-10' );

INSERT INTO LOCAL
	(latitude, longitude, velocidadePermitida)
VALUES 
	( 54.125417, 311.649218, '80' ),
	( 30.192874, 301.109231, '80' ),
	( 20.122479, 102.139232, '60' );

INSERT INTO TIPO_INFRACAO
	(valorInfracao, descInfracao) 
VALUES
	( 130.16, 'Furou Sinal Vermelho' ),
	( 293.47, 'Transitar em velocidade superior à máxima permitida para o local' ),
	( 195.23, 'Não Usou Cinto de Segurança' );

INSERT INTO INFRACAO
	(dtHora, placa, velocidadeAferida, codigoLocal, codigoInfracao, matriculaFuncional) 
VALUES 
	( '20150810220530', 'abc1234', NULL , 1, 1, 1000 ),
	( '20150810220535', 'abd1234', 100 , 2, 2, 1010 ),
	(	'20150810220540', 'abe1234', NULL , 3, 3, 1000 );