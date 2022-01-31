USE curso_sql;

/* ========= COUNT ========= */

/* Faz a contagem dos registros presentes na tela funcionarios. */
SELECT COUNT(*) FROM funcionarios;

/* Para a minha tabela ter os mesmos registros da tabela do professor. */
UPDATE funcionarios SET salario = 1500 WHERE id = 3;

/* Conta a quantidade de funcionarios com salarios acima de 1500. */
SELECT COUNT(*) FROM funcionarios WHERE salario > 2000;

/* 
Contagem de funcionários que tenham salários acima de 1600 e 
trabalham no setor Jurídico.
*/
SELECT COUNT(*) FROM funcionarios WHERE salario > 1600 AND departamento = "Jurídico";

/* ========= SOMA ========= */

/* Traz o somatório do salário de todos os funcionários. */
SELECT SUM(salario) FROM funcionarios;

/* Traz o somatório dos salários dos funcionários do setor de TI. */
SELECT SUM(salario) FROM funcionarios WHERE departamento = "TI";

/* ========= MÉDIA ========= */

/* Traz a média salarial de todos os funcionários */
SELECT AVG(salario) FROM funcionarios;

/* Traz a média salarial de todos os funcionários do setor de TI. */
SELECT AVG(salario) FROM funcionarios WHERE departamento = "TI";

/* ========= MAIOR VALOR ========= */

/* Traz o maior salário da tabela funcionários. */
SELECT MAX(salario) FROM funcionarios;

/* Traz o maior salário de um funcionário no setor de TI. */
SELECT MAX(salario) FROM funcionarios WHERE departamento = "TI";

/* ========= MENOR VALOR ========= */

/* Traz o menor salário da tabela funcionários. */
SELECT MIN(salario) FROM funcionarios;

/* Traz o nome do funcionário que tem menor o salário do setor de TI. */
SELECT nome, MIN(salario) FROM funcionarios WHERE departamento = "TI";

/* ========= DISTINCT ========= */

/*
Busca os departamento dentro da tabela funcionarios, mas 
ignora registros valores repetidos.
*/
SELECT DISTINCT(departamento) FROM funcionarios;

/* ========= ORDENAÇÃO ========= */

/* Traz todos os funcionários ordenados pelo seu nome (ASC é padrão). */
SELECT * FROM funcionarios ORDER BY nome;

/* Traz todos os funcionários, mas ordena-os de forma decrescente. */
SELECT * FROM funcionarios ORDER BY nome DESC;

/* Faz o ordenamento do menor para o maior salário dos funcionários. */
SELECT * FROM funcionarios ORDER BY salario;

/* Faz o ordenamento do maior para o menor salário dos funcionários. */
SELECT * FROM funcionarios ORDER BY salario DESC;

/*
Faz a ordenação alfabética pelo departamento e, em seguida, pelo 
salário, dentro de cada departamento.
*/
SELECT * FROM funcionarios ORDER BY departamento, salario;

/*
Faz a ordenação alfabética pelo departamento e, em seguida, pelo 
salário decrescente, dentro de cada departamento.
*/
SELECT * FROM funcionarios ORDER BY departamento, salario DESC;

/*
Faz a ordenação alfabética decrescente pelo departamento e, em 
seguida, pelo salário decrescente, dentro de cada departamento.
*/
SELECT * FROM funcionarios ORDER BY departamento DESC, salario DESC;

/* ========= LIMIT ========= */

/* Limita para 2 a busca de funcionários. */
SELECT * FROM funcionarios LIMIT 2;

/*
Limita para 2 a busca de funcionários, mas tendo como base 
o registro 2 (3 em diante).
*/
SELECT * FROM funcionarios LIMIT 2 OFFSET 2;
/* Sua propriedade esteganográfica "[...] LIMIT [OFFSET, LIMIT]" */
SELECT * FROM funcionarios LIMIT 2, 2;

/* ========= GROUP BY ========= */

/*
Devemos mostrar, através do select, aquilo que se está querendo
agrupar no group by
*/

/* Traz a média salarial de cada departamento. */
SELECT departamento, AVG(salario) FROM funcionarios 
GROUP BY departamento;

/*
Traz média salarial de cada departamento, desde que sua média 
seja maior que 2000.
*/
SELECT departamento, AVG(salario) FROM funcionarios 
GROUP BY departamento HAVING AVG(salario) > 2000;

/* Faz a contagem de funcionários em cada departamento. */
SELECT departamento, COUNT(*) FROM funcionarios GROUP BY departamento;

/*
Traz o nome dos funcionarios dos departamentos cuja 
a média salarial seja maior que 2000.
*/
SELECT nome, salario FROM funcionarios WHERE departamento IN 
(SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000);