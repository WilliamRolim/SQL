/*06Inserindo, alterando, excluindo registros e recuperando informações no banco de dados*/
CREATE DATABASE BANCOAULASEIS;

USE BANCOAULASEIS;

CREATE TABLE cliente (
cd_cliente int(10),
nm_cliente varchar(30),
ie_cpf_cnpj varchar(15),
id_tipocliente char(1),
CONSTRAINT Cliente_cd_cliente_pk PRIMARY KEY (cd_cliente),
CONSTRAINT Cliente_cd_cliente_u UNIQUE (ie_cpf_cnpj)
);

CREATE TABlE tipoconta(
cd_tipoconta int(10),
nm_tipoconta varchar(30),
ie_ativo int(1),
CONSTRAINT Tipoconta_cdtipoconta_PK PRIMARY KEY (cd_tipoconta),
CONSTRAINT Tipoconta_nmtipoconta_U UNIQUE(nm_tipoconta)
);

CREATE TABLE conta(
cd_conta int(10),
nm_conta varchar(30),
cd_tipoconta int(10),
CONSTRAINT Conta_cd_conta_PK PRIMARY KEY (cd_conta),
CONSTRAINT Conta_nm_conta_U UNIQUE(nm_conta),
CONSTRAINT Conta_Tipoconta_cdtipoconta_FK FOREIGN key (cd_tipoconta)
REFERENCES tipoconta(cd_tipoconta)
);

 CREATE TABLE clienteconta(
cd_cliente int(10),
cd_conta int(10),
CONSTRAINT Clienteconta_cdcliente_cdconta_PK PRIMARY KEY (cd_cliente,cd_conta),
CONSTRAINT Clienteconta_Cliente_FK FOREIGN KEY (cd_cliente)
REFERENCES cliente (cd_cliente),
CONSTRAINT Clienteconta_Conta_FK FOREIGN KEY (cd_conta)
REFERENCES conta (cd_conta)
);


CREATE TABLE movimentacao(
cd_cliente int(10),
cd_conta int (10),
dt_movimentacao DATE,
ds_movimentacao VARCHAR(20),
CONSTRAINT Movimentacao_cdcliente_cdconta_dtmovimentacao_PK PRIMARY KEY (cd_cliente,cd_conta,dt_movimentacao),
CONSTRAINT Movimentacao_Clienteconta_FK FOREIGN KEY (cd_cliente, cd_conta)REFERENCES clienteconta(cd_cliente,cd_conta) 
);

CREATE TABLE tb_pais (
cd_pais int (2), 
nm_pais varchar (25), 
ds_nacionalidade varchar(25), 
constraint pais_cd_pais_pk primary key (cd_pais), 
constraint pais_nm_pais_uk unique(nm_pais)
);

INSERT INTO tb_pais VALUES (1, "Italia", "Italiana");
INSERT INTO tb_pais VALUES (2, "Brasil", "Brasileira");
INSERT INTO tb_pais VALUES (3, "Angola", "Angolana");
INSERT INTO tb_pais VALUES (4, "Alemanha", "Alemanha");
INSERT INTO tb_pais VALUES (5, "Holanda", "Holandes");
INSERT INTO tb_pais VALUES (6, "232323", "232323");
INSERT INTO tb_pais VALUES (7,"3232323", "324932");
INSERT INTO tb_pais VALUES (8, "132323", "182323");
INSERT INTO tb_pais VALUES (9,"5232323", "723232");
INSERT INTO tb_pais VALUES (10,"Konoha", "Konohiano");/*esse foi deletado*/
INSERT INTO tb_pais VALUES (10,"Venezuela", "Venezuelano");

/*Comando update*/
UPDATE tb_pais SET nm_pais = "Argentina",ds_nacionalidade = "Argentino" WHERE cd_pais = 6;
UPDATE tb_pais SET nm_pais = "Hungria",ds_nacionalidade="Hungaro" WHERE cd_pais = 7;
UPDATE tb_pais SET nm_pais = "CUBA", ds_nacionalidade ="CUBANO" WHERE cd_pais = 8;
UPDATE tb_pais SET nm_pais="America", ds_nacionalidade = "Americano" WHERE cd_pais = 9;


delete from tb_pais where id=10;
DELETE FROM tb_pais WHERE cd_pais = 10;

INSERT INTO cliente VALUES ("1111","Amanda Brito", "001.333.222-22", "J");
INSERT INTO cliente VALUES ("2222","Joana Prado", "201.444.222-22", "F");
INSERT INTO cliente VALUES ("3333","Nana Gouveia", "301.441.222-22", "F");
INSERT INTO cliente VALUES ("4444","Emilio Santiago", "501.111.222-22", "J");
INSERT INTO cliente VALUES ("5555","Pedro Romeu", "501.611.222-22", "J");
INSERT INTO cliente VALUES ("6666","Clara Nunes", "601.751.222-22", "F");
INSERT INTO cliente VALUES ("7777","Romeu Thuma", "701.617.222-22", "J");
INSERT INTO cliente VALUES ("8888","Edilsons do nascimento", "801.641.422-22", "J");
INSERT INTO cliente VALUES ("9999","Edson Arantes", "901.364.222-22", "F");
INSERT INTO cliente VALUES ("1212","Marilia Lima", "111.156.222-22", "J");
INSERT INTO cliente VALUES ("1313","Pedro de Karma", "120.311.222-22", "F");

