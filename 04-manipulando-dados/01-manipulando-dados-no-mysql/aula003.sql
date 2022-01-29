USE curso_sql;

/* ########## TABELA FUNCIONARIOS ##########*/

/* Cria um novo registro na tabela funcionarios */
INSERT INTO funcionarios(id, nome, salario, departamento) VALUES (1, "Fernando", 1400, "TI");
INSERT INTO funcionarios(id, nome, salario, departamento) VALUES (2, "Guilherme", 2500, "Jurídico");
INSERT INTO funcionarios(nome, salario, departamento) VALUES ("Fábio", 1700, "TI");
INSERT INTO funcionarios(nome, salario, departamento) VALUES ("José", 1800, "Marketing");
INSERT INTO funcionarios(nome, salario, departamento) VALUES ("Isabela", 2200, "Jurídico");

/* Faz a busca por todos os registros da tabela funcionarios */
SELECT * FROM funcionarios;

/* Faz a busca por funcionários que possuem salário maior que 2000 */
SELECT * FROM funcionarios WHERE salario > 2000;

/* Faz a busca por funcionários que possuem nome igual a "José" */
SELECT * FROM funcionarios WHERE nome = "José";

/* Faz a busca por funcionários que possuem ID igual a 3 */
SELECT * FROM funcionarios WHERE id = 3;

/*
Faz com que todos os funcionários ganhem um aumento salarial de 10%
Dará erro se o SAFE UPDATE estiver ativado, que impede que mais de 
um registro seja alterado de uma única vez.
*/
UPDATE funcionarios SET salario = salario * 1.1;

/* Faz com que o funcinários Fernando tenha um aumento de 10% */
UPDATE funcionarios SET salario = salario * 1.1 WHERE nome = "Fernando";

/* 
Faz com que todos os funcionarios tenham um aumento salarial de 10%,
porém, com a função ROUND, podemos dizer quantas casas decimais são 
aceitáveis. 
*/
UPDATE funcionarios SET salario = ROUND(salario * 1.1, 2);

/* Exclui o registro cujo ID é igual a 4 (José) */
DELETE FROM funcionarios WHERE id = 4;

/*
Retornando todos os funcionarios cujos os salários 
são maiores de 2000. Desta vez, utilizamos um apelido
para a tabela funcionarios
*/
SELECT * FROM funcionarios f WHERE f.salario > 2000;

/*
Retorna somente o nome e o salario dos funcionarios que tem
salario maior que 2000. Utilizamos o apelino junto ao nome
dos campos, desta vez.
*/
SELECT f.nome, f.salario FROM funcionarios f WHERE f.salario > 2000;

/*
Retorno o mesmo dado do código anterior, mas desta vez, utilizamos um 
apelido de campo.
*/
SELECT nome AS "Funcionário", f.salario FROM funcionarios f WHERE f.salario > 2000;

/*
Traz o registros de funcionarios com nomes iguais a "Guilherme", 
e também trará os que tem o id iguais a 5, tudo em uma mesma tabela.
*/
SELECT * FROM funcionarios WHERE nome = "Guilherme"
UNION
SELECT * FROM funcionarios WHERE id = 5;

/*
Trará todos os funcionarios que tenham nomes iguais a "Guilherme",
junto com os que tem id iguais a 2. Porem neste código, como os
registros que serão achados são iguais, ele só mostrará uma única
vez.
*/
SELECT * FROM funcionarios WHERE nome = "Guilherme"
UNION
SELECT * FROM funcionarios WHERE id = 2;

/*
Mesmo princípio do código acima, mas trará os registros mesmo que
sejam repetidos.
*/
SELECT * FROM funcionarios WHERE nome = "Isabela"
UNION ALL
SELECT * FROM funcionarios WHERE id = 5;

/* ########## TABELA VEICULOS ########## */

/* Cria novos registros para a tabela "veiculos" */
INSERT INTO veiculos(funcionario_id, veiculo, placa) VALUES (1, "Carro", "SB-0001");
INSERT INTO veiculos(funcionario_id, veiculo, placa) VALUES (1, "Carro", "SB-0002");

/* Retorna todos os registros da tabela "veiculos" */
SELECT * FROM  veiculos;

/* Altera o dono do veículo 2 para a Isabela */
UPDATE veiculos SET funcionario_id = 5 WHERE id = 2;

/* ########## TABELA SALARIOS ########## */

CREATE TABLE salarios(
	faixa VARCHAR(45) NOT NULL,
    inicio DOUBLE NOT NULL,
    fim DOUBLE NOT NULL,
    PRIMARY KEY (faixa)
);

/* Cria novos registros para a tabela "salario" */
INSERT INTO salarios(faixa, inicio, fim) VALUES ("Analista Jr", 1000, 2000);
INSERT INTO salarios(faixa, inicio, fim) VALUES ("Analista Pleno", 2000, 4000);

/* Retorna todos so registros da tabela "salario" */
SELECT * FROM salarios;

/* ########## OUTROS CÓDIGOS SQL ########## */

/* 
Desabilita o SAFE UPDATE do banco de dados.
Para habilitar novamente, basta trocar o valor 0 para o valor 1.
*/
SET SQL_SAFE_UPDATES = 0;
