USE exercicio_curso_sql;

/*
Construa uma transação que atualiza o valor aplicado em cada
conta bancária baseado no índice de correção percentual de 3%,
garantindo que a instrução de UPDATE seja realizada na tabela
toda, com as propriedades ACID.
*/

CREATE TABLE conta_bancaria (
	codigo INT UNSIGNED AUTO_INCREMENT,
    titular VARCHAR(45) NOT NULL,
    saldo FLOAT NOT NULL,
    PRIMARY KEY (codigo)
);

INSERT INTO conta_bancaria (titular, saldo) VALUES ('Tobias', 213);
INSERT INTO conta_bancaria (titular, saldo) VALUES ('Dinorá', 489);
INSERT INTO conta_bancaria (titular, saldo) VALUES ('Josias', 568);
INSERT INTO conta_bancaria (titular, saldo) VALUES ('Doralice', 712);
INSERT INTO conta_bancaria (titular, saldo) VALUES ('Jeremias', -38);
SELECT * FROM conta_bancaria;

/* Atualiza o saldo para TODOS os clientes, até para os negativos.  */
START TRANSACTION;
UPDATE conta_bancaria SET saldo = saldo * 1.03;
COMMIT;

SET sql_safe_updates = 0;
ROLLBACK;

/* Atualiza o saldo somente se ele for positivo. */
START TRANSACTION;
UPDATE conta_bancaria SET saldo = saldo * 1.03 WHERE saldo > 0;
COMMIT;
