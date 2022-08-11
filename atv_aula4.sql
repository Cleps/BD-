/*
show database
if not exist
CREATE DATABASE academico;

*/

CREATE TABLE aluno(
matricula CHAR(11) PRIMARY KEY,
nome VARCHAR(40),
celular CHAR(12),
email VARCHAR(40)
);

CREATE TABLE disciplina(
codigo CHAR(12) PRIMARY KEY,
nome VARCHAR(40),
ch CHAR(3),
creditos INT(2)
);

CREATE TABLE curso(
matricula CHAR(11) PRIMARY KEY,
codigo CHAR(12) PRIMARY KEY,
ano INT(4),
semestre VARCHAR(10),
n1 DECIMAL(4,2),
n2 DECIMAL(4,2),
final DECIMAL(4,2),
media DECIMAL(4,2),
FOREIGN KEY(matricula) REFERENCES aluno(matricula) ON DELETE CASCADE,
FOREIGN KEY (codigo) REFERENCES disciplina(codigo) ON DELETE CASCADE
);


