/*TriggerDeAuditoria*/

/*olhar uma tabela, dizer quando um produto foi deletado, alterado, gravar o valor da alteracao no preco do produto*/

drop database backuploja;

drop database loja;

CREATE TABLE produto(
idproduto int primary key auto_increment,
nome varchar(30),
valor float(10,2)
);

INSERT INTO PRODUTO VALUES (NULL, 'Colchão', 60.49);
INSERT INTO PRODUTO VALUES (NULL,'ARMARIO', 190.49);
INSERT INTO PRODUTO VALUES (NULL,'cama', 400.49);
INSERT INTO PRODUTO VALUES (NULL,'mesa', 100.49);
INSERT INTO PRODUTO VALUES (NULL,'toalha', 50.49);
INSERT INTO PRODUTO VALUES (NULL,'Guarda-roupa', 160.49);


create database backuploja;

use backuploja;

/* SELECIONA A DATA E A HORA*/ /* QUANDO */
select now();

/*mostra o USUARIO QUE ESTOU LOGADO E QUAL MAQUINA EU ESTOU*/ /*QUEM*/
select current_user();

CREATE TABLE backupproduto(
idbackupproduto int primary key auto_increment,
id_produto int,
nome varchar(30),
valor_original float(10,2),
valor_alterado float(10,2),
data datetime,
usuario varchar(30),
evento char(1)
);

delimiter $
CREATE TRIGGER AUDIT_PRODUTO
AFTER UPDATE ON produto
for each row
begin
	insert into backuploja.backupproduto VALUES(null,OLD.idproduto,OLD.nome,OLD.valor,NEW.valor,NOW(),CURRENT_USER(),'U');
end
$

update produto set valor = 500.00 where idproduto = 6;

select * from backuploja.backupproduto;