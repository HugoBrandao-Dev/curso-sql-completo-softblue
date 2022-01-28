CREATE DATABASE exercicio_curso_sql;

USE exercicio_curso_sql;

CREATE TABLE tipo (
	codigo INT UNSIGNED AUTO_INCREMENT /* =INTEGER -NOT NULL */,
    tipo VARCHAR(32) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE instrutor (
	codigo INT UNSIGNED AUTO_INCREMENT, /* =INTEGER -NOT NULL */
    instrutor VARCHAR(64) NOT NULL,
    telefone VARCHAR(15) NULL /* = VARCHAR(9) */,
    PRIMARY KEY (codigo)
);

CREATE TABLE curso (
	codigo INT UNSIGNED AUTO_INCREMENT /* =INTEGER -NOT NULL */,
    curso VARCHAR(50) NOT NULL /* VARCHAR(64) */,
    tipo INT UNSIGNED NOT NULL,
    instrutor INT UNSIGNED NOT NULL,
    valor FLOAT NOT NULL DEFAULT 0 /* = DOUBLE + DEFAULT 0*/,
    FOREIGN KEY (tipo) REFERENCES tipo (codigo),
    FOREIGN KEY (instrutor) REFERENCES instrutor (codigo),
    INDEX fk_tipo (tipo),
    INDEX fk_instrutor (instrutor),
    PRIMARY KEY (codigo)
);

CREATE TABLE aluno (
	codigo INT UNSIGNED AUTO_INCREMENT /* =INTEGER -NOT NULL */,
    aluno VARCHAR(64) NOT NULL,
    endereco VARCHAR(100) NOT NULL /* = VARCHAR(230) */,
    email VARCHAR(100) NOT NULL /* = VARCHAR(128)*/,
    PRIMARY KEY (codigo)
);

CREATE TABLE pedido (
	codigo INT UNSIGNED AUTO_INCREMENT /* =INTEGER -NOT NULL */,
    aluno INT UNSIGNED NOT NULL,
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (aluno) REFERENCES aluno (codigo),
    INDEX fk_aluno (aluno),
    PRIMARY KEY (codigo)
);

CREATE TABLE pedido_detalhe (
	pedido INT UNSIGNED NOT NULL /* =INTEGER */,
    curso INT UNSIGNED NOT NULL /* =INTEGER */,
    valor FLOAT NOT NULL,
    FOREIGN KEY (pedido) REFERENCES pedido (codigo),
    FOREIGN KEY (curso) REFERENCES curso (codigo),
    PRIMARY KEY (pedido, curso)
);