-- -----------------------     << Clínica Médica  >>     -----------------------
-- 
--                    SCRIPT DE POPULAR (DML)
-- 
-- Data Criacao ...........: 23/09/2019
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer5Evolucao6
-- 
-- Data Ultima Alteracao ..: 14/10/2019
--   => Criação do script para popular as tabelas do banco
--   => Uso do insert que não depende da ordem direta das colunas do banco
--   => Formatação do insert para multiplas inserções
--   => Formatação para melhor visualização dos dados
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- ----------------------------------------------------------------------------

USE aula4exer5Evolucao6;


INSERT INTO MEDICO
    ( crm, estado, nomeCompleto )
VALUES
    ( 13341, 'DF', 'Marco Antonio da Costa Carvalho' ),
    ( 11349, 'DF', 'Alexandre Antônio da Silva' ),
    ( 11549, 'DF', 'Liliane Cristina Cugula Couto' );

INSERT INTO PACIENTE
    ( nomeCompleto, dtNascimento, sexo, rua, numero, bairro, complemento, cidade, estado, cep )
VALUES
    ( 'Rogério Silva dos Santos Júnior', '1999-09-21', 'M', 'Quadra 3 Conjunto H', 107,
        'Setor Leste (Gama)', NULL, 'Brasília', 'DF', 72420207),
    ( 'Youssef Muhamad Yacoub Falaneh', '1999-11-20', 'M', 'Rua 76', 18, 'Jardim Céu Azul',
        NULL, 'Valparaíso de Goiás', 'GO', 72373086 ),
    ( 'Glenda Soares', '1961-12-30', 'F', 'QMSW 4 Lote 2', 8, 'Sudoeste', 
        'Próximo ao Parque do Sudoeste', 'Brasília', 'DF', 70680406 );

INSERT INTO MEDICAMENTO
    ( principioAtivo)
VALUES
    ( 'Ipubrofeno' ),
    ( 'Paracetamol' ),
    ( 'Amoxilina' ),
    ( 'Nimesulida' ),
    ( 'Cloridrato de Fluoxetina' );

INSERT INTO ESPECIALIDADE
    ( nome )
VALUES
    ( 'Clinico Medico' ),
    ( 'Angiologista' ),
    ( 'Gastrologista' ),
    ( 'Psiquiatra' );

INSERT INTO CONSULTA
    ( dataHora, crm, estado, idPaciente )
VALUES
    ( NOW(), 13341, 'DF', 1 ),
    ( NOW(), 11349, 'DF', 2 ),
    ( NOW(), 11549, 'DF', 3 );

INSERT INTO RECEITA
    ( posologia, idConsulta )
VALUES
    ( '3 vezes ao dia / 2 vezes ao dia', 1 ),
    ( '12 em 12 horas / 8 em 8 horas', 2 ),
    ( '1 comprimido ao dia', 3 );

INSERT INTO contem
    (idReceita, idMedicamento)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (3, 5);

INSERT INTO possui
    (crm, estado, idEspecialidade)
VALUES
    (13341, 'DF', 1),
    (13341, 'DF', 2),
    (11349, 'DF', 1),
    (11349, 'DF', 3),
    (11549, 'DF', 4);

INSERT INTO telefone
    (idPaciente, telefone)
VALUES
    ( 1, 982347659 ),
    ( 2, 986573289 ),
    ( 3, 984569023 );