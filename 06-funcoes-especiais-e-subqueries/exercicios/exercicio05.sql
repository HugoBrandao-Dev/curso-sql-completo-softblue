USE exercicio_curso_sql;

/* ========== Exercício 1 ========== */

/* Exiba o nome do aluno mais antigo da softblue. */
SELECT aluno FROM aluno LIMIT 1;

/* Exiba o nome do aluno mais antigo da softblue. */
SELECT aluno FROM aluno ORDER BY codigo DESC LIMIT 1;

/* Exiba o nome do terceiro aluno mais antigo da softblue. */
SELECT aluno FROM aluno LIMIT 2, 1;

/* Exiba a quantidade de cursos que já foram vendidos pela softblue. */
SELECT COUNT(*) FROM pedido_detalhe;

/* Exiba o valor total já arrecadado pelos cursos vendidos pela softblue. */
SELECT SUM(valor) FROM pedido_detalhe;

/* Exiba o valor médio cobrado por curso para o pedido cujo CODIGO é 2 */
SELECT ROUND(AVG(valor), 2) AS "Valor médio" FROM pedido_detalhe WHERE pedido = 2;

/* Exiba o valor do curso mais caro da softblue. */
SELECT MAX(valor) FROM curso;

/* Exiba o valor do curso mais barato da softblue. */
SELECT MIN(valor) FROM curso;

/* Exiba o valor total de cada pedido realizado na softblue. */
SELECT pedido, SUM(valor) AS Total FROM pedido_detalhe GROUP BY pedido;

/*
Exiba os nomes dos instrutores da softblue e a quantidade de cursos que
cada um tem sob sua responsabilidade.
*/
SELECT i.instrutor, COUNT(c.instrutor) AS Cursos FROM curso c 
JOIN instrutor i ON i.codigo = c.instrutor GROUP BY i.instrutor;

/*
Exiba o número do pedido, nome do aluno e valor para todos os pedidos
realizados na softblue cujo valor total sejam maiores que 500.
*/
SELECT p.codigo AS Pedido, a.aluno, SUM(pd.valor) AS Total FROM pedido p
JOIN pedido_detalhe pd ON pd.pedido = p.codigo
JOIN aluno a ON a.codigo = p.aluno
GROUP BY p.codigo HAVING SUM(pd.valor) > 500;

/*
Exiba o número do pedido, nome do aluno e quantos cursos foram
comprados no pedido para todos os pedidos realizados na softblue
que compraram dois ou mais cursos.
*/
SELECT p.codigo AS Pedido, a.aluno, COUNT(pd.curso) AS "Cursos comprados" FROM pedido p
JOIN aluno a ON a.codigo = p.aluno
JOIN pedido_detalhe pd ON pd.pedido = p.codigo
GROUP BY p.codigo HAVING COUNT(pd.curso) >= 2;

/*
Exiba o nome e endereço de todos os alunos que morem em Avenidas
(Av.).
*/
/* NÃO FOI MOSTRADO, NA AULA PRÁTICA, COMO SE ANALISA PARTE DE UM CAMPO. */

/* Exiba os nomes dos curso de Java da Softblue. */
/* NÃO FOI MOSTRADO, NA AULA PRÁTICA, COMO SE ANALISA PARTE DE UM CAMPO. */

/* ========== Exercício 2 ========== */

/*
Utilizando subquery, exiba uma lista com os nomes dos cursos 
disponibilizados pela softblue informando para cada curso qual 
o seu menor valor de venda já praticado.
*/
SELECT c.curso, c.valor AS "Valor atual", pd.valor AS "Menor valor já vendido" FROM curso c
JOIN pedido_detalhe pd ON pd.curso = c.codigo GROUP BY c.curso;

/*
Utilizando subquery e o parâmetro IN, exiba os nomes dos cursos 
disponibilizados pela softblue cujo tipo de curso seja 
"Programação".
*/
SELECT * FROM curso WHERE curso.tipo IN (SELECT codigo FROM tipo WHERE tipo = "Programação");

/*
Utilizando subquery e o parâmetro EXISTS, exiba novamente os nomes
dos cursos disponibilizados pela softblue cujo tipo de curso seja
"Programação".
*/
/* NÃO FOI MOSTRADO, NA AULA PRÁTICA, O FUNCIONAMENTO DO EXISTS. */

/*
Exiba uma lista com os nomes dos instrutores da softblue e ao lado
o total acumulado das vendas referente aos cursos pelo qual o 
instrutor é responsável
*/
SELECT i.instrutor, SUM(pd.valor) AS "Total em vendas" FROM instrutor i
JOIN curso c ON c.instrutor = i.codigo
JOIN pedido_detalhe pd ON pd.curso = c.codigo GROUP BY (i.codigo);

/*
Crie uma visão que exiba os nomes dos alunos e quanto cada um já
comprou em cursos.
*/
SELECT a.aluno, COUNT(a.codigo) AS "Cursos comprados" FROM aluno a
JOIN pedido p ON p.aluno = a.codigo
JOIN pedido_detalhe pd ON pd.pedido = p.codigo GROUP BY a.codigo;
