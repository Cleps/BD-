//CONSULTAS

//retornar alunos q estejam em todas disciplinas

SELECT * FROM alunos a NATURAL JOIN matricula m
WHERE 
	NOT EXISTS(
	SELECT coddisc from alunos NATURAL JOIN disciplina
	WHERE disciplina.coddisc not in (
	SELECT coddisc from disciplina m
		)
	);
