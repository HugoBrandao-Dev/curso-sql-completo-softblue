/* EXERCÍCIOS PROPOSTOS */

USE exercicio_curso_sql;

/* ========== Exercício 1 ========== */

/* 
Exiba uma lista com os títulos dos cursos da Softblue e o tipo
de curso ao lado
*/
SELECT curso.curso, tipo.tipo FROM curso JOIN tipo ON curso.tipo = tipo.codigo;

/* 
Exiba uma lista com os títulos dos cursos da Softblue, tipo do
curso, nome do instrutor responsável pelo mesmo e telefone.
*/
SELECT c.curso, t.tipo, i.instrutor, i.telefone FROM curso c 
JOIN tipo t ON c.tipo = t.codigo
JOIN instrutor i ON c.instrutor = i.codigo;

/* 
Exiba uma lista com o código e data e hora dos pedidos e os 
códigos dos cursos de cada pedido
*/
SELECT p.codigo, p.data_hora, pd.curso FROM pedido p 
JOIN pedido_detalhe pd ON p.codigo = pd.pedido;

/* 
Exiba uma lista com o código e data e hora dos pedidos e os 
títulos dos cursos de cada pedido 
*/
SELECT p.codigo, p.data_hora, c.curso FROM pedido p
JOIN pedido_detalhe pd ON p.codigo = pd.pedido
JOIN curso c ON pd.curso = c.codigo;

/*
Exiba uma lista com o código e data e hora dos pedidos, nome 
do aluno e os títulos dos cursos de cada pedido
*/
SELECT p.codigo AS pedido, a.aluno, c.curso, p.data_hora FROM pedido p
JOIN aluno a ON a.codigo = p.aluno
JOIN pedido_detalhe pd ON pd.pedido = p.codigo
JOIN curso c ON c.codigo = pd.curso;

/* ========== Exercício 2 ========== */

/*
Crie uma visão que traga o título e preço somente dos cursos
de programação da Softblue
*/
CREATE VIEW cursos_programacao AS SELECT c.codigo, c.curso, t.tipo FROM curso c 
JOIN tipo t ON t.codigo = c.tipo WHERE t.tipo = "Programação";
SELECT * FROM cursos_programacao;

/* 
Crie uma visão que traga os títulos dos cursos, tipo do 
curso e nome do instrutor
*/
CREATE VIEW cursos_programacao_instrutor AS SELECT c.curso, t.tipo, i.instrutor FROM curso c
JOIN tipo t ON t.codigo = c.tipo
JOIN instrutor i ON i.codigo = c.instrutor
WHERE t.tipo = "Programação";
SELECT * FROM cursos_programacao_instrutor;

/*
Crie uma visão que exiba os pedidos realizados, informando
o nome do aluno, data e código do pedido
*/
CREATE VIEW pedidos_alunos AS SELECT p.codigo, a.aluno, p.data_hora FROM pedido p
JOIN aluno a ON a.codigo = p.aluno;
SELECT * FROM pedidos_alunos;
