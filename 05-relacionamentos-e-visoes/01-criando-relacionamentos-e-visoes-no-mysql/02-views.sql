/*
Cria uma sintaxe rápida (view) que busca por funcionarios que tenhar uma salario
maior ou igual a 1700.
*/
CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1700;

/*
Cria uma view para buscar funcionarios que tenham salários menores que 0.
*/
CREATE VIEW funcionarios_b AS SELECT * FROM funcionarios WHERE salario < 0;

/*
Atualiza a view, onde o limite salario passa a ser igual ou maior que 2500.
*/
ALTER VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 2500;

/* Usa a view criada*/
SELECT * FROM funcionarios_a;

/* Exclui a view funcionarios_b */
DROP VIEW funcionarios_b;