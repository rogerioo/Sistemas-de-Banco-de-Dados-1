-- ---------------------   << Trabalho Final - Video Games (Tema 1)  >>   ---------------------
--
--                                   SCRIPT DE POPULA (DML)                                   
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

INSERT INTO PESSOA
    (cpf, nomeCompleto)
VALUES
    (78766228018, 'Rodrigo Ribeiro'),
    (31010700073, 'Samanta Souza'),
    (12566432031, 'Rafael Almeida'),
    (70300770081, 'Valentina Silva'),
    (18571990069, 'Miguel Souza'),
    (46239307009, 'Maria Julia Ribeiro'),
    (28876627081, 'Romulo Souza'),
    (91230960040, 'Sabrina Almeida'),
    (70300770082, 'Glenda Soares'),
    (54434964097, 'Valeria Silva');

INSERT INTO telefonePessoa
    (cpf, telefone)
VALUES 
    (78766228018, 61881642418),
    (31010700073, 61172031911),
    (12566432031, 61567074576),
    (70300770081, 61532382633),
    (18571990069, 61883017832),
    (46239307009, 61217939422),
    (28876627081, 61545332941),
    (91230960040, 61129665925),
    (70300770082, 61255688678),
    (54434964097, 61598944584);


INSERT INTO CLIENTE
    (cpfCliente, email, credito)
VALUES
    (78766228018, 'rodirgo@gmail.com', 150),
    (31010700073, 'samanta@gmail.com', 30),
    (12566432031, 'rafael@gmail.com', 0),
    (70300770081, 'valentina@gmail.com', 25),
    (18571990069, 'miguel@gmail.com', 68);

INSERT INTO FUNCIONARIO
    (cpfFuncionario, dtAdmissao, localizacao, rua, numero, bairro, cidade, estado,
        cep, conta, agencia, codigoBanco, tipoConta)
VALUES
    (46239307009, '2019-01-01', 'AC', 'Quadra 05 Conjunto X', 107, 'Setor Leste', 'Gama', 'DF', 72430207, 10901981, 3556, 1, 'CC' ),
    (28876627081, '2018-01-01', 'SIA', 'Quadra 06 Conjunto D', 108, 'Setor Oeste', 'Plano Piloto', 'DF', 72430223, 12742406, 995, 1, 'CC' ),
    (91230960040, '2017-01-01', 'SIA', 'Quadra 07 Conjunto F', 115, 'Setor Norte', 'Ceilandia', 'DF', 72430245, 12282278, 1319, 1, 'CC' ),
    (70300770082, '2016-01-01', 'AC', 'Quadra 08 Conjunto T', 123, 'Setor Sul', 'Taguatinga', 'DF', 72430298, 11599286, 4758, 1, 'CC' ),
    (54434964097, '2015-01-01', 'AC', 'Quadra 09 Conjunto R', 111, 'Setor Leste', 'Valparaiso', 'GO', 72430212, 2204010, 2852, 1, 'CC' );

INSERT INTO AREA 
    (nome)
VALUES 
    ('Venda'),
    ('Manutencao'),
    ('Marketing'),
    ('Gerencia'),
    ('Dono');

INSERT INTO FORNECEDOR 
    (cnpj, nome, email)
VALUES
    (66817265000195, 'Autorizada SONY Ltd', 'autorizada.sony@gmail.com'),
    (11764473000181, 'EletroGames', 'eletrogames@gmail.com'),
    (97220932000181, 'Games pop', 'games.pop@gmail.com'),
    (07190228000130, 'Art pop', 'arte.pop@gmail.com'),
    (55314457000162, 'Cine pop', 'cine.pop@gmail.com');

INSERT INTO telefoneFornecedor
    (idFornecedor, telefone)
VALUES
    (1, '54659687279'),
    (2, '18265230465'),
    (3, '30747304845'),
    (4, '46646933910'),
    (5, '76855042879');

INSERT INTO DEFEITO
    (descricao, valorServico)
VALUES
    ('Chip grafico', '130.00'),
    ('Adaptadores de rede e de Bluetooth estragados', '50.00'),
    ('Fonte de energia com problemas de regulagem de tensao', '100.00'),
    ('Saídas de video com funcionamento comprometido', '40.00'),
    ('Leitor optico com avarias', '80.00');

INSERT INTO MARCA 
    (nome)
VALUES
    ('PlayStation'),
    ('XBox'),
    ('Nintendo'),
    ('Disney'),
    ('Funko Pop');

INSERT INTO MODELO 
    (nome)
VALUES
    ('Nintendo Switch'),
    ('Xbox One S'),
    ('Playstation 4 Slim'),
    ('New Nintendo 3DS XL'),
    ('Stranger Things');

INSERT INTO PECA 
    (descricao, valor)
VALUES
    ('Conector De 72 pinos para Nintendo NES CONSOLE', 30.00),
    ('Joystick de polegar analogicos 2Pcs- Dualshock controlador PS4', 10.00),
    ('Carcaça Roxo Claro caso Shell de substituição para Nintendo Gameboy Advance Game Boy Advance', 36.00),
    ('Carcaça Traseira Shell Capa Protetora para substituicao do console Nintendo Switch Protec Q6F', 35.00),
    ('Lente Tela De Concha De Habitação Claro Completa Para Capa Para Nintend Ds Lite Dsl', 33.00);

INSERT INTO VENDA
    (data, formaPagamento, desconto, cpfCliente, matFuncionario)
