/*ORGANIZAÇÃO DE CHAVES CONTRAINT REGRA-> A CHAVE É UMA REGRA DE ENTIDADE REFERENCIAL*/
CREATE TABLE JOGADOR (
idjogador INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (30)
);

CREATE TABLE times (
idtimes INT PRIMARY KEY AUTO_INCREMENT,
nometime VARCHAR(30),
id_jogador INT,
FOREIGN KEY (id_jogador)
REFERENCES jogador(idjogador)
);

INSERT INTO jogador VALUES (NULL, 'Garrincha');
INSERT INTO times VALUES (NULL, 'Brasil',1);

CREATE TABLE cliente (
idcliente INT,
nome VARCHAR(30)
);

CREATE TABLE telefone (
idtelefone INT,
tipo CHAR (3) NOT NULL,
numero VARCHAR(10) NOT NULL,
id_cliente INT
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY (IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE /*ADD CONSTRAIND FK_A TABELA CLIENTE - A TABELA TELEFONE*/
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (IDCLIENTE);

/*DICIONARIO DE DADOS É UM META DADO = DADOS DOS DADOS -> DADOS ORGANIZADORES*/

/*ENSINANDO A PROCURAR CONSTRAINT*/
SHOW DATABASES;
USE information_schema;/*conectando ao information schema*/

SHOW TABLES;

DESC table_constraints;

SELECT  CONSTRAINT_SCHEMA AS "banco",
	TABLE_NAME AS "tabela",
	constraint_name AS "nome da regra",
	CONSTRAINT_TYPE AS "tipo"
FROM table_constraints WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

/*apagando constraints*/
ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;