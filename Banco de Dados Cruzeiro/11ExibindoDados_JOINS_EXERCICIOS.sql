CREATE DATABASE banco;

USE banco;

CREATE TABLE agencia (/*Terceira tabela a ser criada por ter FK porém a tabela estado já foi criada*/
id_banco INT,
id_agencia INT,
nm_agencia VARCHAR(10) NOT NULL,
nr_digito_agencia INT NOT NULL,
nr_endereco VARCHAR (15) NOT NULL,
id_cep CHAR(8) NOT NULL,
CONSTRAINT Agencia_idbanco_idagencia_PK PRIMARY KEY (id_banco,id_agencia),
CONSTRAINT Agencia_Logradouro_idcep_FK FOREIGN KEY (id_cep)
REFERENCES logradouro (id_cep),
CONSTRAINT Agencia_Banco_id_banco_FK FOREIGN KEY (id_banco)
REFERENCES banco(id_banco)
);

CREATE TABLE banco (/*primeira tabela a ser criada por não ter FK*/
id_banco INT,
nm_banco VARCHAR(20) NOT NULL,
CONSTRAINT Banco_idbanco_PK PRIMARY KEY (id_banco)
);

CREATE TABLE logradouro(/*QUarta tabela a ser criada por ter FK porém a tabela Municipio já foi criada*/
id_cep CHAR(8),
id_municipio INT ,
ds_tipo VARCHAR(10),
ds_titulo VARCHAR(14),
nm_nome VARCHAR(20) NOT NULL,
CONSTRAINT Logradouro_idcep_PK PRIMARY KEY (id_cep),
CONSTRAINT Lougradouro_Municipio_idmunicipio_FK FOREIGN KEY (id_municipio)
REFERENCES municipio(id_municipio)

);


CREATE TABLE municipio(/*Terceira tabela a ser criada por ter FK porém a tabela estado já foi criada*/
id_municipio INT,
id_uf CHAR(2) NOT NULL,
nm_municipio VARCHAR(15)NOT NULL,
CONSTRAINT Municipio_idmunicipio_PK PRIMARY KEY (id_municipio),
CONSTRAINT Municipio_Estado_iduf_FK FOREIGN KEY (id_uf)
REFERENCES estado (id_uf)
);

CREATE TABLE estado(/*segunda tabela a ser criada por não ter FK*/
id_uf CHAR(2),
nm_uf VARCHAR(10)NOT NULL,
CONSTRAINT Estado_iduf_PK PRIMARY KEY (id_uf)
);

CREATE TABLE correntista(/*Quinta tabela a ser criada por ter FK porém a tabela MUNICIPIO E LOGRADOURO já foi criada*/
id_correntista INT,
nm_nome VARCHAR(14),
dt_nascimento DATE,
ds_sexo CHAR(1),
nr_numero VARCHAR(14),
id_municipio INT,
id_cep CHAR(8),
CONSTRAINT Correntista_idcorrentista_PK PRIMARY KEY (id_correntista),
CONSTRAINT Correntista_Municipio_id_municipio_FK FOREIGN KEY (id_municipio)
REFERENCES municipio(id_municipio),
CONSTRAINT Correntista_Logradouro_id_cep_FK FOREIGN KEY (id_cep)
REFERENCES logradouro(id_cep)

);

CREATE TABLE conta (
id_correntista INT,
id_banco INT,
id_conta VARCHAR(5),
id_agencia INT,
nr_digito_conta CHAR(1) NOT NULL,
id_tipo_conta INT ,
cd_tipo_correntista CHAR(1) NOT NULL,
vl_saldo FLOAT NOT NULL,
CONSTRAINT Conta_idconta_PK PRIMARY KEY (id_conta),
CONSTRAINT Conta_Agencia_idagencia_idbanco_FK FOREIGN KEY (id_agencia,id_banco)
REFERENCES agencia (id_agencia,id_banco),
CONSTRAINT Conta_Correntista_id_correntista_FK FOREIGN KEY(id_correntista)
REFERENCES correntista (id_correntista),
CONSTRAINT Conta_Banco_idbanco_FK FOREIGN KEY (id_banco)
REFERENCES banco(id_banco),
CONSTRAINT Conta_Tipoconta_idtipoconta_FK FOREIGN KEY (id_tipo_conta)
REFERENCES tipoconta(id_tipo_conta)
);

SHOW TABLES;
CREATE TABLE tipoconta(/*Sexta tabela a ser criada por não ter nenhuma FK*/
id_tipo_conta INT,
nm_tipo_conta VARCHAR(10),
CONSTRAINT Tipoconta_idtipoconta_PK PRIMARY KEY (id_tipo_conta)
);
DROP TABLE tipoconta;
SHOW TABLES;




/*VERSION 2*/