VALUES
    ('2019-11-27 16:15:30', 'D', 0, 78766228018, 1),
    ('2019-11-27 16:20:56', 'CD', 0, 78766228018, 1),
    ('2019-11-27 16:40:23', 'D', 0, 12566432031, 2),
    ('2019-11-27 16:50:45', 'CCV', 0, 12566432031, 2),
    ('2019-11-27 17:10:26', 'CCP', 0, 18571990069, 1);

INSERT INTO ITEM
    (ncm, armazenamento, localizacao, descricao, dtEntrada, idMarca, matFuncionario, idModelo)
VALUES
    (7899031566493, NULL, 'SIA', 'CONTROLE PARA PS2 VIBRATION NEW GENERATION LEADERSHIP REF 6649', '2019-12-04', 1, 1, 1),
    (711719700302, NULL, 'AC', 'VIDEO GAME SONY PLAYSTATION 2', '2019-12-04', 2, 2, 2),
    (885370235913, NULL, 'SIA', 'CONSOLE OFICIAL XBOX 4GB + KINECT SENSOR + JOGO KINECT ADVENTURES + CONTROLE SEM FIO - MICROSOFT', '2019-12-04', 3, 3, 3),
    (7896504705175, NULL, 'AC', 'VIDEO GAME DYNACON XTREME BIV', '2019-12-04', 4, 4, 4),
    (7898928572944, NULL, 'SIA', 'VOLANTE INTEGRIS SPORTS RACING PS2/PC', '2019-12-04', 5, 5, 5),
    (7899031533493, NULL, 'AC', 'CONTROLE PARA PS2 VIBRATION NEW GENERATION LEADERSHIP REF 6649', '2019-12-04', 1, 1, 2),
    (711719799302, NULL, 'SIA', 'VIDEO GAME SONY PLAYSTATION 2', '2019-12-04', 2, 2, 3),
    (885370289913, NULL, 'AC', 'CONSOLE OFICIAL XBOX 4GB + KINECT SENSOR + JOGO KINECT ADVENTURES + CONTROLE SEM FIO - MICROSOFT', '2019-12-04', 3, 3, 4),
    (7896504905175, NULL, 'SIA', 'VIDEO GAME DYNACON XTREME BIV', '2019-12-04', 4, 4, 5),
    (7898928672944, NULL, 'AC', 'VOLANTE INTEGRIS SPORTS RACING PS2/PC', '2019-12-04', 5, 5, 1);
    
INSERT INTO NOVO
    (idItem, quantidade, valorEntrada, valorSaida)
VALUES
    (1, 5, 36.00, 49.90),
    (2, 6, 1100.00, 1500.00),
    (3, 7, 2000.00, 2500.00),
    (4, 8, 400.00, 600.00),
    (5, 4, 130.00, 180.00);

INSERT INTO SEMINOVO
    (idItem, quantidade, valorEntrada, valorSaida)
VALUES
    (6, 5, 15.00, 25.90),
    (7, 6, 300.00, 500.00),
    (8, 7, 1300.00, 1600.00),
    (9, 8, 190.00, 300.00),
    (10, 4, 60.00, 90.00);

INSERT INTO MANUTENCAO
    (numeroSerie, descricaoItem, localizacao, autorizacao, status, dtEntrada, cpfCliente,
        responsavel, dtSaida, tecnico, idVenda)
VALUES
    ('2316771', 'Controle PlaySation 2', 'SIA', 'S', 'O', '2019-11-27', 78766228018, 1, '2019-12-04', 2, 1),
    ('4318651', 'Console PlaySation 2', 'SIA', 'S', 'A', '2019-11-27', 78766228018, 1, '2019-12-04', 2, 2),
    ('5571771', 'Controle PlaySation 4', 'SIA', 'S', 'E', '2019-11-27', 12566432031, 2, '2019-12-04', 4, 3),
    ('6916678', 'Console PlaySation 4', 'SIA', 'S', 'E', '2019-11-27', 12566432031, 2, '2019-12-04', 4, 4),
    ('9846771', 'Console Nintendo', 'SIA', 'S', 'P', '2019-11-27', 18571990069, 3, '2019-12-04', 5, 5);

INSERT INTO corrige
    (idDefeito, idPeca)
VALUES
    (1, 1),
    (2, 2),
    (3, 4),
    (4, 4),
    (5, 5);

INSERT INTO fornece
    (idItem, idFornecedor)
VALUES
    (1, 1),
    (2, 2),
    (3, 4),
    (4, 4),
    (5, 5);

INSERT INTO inserido
    (idArea, matFuncionario)
VALUES
    (1, 1),
    (2, 2),
    (3, 4),
    (4, 4),
    (5, 5);

INSERT INTO prove
    (idFornecedor, idPeca)
VALUES
    (1, 1),
    (2, 2),
    (3, 4),
    (4, 4),
    (5, 5);

INSERT INTO repara
    (idManutencao, idDefeito)
VALUES
    (1, 1),
    (2, 2),
    (3, 4),
    (4, 4),
    (5, 5);

INSERT INTO revendido
    (idItem, idVenda, quantidade)
VALUES
    (1, 1, 3),
    (2, 2, 2),
    (3, 4, 1),
    (4, 4, 1),
    (5, 5, 4);

INSERT INTO vendido
    (idItem, idVenda, quantidade)
VALUES
    (1, 1, 3),
    (2, 2, 2),
    (3, 4, 1),
    (4, 4, 1),
    (5, 5, 4);
