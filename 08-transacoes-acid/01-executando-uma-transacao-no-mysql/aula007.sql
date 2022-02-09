USE curso_sql;

/*
Retorna os mecanísmos de armazenamento que o MySQL
oferece.
*/
SHOW ENGINES;

/*
Cria uma nova tabela, que usaremos para fazermos as
transações, e define o InnoDB como mecanísmo de 
armazenamento.
*/
CREATE TABLE contas_bancarias (
	id INT UNSIGNED AUTO_INCREMENT,
    titular VARCHAR(45) NOT NULL,
    saldo FLOAT NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO contas_bancarias (titular, saldo) VALUES ('Tobias', 1000);
INSERT INTO contas_bancarias (titular, saldo) VALUES ('Dinorá', 2000);
SELECT * FROM contas_bancarias;

/* Inicia uma transação */
START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
/* Volta os dados ao estado inicial (antes da transação iniciar). */
ROLLBACK;

/* Inicia uma transação */
START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
/*
Consolida os novos valores de dados dentro da tabela. Além disso
libera as tabelas para outras operações de transação.
*/
COMMIT;