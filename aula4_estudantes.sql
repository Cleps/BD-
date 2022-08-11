CREATE TABLE estudantes(
disciplina DECIMAL(4),
matricula INT(8),
nf DECIMAL(4,2)
);

INSERT INTO estudantes(disciplina, matricula, nf) VALUES("01","002","10");
INSERT INTO estudantes(disciplina, matricula, nf) VALUES("01","001","5.5");
INSERT INTO estudantes(disciplina, matricula, nf) VALUES("02","002","9");
INSERT INTO estudantes(disciplina, matricula, nf) VALUES("02","001","6");


SELECT disciplina, matricula, nf NF FROM estudantes;


SELECT matricula as "Matricula", AVG(nf)
FROM estudantes
GROUP BY matricula
ORDER BY matricula;
