/*
Cria um novo usuário, cujo acesso é aceito a partir de uma
máquina que tenha um determinado IP.

CREATE USER 'dinorá'@'201.210.100.50' IDENTIFIED BY 'dinora@123';
*/

/*
Cria um usuário, cujo acesso é aceito de qualquer lugar, 
desde que o usuário e senha estejam corretos.

CREATE USER 'josias'@'%' IDENTIFIED BY 'josias321';
*/

/* ==================== USUÁRIO TOBIAS ==================== */

/*
Cria um novo usuário, cujo acesso é aceito somente a partir
da máquina local (servidor).
*/
CREATE USER 'tobias'@'localhost' IDENTIFIED BY 'tobias_123';

/*
Cria um usuário tobias, que tem acesso de qualquer localidade (%).
*/
CREATE USER 'tobias'@'%' IDENTIFIED BY 'tobias_123';

/*
Vê quais usuários estão cadastrados no banco de dados.
*/
SELECT USER FROM mysql.user;

/*
Agora, o usuário tobias@% tem acesso a TODAS as operações dentro
do banco de dados.
*/
GRANT ALL ON curso_sql.* TO 'tobias'@'localhost';

/*
Vê quais são os níveis de acessos do usuário tobias@localhost.
*/
SHOW GRANTS FOR 'tobias'@'localhost';

/*
Quando o usuário tobias@% acessar o banco de dados de outros
dispositivos, ele somente poderá LER os dados cadastrados
no banco de dados.
*/
GRANT SELECT ON curso_sql.* TO 'tobias'@'%';

/*
Agora, quando o usuário tobias@% acessar o banco de dados de outros
dispositivos, ele somente poderá INSERIR dados somente na tabela
funcionarios.
*/
GRANT INSERT ON curso_sql.funcionarios TO 'tobias'@'%';

/*
Retira do usuário tobias@% o acesso a operação de INSERÇÃO de dados 
dentro da tabela funcionarios.
*/
REVOKE INSERT ON curso_sql.funcionarios FROM 'tobias'@'%';

/*
Retira do usuário tobias@% o acesso a operação de LEITURA de dados 
dentro do banco de dados.
*/
REVOKE SELECT ON curso_sql.* FROM 'tobias'@'%';

/*
Quando o usuário tobias@% acessar o banco de dados de outros
dispositivos, ele somente poderá LER os dados cadastrados
na tabela funcionarios.
*/
GRANT SELECT ON curso_sql.funcionarios TO 'tobias'@'%';

/*
Quando o usuário tobias@% acessar o banco de dados de outros
dispositivos, ele somente poderá LER os dados cadastrados
na tabela veiculos.
*/
GRANT SELECT ON curso_sql.veiculos TO 'tobias'@'%';

/*
Retira do usuário tobias@% o acesso a operação de LEITURA de
dados dentro da tabela funcionarios.
*/
REVOKE SELECT ON curso_sql.funcionarios FROM 'tobias'@'%';

/*
Retira do usuário tobias@% o acesso a operação de LEITURA de
dados dentro da tabela veiculos.
*/
REVOKE SELECT ON curso_sql.veiculos FROM 'tobias'@'%';

/*
Retira do usuário tobias@localhost o acesso a todas as operações de
dentro do banco de dados.
*/
REVOKE ALL ON curso_sql.* FROM 'tobias'@'localhost';

/*
Exclui o usuário tobias@% que pode acessar o banco de qualquer
dispositivo.
*/
DROP USER 'tobias'@'%';

/*
Exclui o usuário tobias@localhost que pode só pode acessar o banco a
partir do servidor.
*/
DROP USER 'tobias'@'localhost';
