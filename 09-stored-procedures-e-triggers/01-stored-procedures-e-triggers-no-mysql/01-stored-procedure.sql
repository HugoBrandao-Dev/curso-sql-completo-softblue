USE curso_sql;

CREATE TABLE pedidos (
	id INT UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    valor FLOAT NOT NULL DEFAULT 0,
    pago TINYINT DEFAULT 0,
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 1000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player', 300);

SELECT * FROM pedidos;

/* Chama uma Stored Procedure que limpa os pedidos que não foram pagos */
CALL limpa_pedidos();