INSERT INTO tipoconta VALUES("9999","Corrente",0);
INSERT INTO tipoconta VALUES("8888","Poupanca",1);
INSERT INTO tipoconta VALUES("7777","Bradesco Universitário",2);
INSERT INTO tipoconta VALUES("6666","Beneficiário do INSS",3);
INSERT INTO tipoconta VALUES("5555","Conta-Salário",4);
INSERT INTO tipoconta VALUES("4444","Conta Internacional",0);
INSERT INTO tipoconta VALUES("3333","Conta Nacional",5);
INSERT INTO tipoconta VALUES("2222","Itau Universitário",6);
INSERT INTO tipoconta VALUES("1111","Brasileira",7);
INSERT INTO tipoconta VALUES("1010","Prioritaria",0);
INSERT INTO tipoconta VALUES("1717","Secreta",0);

 select cliente.cd_cliente, conta.cd_conta From cliente conta;
 

INSERT INTO clienteconta VALUES (1111,111111);
INSERT INTO clienteconta VALUES (1212,222222);
INSERT INTO clienteconta VALUES (1313,333333);
INSERT INTO clienteconta VALUES (3333,444444);
INSERT INTO clienteconta VALUES (4444,555555);
INSERT INTO clienteconta VALUES (5555,666666);
INSERT INTO clienteconta VALUES (6666,777777);
INSERT INTO clienteconta VALUES (7777,888888);

/*NÃO INSERIDOS*/
INSERT INTO clienteconta VALUES (8888,"1111");
INSERT INTO clienteconta VALUES (9999,"1010");
INSERT INTO clienteconta VALUES ("1313","1717");
/*NÃO INSERIDOS*/


INSERT INTO CONTA VALUES (111111, "William Rolim",9999);
INSERT INTO CONTA VALUES (222222, "Jocelia Mordo",7777);
INSERT INTO CONTA VALUES (333333, "Mariclelia Meire",6666);
INSERT INTO CONTA VALUES (444444, "Antares Tropes",5555);
INSERT INTO CONTA VALUES (555555, "Apollo Vinte Um",4444);
INSERT INTO CONTA VALUES (666666, "Fabiana Souza",3333);
INSERT INTO CONTA VALUES (777777, "Carolina Andradia",2222);
INSERT INTO CONTA VALUES (888888, "Eudileuza Junior",1111);
INSERT INTO CONTA VALUES (999999, "Carlos Adao",1212);
INSERT INTO CONTA VALUES (999999, "Thicholina ",1313);


INSERT INTO movimentacao VALUES(1111,111111,'2018/01/01','2018/05/2013');
INSERT INTO movimentacao VALUES(1212,222222,'2017/12/03','2018/01/13');
INSERT INTO movimentacao VALUES(2222,333333,'2018/01/01','2018/05/13');
INSERT INTO movimentacao VALUES(3333,444444,'2018/01/01','2018/05/14');
INSERT INTO movimentacao VALUES(4444,555555,'2014/01/01','2015/05/12');
INSERT INTO movimentacao VALUES(5555,666666,'2018/01/01','2018/05/13');
INSERT INTO movimentacao VALUES(6666,777777,'2015/01/01','2016/07/13');
INSERT INTO movimentacao VALUES(7777,888888,'2018/01/01','2018/05/13');
                                  

/*Selecionar todos os clientes que são do tipo Júridico.*/
SELECT * from cliente where id_tipocliente="J" ORDER BY nm_cliente;

/*Selecionar o nome e o Cpf/Cnpj do cliente comece com a letra “P”.*/
SELECT nm_cliente, ie_cpf_cnpj FROM cliente WHERE nm_cliente LIKE '%P';

/*Selecionar os movimentos (todos os campos) cujo a data de movimento ocorreu entre ‘01/01/2018’ e ’13/05/2018’*/
SELECT * FROM movimentacao WHERE dt_movimentacao BETWEEN '2018/01/01' and '2018/05/13';

/*Selecionar os nome do cliente onde o tipo do cliente é diferente do Tipo Júridico*/
SELECT nm_cliente,id_tipocliente FROM cliente WHERE id_tipocliente <> 'J';

/*Atualize para um o campo ie_ativo para as tipos contas onde o valor esteja zero. */
UPDATE tipoconta SET ie_ativo = 1 WHERE ie_ativo = 0;

/*Excluir toda a movimentação do movimento da conta 2, cliente 3 onde a data de movimentação seja maior do que ‘02/02/2018’*/
DELETE 
delete * FROM cliente WHERE conta = 2 and id_cliente = 3 AND DATE(inicio) >= DATE(NOW())














