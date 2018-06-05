/*DML Alterando A estrutura das tabelas*/
use banco;
create table cliente(
idcliente int,
nomecliente VARCHAR(30) ,
cpfcliente varchar(13),
tipocliente char(1)
);

create table conta(
idconta int,
nomeconta varchar(30),
tipoconta int(10)
);


create table clienteconta(
id_cliente int,
id_conta int
);

create table tipoconta(
id_conta int (10),
nometipoconta varchar(30),
ieativo int (1)
);

create table movimentacao(
idcliente int (10),
idconta int (10),
dtmovimentacao date,
ds_movimentacao varchar(20)
);

ALTER TABLE cliente ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY (idcliente);/**/

ALTER TABLE movimentacao ADD CONSTRAINT PK_MOVIMENTACAO
PRIMARY KEY (dtmovimentacao);
ALTER TABLE movimentacao DROP CONSTRAINT PK_MOVIMENTACAO;


ALTER TABLE movimentacao ADD CONSTRAINT PK_CLIENTECONTA_MOVIMENTACAO
PRIMARY KEY (idcliente,idconta) REFERENCES clienteconta(id_cliente, id_conta);

ALTER TABLE movimentacao ADD CONSTRAINT FK_CLIENTECONTA_MOVIMENTACAO
FOREIGN KEY (idcliente,idconta) REFERENCES clienteconta(id_cliente, id_conta);


ALTER TABLE clienteconta ADD CONSTRAINT PK_CLIENTECONTA
PRIMARY KEY (id_cliente, id_conta) REFERENCES ;/**/

ALTER TABLE clienteconta ADD CONSTRAINT FK_CLIENTE_CLIENTECONTA
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);/**/

ALTER TABLE clienteconta ADD CONSTRAINT FK_MOVIMENTACAO_CLIENTECONTA
FOREIGN KEY (id_conta) references movimentacao(idconta);

ALTER TABLE CONTA add constraint PK_CONTA
PRIMARY KEY (IDCONTA);/**/

ALTER TABLE CONTA add constraint FK_MOVIMENTACAO_CONTA
FOREIGN KEY (id_conta) references movimentacao(idconta);

ALTER TABLE banco.movimentacao   
DROP CONSTRAINT pk_MOVIMENTACAO;

ALTER TABLE movimentacao DROP CONSTRAINT FK_CLIENTECONTA_MOVIMENTACAO;


/*03 select */

select salary from employes where salary between 1000 and 2000;

select *

