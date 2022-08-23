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





