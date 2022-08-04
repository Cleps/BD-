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

INSERT INTO agencia(nome_agencia, cidade_agencia, ativo) values("agencia rogerio", " cidade rogerio", 1);
INSERT INTO agencia(nome_agencia, cidade_agencia, ativo) values("agencia leticia", " cidade leticia", 1);
INSERT INTO agencia(nome_agencia, cidade_agencia, ativo) values("agencia sergio", "cidade sergio", 0);

INSERT INTO cliente(nome_cliente, rua_cliente, cidade_cliente) values("juan carlos", "chupa pika", "cidade rogerio");

SELECT * FROM agencia;
SELECT * FROM cliente;
