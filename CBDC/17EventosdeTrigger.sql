/*Triggers para banco de backups*/

Create database loja;/*Criando o banco de dados*/

USE loja; /*usando o banco de dados*/


CREATE TABLE produto(
idproduto int primary key auto_increment,
nome varchar(30),
valor float(10,2)
);

create database backuploja;/*criando backuploja*/

use backuploja;/*usando backuploja*/


create table bkp_produto(
idbackup int primary key,
idproduto int,
nome varchar(30),
valor float (10,2)
);

/*utilizando outro banco diferente (x) dentro do banco y*/

INSERT INTO backuploja.bkp_produto VALUES(1,1,'sabonete', 10.90);

/*SELECIONANDO DE OUTRO BANC0*/

SELECT * FROM backuploja.bkp_produto;

/*INSERINDO CONTEUDO EM BANCO DE DADOS DIFERENTES COM TRIGGER*/

CREATE TRIGGER INSERINDO_NO_BACKUP 
BEFORE INSERT ON produto
	FOR EACH ROW
BEGIN
	INSERT INTO backuploja.bkp_produto VALUES (NULL, NEW.idproduto,NEW.nome,NEW.valor);
END
$

DELIMITER ;

/*deletando*/
CREATE TRIGGER INSERINDO_NO_BACKUP_DEL
AFTER DELETE ON produto
	FOR EACH ROW
BEGIN

	INSERT INTO backuploja.bkp_produto VALUES (NULL, OLD.idproduto,OLD.nome,OLD.valor);
END
$

DELIMITER ;


INSERT INTO PRODUTO VALUES (NULL, 'Colchão', 60.49);
INSERT INTO PRODUTO VALUES (NULL,'ARMARIO', 190.49);
INSERT INTO PRODUTO VALUES (NULL,'cama', 400.49);
INSERT INTO PRODUTO VALUES (NULL,'mesa', 100.49);
INSERT INTO PRODUTO VALUES (NULL,'toalha', 50.49);
INSERT INTO PRODUTO VALUES (NULL,'Guarda-roupa', 160.49);


ALTER TABLE BACKUPloja.bkp_produto
ADD evento CHAR (1);

DROP TRIGGER INSERINDO_NO_BACKUP_DEL;

CREATE TRIGGER backupproduto_del
BEFORE DELETE ON PRODUTO
FOR EACH ROW
	BEGIN
	INSERT INTO BKPLOJA.BKP_PRODUTO VALUES (NULL,OLD.idproduto,OLD.nome,OLD.valor,'d');/*'d' termo injessar*/
	END
	
$

/*Trigger inserindo INSERT NO BACKUP*/
CREATE TRIGGER backupproduto_insert
AFTER INSERT ON PRODUTO
FOR EACH ROW
	BEGIN
	INSERT INTO backuploja.bkp_produto VALUES (NULL,new.idproduto,new.nome,new.valor,'I');/*'inseriu termo enjessar*/
	END
	
$