/* Exercícios Propostos*/

USE exercicio_curso_sql;

/* =================== Exercício 1 =================== */

/* Inserir dados na tabela TIPO */
INSERT INTO tipo (tipo) VALUES ("Banco de dados");
INSERT INTO tipo (tipo) VALUES ("Programação");
INSERT INTO tipo (tipo) VALUES ("Modelagem de dados");

/* Inserir dados na tabela INSTRUTOR */
INSERT INTO instrutor (instrutor, telefone) VALUES ("André Milani", "1111-1111");
INSERT INTO instrutor (instrutor, telefone) VALUES ("Carlos Tosin", "2222-2222");

/* Inserir dados na tabela CURSO */
INSERT INTO curso (curso, valor, tipo, instrutor) VALUES ("Java Fundamentos", 270, 2, 2);
INSERT INTO curso (curso, valor, tipo, instrutor) VALUES ("Java Avançado", 330, 2, 2);
INSERT INTO curso (curso, valor, tipo, instrutor) VALUES ("SQL Completo", 170, 1, 1);
INSERT INTO curso (curso, valor, tipo, instrutor) VALUES ("PHP Básico", 270, 2, 1);

/* Inserir dados na tabela ALUNOS */
INSERT INTO aluno (aluno, endereco, email) VALUES ("José", "Rua XV de Novembro 72", "jose@softblue.com.br");
INSERT INTO aluno (aluno, endereco, email) VALUES ("Wagner", "Av. Paulista", "wagner@softblue.com.br");
INSERT INTO aluno (aluno, endereco, email) VALUES ("Emílio", "Rua Lajes 103, ap: 701", "emilio@softblue.com.br");
INSERT INTO aluno (aluno, endereco, email) VALUES ("Cris", "Rua Tauney 22", "cris@softblue.com.br");
INSERT INTO aluno (aluno, endereco, email) VALUES ("Regina", "Rua Salles 305", "regina@softblue.com.br");
INSERT INTO aluno (aluno, endereco, email) VALUES ("Fernando", "Av. Central 30", "fernando@softblue.com.br");

/* Inserir dados na tabela PEDIDO */
INSERT INTO pedido (aluno, data_hora) VALUES (2, "2010-04-15 11:23:32");
INSERT INTO pedido (aluno, data_hora) VALUES (2, "2010-04-15 14:36:21");
INSERT INTO pedido (aluno, data_hora) VALUES (3, "2010-04-16 11:17:45");
INSERT INTO pedido (aluno, data_hora) VALUES (4, "2010-04-17 14:27:22");
INSERT INTO pedido (aluno, data_hora) VALUES (5, "2010-04-18 11:18:19");
INSERT INTO pedido (aluno, data_hora) VALUES (6, "2010-04-19 13:47;35");
INSERT INTO pedido (aluno, data_hora) VALUES (6, "2010-04-20 18:13:44");

/* Inserir dados na tabela PEDIDO_DETALHES */
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (1, 1, 270);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (1, 2, 330);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (2, 1, 270);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (2, 2, 330);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (2, 3, 170);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (3, 4, 270);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (4, 2, 330);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (4, 4, 270);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (5, 3, 170);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (6, 3, 170);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (7, 4, 270);

/* =================== Exercício 2 =================== */

/* Exibir todas as informações de todos os alunos */
SELECT * FROM aluno;

/* Exibir somente o título de cada curso da Softblue */
SELECT tipo FROM tipo;

/* Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200 */
SELECT curso, valor FROM curso WHERE valor > 200;

/* Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200 e menor que 300 */
SELECT curso, valor FROM curso WHERE valor > 200 AND valor < 300;

/* Exibir as informações da tabela pedidos para os pedidos realizados entre 15/14/2010 e 18/04/2010 */
/* Aparentemente, o = não funciona para datas*/
SELECT * FROM pedido WHERE data_hora > "2010-04-15 00:00:00" AND data_hora < "2010-04-18 23:59:59";

/* Exibir as informações da tabela pedidos para os pedidos realizados na data de 15/04/2010 */
SELECT * FROM pedido WHERE data_hora > "2010-04-15 00:00:00" AND data_hora < "2010-04-15 23:59:59";

/* =================== Exercício 3 =================== */

/* Altere o endereço do aluno José para 'Av. Brasil 778' */
UPDATE aluno SET endereco = "Av. Brasil 778" WHERE aluno = "José";
SET SQL_SAFE_UPDATES = 0;

/* Altere o email do aluno Cris para "cristiano@softblue.com.br" */
UPDATE aluno SET email = "cristiano@softblue.com.br" WHERE aluno = "Cris";

/* Aumente em 10% o valor dos cursos abaixo de 300 */
UPDATE curso SET valor = valor * 1.3 WHERE valor < 300;

/* Altere o nome do curso de PHP Básico para PHP fundamentos */
UPDATE curso SET curso = "PHP Fundamentos" WHERE curso = "PHP Básico";