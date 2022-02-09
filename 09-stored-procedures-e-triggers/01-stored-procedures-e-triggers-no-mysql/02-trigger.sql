USE curso_sql;

CREATE TABLE estoque (
	id INT UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id)
);

/*
Cria um gatilho que será executado antes de inserções
na tabela estoque, e para cada linha de inserção, seja
chamada a Stored Procedure limpa_pedidos.
*/
CREATE TRIGGER gatilho_limpa_pedidos
BEFORE INSERT 
ON estoque
FOR EACH ROW
CALL limpa_pedidos;

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 1000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player', 300);

/* A geladeira fica paga */
UPDATE pedidos SET pago = 1 WHERE descricao = 'Geladeira';

SELECT * FROM pedidos;

/* Antes da inserção, serão limpados todos os pedidos que não foram pagos. */
INSERT INTO estoque (descricao, quantidade) VALUES ('Forno', 3);

SELECT * FROM estoque;
