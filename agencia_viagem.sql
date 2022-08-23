CREATE DATABASE agencia_turismo;


CREATE TABLE operadora(
    ope_codigo INT(8) PRIMARY KEY NOT NULL,
    ope_nome VARCHAR(60),
    ope_endereco VARCHAR(120),
    ope_code_cidade VARCHAR(12),
    ope_tele VARCHAR(11),
    ope_contato VARCHAR(11)
);


CREATE TABLE cidade(
    cid_code CHAR(12) PRIMARY KEY NOT NULL,
    cid_nome VARCHAR(60),
    cid_estado VARCHAR(30)
);



CREATE TABLE cliente(
    cli_cpf CHAR(12) PRIMARY KEY NOT NULL,
    cli_nome VARCHAR(60),
    cli_end VARCHAR(120),
    cid_code CHAR(12),
    FOREIGN KEY(cid_code) REFERENCES cidade(cid_code)
);


CREATE TABLE pacote_trajeto(
    pct_code CHAR(12) PRIMARY KEY NOT NULL,
    cid_code CHAR(12),
    FOREIGN KEY(cid_code) REFERENCES cidade(cid_code)
);


CREATE TABLE vendas(
    ven_code CHAR(12) PRIMARY KEY NOT NULL,
    cli_cpf CHAR(12),
    data_venda CHAR(6),
    pct_code CHAR(12),
    FOREIGN KEY(pct_code) REFERENCES pacote_trajeto(pct_code)
);

CREATE TABLE pagamento(
    venda_code CHAR(12) PRIMARY KEY NOT NULL,
    pag_num_parcela CHAR(2),
    pag_valor DECIMAL(4,2),
    pag_data_venci CHAR(6),
    pag_data_pgmt CHAR(6),
    pag_tipo VARCHAR(12)
);

CREATE TABLE pag_cheque(
    venda_code CHAR(12),
    pag_num_parcela CHAR(2),
    cheque_num CHAR(8) PRIMARY KEY NOT NULL,
    cheque_banco VARCHAR(12),
    cheque_data_deposito CHAR(8)
);


INSERT INTO operadora(ope_codigo, ope_nome, ope_endereco, ope_code_cidade, ope_tele, ope_contato) VALUES ('00000000', 'nome A', 'enderço A', "0000", "6800000000", "contato A");
INSERT INTO operadora(ope_codigo, ope_nome, ope_endereco, ope_code_cidade, ope_tele, ope_contato) VALUES ('11111111', 'nome B', 'enderço B', "1111", "6811111111", "contato B");
INSERT INTO operadora(ope_codigo, ope_nome, ope_endereco, ope_code_cidade, ope_tele, ope_contato) VALUES ('22222222', 'nome C', 'enderço C', "2222", "6822222222", "contato C");

INSERT INTO cidade(cid_code, cid_nome, cid_estado) VALUES ("code-00", 'cidade A', 'estado A');
INSERT INTO cidade(cid_code, cid_nome, cid_estado) VALUES ("code-11", 'cidade Marilia', 'estado B');
INSERT INTO cidade(cid_code, cid_nome, cid_estado) VALUES ("code-22", 'cidade C', 'estado C');

INSERT INTO cliente(cli_nome, cli_cpf, cli_end, cid_code) VALUES ('cliente A', '000000000000', 'endereço Y', 'code-00');
INSERT INTO cliente(cli_nome, cli_cpf, cli_end, cid_code) VALUES ('cliente B', '121212121212', 'endereço Z', 'code-11');
INSERT INTO cliente(cli_nome, cli_cpf, cli_end, cid_code) VALUES ('cliente C', '131313131313', 'endereço X', 'code-22');
INSERT INTO cliente(cli_nome, cli_cpf, cli_end, cid_code) VALUES ('cliente D', '151515151515', 'endereço X', 'code-22');

SELECT cli_nome, cli_cpf as "cpf-----", cid_nome
FROM cliente c
    INNER JOIN /*FUNÇÃO PARA LIGAÇÃO DE ELEMENTOS NA TABELA*/
    cidade ci
    ON c.cid_code = ci.cid_code;
    
    
    
    
    
    
    
