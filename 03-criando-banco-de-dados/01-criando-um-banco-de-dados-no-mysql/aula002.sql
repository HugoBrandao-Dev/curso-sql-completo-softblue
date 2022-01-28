/* Cria um banco de dados */
CREATE DATABASE curso_sql;

/* Informa qual banco de dados usaremos */
USE curso_sql;

/* Cria uma tabela para o banco de dados corrente */
CREATE TABLE funcionarios(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    salario DOUBLE NOT NULL DEFAULT '0',
    departamento VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE veiculos(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    funcionario_id INT UNSIGNED DEFAULT NULL,
    veiculo VARCHAR(45) NOT NULL DEFAULT '',
    placa VARCHAR(10) NOT NULL DEFAULT '',
    PRIMARY KEY (id),
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
);

CREATE TABLE salarios(
	faixa VARCHAR(45) NOT NULL,
    inicio DOUBLE UNSIGNED NOT NULL,
    fim DOUBLE UNSIGNED NOT NULL,
    PRIMARY KEY (faixa)
);

/* Altera a estrutura da tabela funcionarios, neste caso o nome da coluna "nome" para "nome_func" */
ALTER TABLE funcionarios CHANGE COLUMN nome nome_func VARCHAR(50) NOT NULL;
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome VARCHAR(45) NOT NULL;

/* Exclui a tabela (operação irreversível) */
DROP TABLE salarios;

/* Cria um índice para o campo "departamento" da tabela "funcionarios" */
CREATE INDEX departamentos ON funcionarios (departamento);

/* Cria um índice somente com os três primeiros caracteres do campo "nome" de cada registro de "funcionarios" */
CREATE INDEX nomes ON funcionarios (nome(3));
