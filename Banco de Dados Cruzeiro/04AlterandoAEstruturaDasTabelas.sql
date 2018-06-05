/*Estrutura de tabelas*/
Create DATABASE alterandoTabelas;

use alterandoTabelas;

create table notafiscal(
nrnota float,
idcliente float ,
dtemissao float,
ietiponota float,
ietributata float
);

create table itemnotafiscal(
nr_nota float,
nr_item float,
id_produto float,
qt_produto float,
vl_unitario float,
ds_observacao float
);

create table tipoproduto(
idtipoproduto float,
nometipoproduto float
);

create table empresa(
id_empresa float,
nm_empresa float,
nr_cnpj float
);

create table filial(
id_empresa float,
id_filial float,
nomeflial float
);

create table paises(
idpais float,
nomepais float,
dsnacionalidade float
);

/*alterando tabela e modificando campos*/

ALTER TABLE notafiscal 
MODIFY nrnota int,
MODIFY idcliente int not null,
MODIFY dtemissao DATE NOT NULL,
MODIFY ietiponota char(1),
MODIFY ietributata char(1),
ADD CONSTRAINT Notafiscal_nrnota_PK PRIMARY KEY (nrnota),
ADD CONSTRAINT Notafiscal_ietiponota_RN_CD CHECK (ietiponota in('C','D')),
ADD CONSTRAINT Notafiscal_ietributada_RN_TR CHECK (ietributata in ('S','N'));

ALTER TABLE itemnotafiscal
MODIFY nr_nota int(5),
MODIFY nr_item int(2),
MODIFY id_produto int (5),
MODIFY qt_produto float(10,3),
MODIFY vl_unitario float(8,2),
MODIFY ds_observacao varchar(30),
ADD CONSTRAINT Itemnotafiscal_PK PRIMARY KEY(nr_nota,nr_item),
ADD CONSTRAINT Notafiscal_nr_nota_FK FOREIGN KEY (nr_nota) 
REFERENCES notafiscal (nrnota);

ALTER TABLE tipoproduto 
MODIFY idtipoproduto int(3) not null,
MODIFY nometipoproduto varchar(30) not null,
ADD CONSTRAINT Tipoproduto_idtipoproduto_PK PRIMARY KEY (idtipoproduto),
ADD CONSTRAINT Tipoproduto_nometipoproduto_UN UNIQUE (nometipoproduto);

ALTER TABLE empresa 
MODIFY id_empresa  int(2),
MODIFY nm_empresa VARCHAR(30),
MODIFY nr_cnpj VARCHAR(15),
ADD CONSTRAINT Empresa_id_empresa_PK PRIMARY KEY (id_empresa);

ALTER TABLE filial
MODIFY id_empresa int(2),
MODIFY id_filial int(2),
MODIFY nomeflial VARCHAR(25),
ADD CONSTRAINT Filial_Empresa_FK FOREIGN KEY (id_empresa)
REFERENCES empresa (id_empresa);


ALTER TABLE paises
MODIFY idpais int(2),
MODIFY nomepais varchar(30),
MODIFY dsnacionalidade varchar(35),
ADD CONSTRAINT Paises_idpais_PK PRIMARY KEY (idpais);


	   









