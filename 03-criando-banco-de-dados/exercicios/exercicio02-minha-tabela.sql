/* Criado o banco de dados */
CREATE DATABASE exercicio_curso_sql;

USE exercicio_curso_sql;

/* Definindo a estrutura do banco de dados */
CREATE TABLE tipos (
	id TINYINT UNSIGNED AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE instrutores (
	id SMALLINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    telefone VARCHAR(15),
    PRIMARY KEY (id)
);

CREATE TABLE alunos (
	id INT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE cursos (
	id INT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    preco FLOAT UNSIGNED DEFAULT 0,
    tipo_id TINYINT UNSIGNED NOT NULL,
    instrutor_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_tipo_id FOREIGN KEY (tipo_id) REFERENCES tipos (id),
    CONSTRAINT fk_instrutore_id FOREIGN KEY (instrutor_id) REFERENCES instrutores (id)
);

CREATE TABLE matriculas (
	aluno_id INT UNSIGNED NOT NULL,
    curso_id INT UNSIGNED NOT NULL,
    compra_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_alunos_id FOREIGN KEY (aluno_id) REFERENCES alunos (id),
	CONSTRAINT fk_cursos_id FOREIGN KEY (curso_id) REFERENCES cursos (id),
	CONSTRAINT fk_compra_id FOREIGN KEY (compra_id) REFERENCES compras (id),
    PRIMARY KEY (aluno_id, curso_id)
);

CREATE TABLE compras (
	id INT UNSIGNED AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    PRIMARY KEY (id)
);

/* 
Inclua a coluna DATA_NASCIMENTO na tabela ALUNOS do 
tipo string, de tamanho 10 caracteres.
*/
ALTER TABLE alunos ADD data_nascimento VARCHAR(10);
DESCRIBE alunos;

/*
Altere a coluna DATA_NASCIMENTO para nascimento e seu tipo para DATE.
*/
ALTER TABLE alunos CHANGE COLUMN data_nascimento nascimento DATE NOT NULL;
ALTER TABLE alunos CHANGE COLUMN nascimento nascimento DATE NOT NULL;

/*
Crie um novo índice na tabela ALUNO, para o campo ALUNO;
*/
CREATE INDEX alunos ON alunos(nome);

/*
Inclua o campo EMAIL na tabela INSTRUTORES, com tamanho de 100 
caracteres.
*/
ALTER TABLE instrutores ADD email VARCHAR(100);
DESCRIBE instrutores;

/*
Crie um novo índice na tabela CURSOS, para o campo INSTRUTOR.
*/
CREATE INDEX instrutores ON instrutores(nome);

/*
Remova o campo EMAIL na tabela INSTRUTORES.
*/
ALTER TABLE instrutores DROP COLUMN email;
