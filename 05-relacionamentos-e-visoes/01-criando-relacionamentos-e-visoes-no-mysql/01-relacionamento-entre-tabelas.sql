USE curso_sql;

SELECT * FROM funcionarios;
SELECT * FROM veiculos;

/*
Busca por todos os registros onde o id da primeira seja igual ao funcionario_id
da segunda tabela.
*/
SELECT * FROM funcionarios f INNER JOIN veiculos v ON f.id = v.funcionario_id;

/*
Busca por todos os registros onde o id da primeira seja igual ao funcionario_id
da segunda tebela, mas também traz registros da PRIMEIRA tabela que NÃO satisfaçam
a condição.
*/
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON f.id = v.funcionario_id;

/*
Inserido um novo registro na tabela veiculo, sem especificar o 
funcionario_id, para que o possamos ver o funcionamento do RIGHT JOIN.
*/
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (NULL, "Moto", "SB-0003");

/*
Busca por todos os registros onde o id da primeira seja igual ao funcionario_id
da segunda tebela, mas também traz registros da SEGUNDA tabela que NÃO satisfaçam
a condição.
*/
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON f.id = v.funcionario_id;

/*
Busca por todos os registros onde o id da primeira seja igual ao funcionario_id
da segunda tebela, mas também traz registros da PRIMEIRA e da SEGUNDA tabela 
que NÃO satisfaçam a condição.
OBS: O MySQL não tem um comando próprio para o FULL JOIN, sendo necessário
combinar o LEFT JOIN e o RIGHT JOIN com o UNION.
*/
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON f.id = v.funcionario_id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON f.id = v.funcionario_id;

/*
Cria uma nova tabela para ver o funcionamento do Equi Join.
OBS: Com a presente chave extrangeira, é impossível inserir um novo cpf se
a tabela funcionario não tiver um id que seja igual ao id do cpf (um 
depende do outro).
*/
CREATE TABLE cpfs(
	id INT UNSIGNED NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_funcionario_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

/*
Inserir alguns registros na tabela cpfs, para ver o funcionamento 
do Equi Join.
*/
INSERT INTO cpfs (id, cpf) VALUES (1, "111.111.111-11");
INSERT INTO cpfs (id, cpf) VALUES (2, "222.222.222-22");
INSERT INTO cpfs (id, cpf) VALUES (3, "333.333.333-33");
INSERT INTO cpfs (id, cpf) VALUES (5, "555.555.555-55");

/* Busca por todos os valores dentro da nova tabela cpfs. */
SELECT * FROM cpfs;

/* 
Exemplo de Equi Join, faz a busca em ambas a tabela por
campo de mesmo nome (não precisa referenciar duas vezes).
*/
SELECT * FROM funcionarios f INNER JOIN cpfs c USING(id);

/*
Tabela criada para ver o funcionamento do Self Join
*/
CREATE TABLE clientes(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    quem_indicou INT UNSIGNED,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);

/*
Inserindo dados na tabela cliente para ver o exemplo do Self Join 
funcionar.
*/
INSERT INTO clientes (nome, quem_indicou) VALUES ("André", NULL);
INSERT INTO clientes (nome, quem_indicou) VALUES ("Samuel", 1);
INSERT INTO clientes (nome, quem_indicou) VALUES ("Carlos", 2);
INSERT INTO clientes (nome, quem_indicou) VALUES ("Rafael", 1);

/* Buscar todos os registro da tabela clientes. */
SELECT * FROM clientes;

/* Utilizando o Self join para busca por clientes e quem foi que os indicou. */
SELECT indicado.nome AS Cliente, indicou.nome AS "Indicado por" FROM clientes indicou JOIN clientes indicado ON indicou.id = indicado.quem_indicou;

/* Busca por funcionarios e seus CPFs, e somente quem possui veículo. */
SELECT f.nome, c.cpf, v.veiculo, v.placa  FROM funcionarios f
INNER JOIN cpfs c ON f.id = c.id
INNER JOIN veiculos v ON f.id = v.funcionario_id;
