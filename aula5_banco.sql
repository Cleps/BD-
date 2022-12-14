CREATE DATABASE banco;

CREATE TABLE agencia(
    nome_agencia VARCHAR(100) PRIMARY KEY, 
    cidade_agencia VARCHAR(100) default"Rio Branco", 
    ativo INT CHECK(ativo<2 AND ativo>=0)
    );

CREATE TABLE cliente(
    nome_cliente VARCHAR(100) PRIMARY KEY,
    rua_cliente VARCHAR(100),
    cidade_cliente VARCHAR(100)
    );

CREATE TABLE conta(
    numero_conta CHAR(8) PRIMARY KEY,
    nome_agencia VARCHAR(100),
    saldo DECIMAL(8,2),
    FOREIGN KEY(nome_agencia) REFERENCES agencia(nome_agencia) ON DELETE CASCADE
    );

CREATE TABLE emprestimo(
    numero_emprestimo INT PRIMARY KEY, 
    nome_agencia VARCHAR(100), 
    quantia DECIMAL(8,2),
    FOREIGN KEY (nome_agencia) REFERENCES agencia(nome_agencia)
    );

CREATE TABLE depositante(
    nome_cliente VARCHAR(100), 
    numero_conta INT PRIMARY KEY,
    FOREIGN KEY (numero_conta) REFERENCES conta(numero_conta)
    );

CREATE TABLE tomador(
    nome_cliente VARCHAR(100), 
    numero_conta INT PRIMARY KEY,
    FOREIGN KEY (numero_conta) REFERENCES conta(numero_conta)
    );

INSERT INTO agencia(nome_agencia, cidade_agencia, ativo) values("agencia A", " cidade C", 1);
INSERT INTO agencia(nome_agencia, cidade_agencia, ativo) values("agencia S", " cidade X", 1);
INSERT INTO agencia(nome_agencia, cidade_agencia, ativo) values("agencia D", "cidade Z", 0);
INSERT INTO agencia(nome_agencia, cidade_agencia, ativo) values("agencia G", "cidade Z", 1);
INSERT INTO agencia(nome_agencia, cidade_agencia, ativo) values("agencia H", "cidade Z", 1);

INSERT INTO cliente(nome_cliente, rua_cliente, cidade_cliente) values("Mr A", "rua seila man", "cidade A");
INSERT INTO cliente(nome_cliente, rua_cliente, cidade_cliente) values("Mr B", "rua nao sei", "cidade C");
INSERT INTO cliente(nome_cliente, rua_cliente, cidade_cliente) values("Mr C", "rua nao sei", "cidade C");

INSERT INTO conta(numero_conta, nome_agencia, saldo) values("001", "agencia S", "100000");
INSERT INTO conta(numero_conta, nome_agencia, saldo) values("002", "agencia H", "200000");
INSERT INTO conta(numero_conta, nome_agencia, saldo) values("003", "agencia G", "300000");
INSERT INTO conta(numero_conta, nome_agencia, saldo) values("004", "agencia G", "300000");

INSERT INTO emprestimo(numero_emprestimo, nome_agencia, quantia) values("002", "agencia A", "10000");
INSERT INTO emprestimo(numero_emprestimo, nome_agencia, quantia) values("003", "agencia S", "20000");
INSERT INTO emprestimo(numero_emprestimo, nome_agencia, quantia) values("004", "agencia A", "30000");

INSERT INTO tomador(nome_cliente, numero_conta) values("Mr B", "004");
INSERT INTO tomador(nome_cliente, numero_conta) values("Mr A", "003");
INSERT INTO tomador(nome_cliente, numero_conta) values("Mr C", "002");


SELECT * FROM agencia;
SELECT * FROM cliente;
SELECT * FROM conta;

/*NATUAL JOIN LIGA COM NOMES IGUAIS, JA INNER JOIN LIGA COM NOMES IGUAIS OU N??O*/
/*FUNCAO PARA JUNTAR TABELAS COM CAMPOS EQUIVALENTES, TIPO AI JUNTANDO O NOME DAS AGENCIAS EM COMUM*/

SELECT *
FROM conta c
    INNER JOIN /*FUN????O PARA LIGA????O DE ELEMENTOS NA TABELA*/
    agencia a
    ON c.nome_agencia = a.nome_agencia;
    
/*tbm tem outras opera????es como AVG media, Count contar e outros*/

SELECT SUM(saldo) as "Soma de todos os saldos"
FROM conta;

/*somando por grupos*/
/*renomeando ali agencia*/
SELECT nome_agencia "Agencia", SUM(saldo) as "Soma ( + )"
FROM conta
GROUP BY nome_agencia
ORDER BY nome_agencia;

/*JUN????O ENTRE VALORES IGUAIS = CRUZANDO AS LINHAS // CASO NN TENHA O IGUAL ELE CRUZA TODOS VALORES (CONCATENA????O)*/
SELECT e.nome_agencia, t.nome_cliente, e.quantia
FROM emprestimo e, tomador t
WHERE e.numero_emprestimo = t.numero_conta;
