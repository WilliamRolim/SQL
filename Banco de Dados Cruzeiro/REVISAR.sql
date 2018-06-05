DROP DATABASE banco;

USE banco;

CREATE TABLE agencia (/*Terceira tabela a ser criada por ter FK porém a tabela estado já foi criada*/
id_banco INT,
id_agencia INT,
nm_agencia VARCHAR(10) NOT NULL,
nr_digito_agencia INT NOT NULL,
nr_endereco VARCHAR (15) NOT NULL,
id_cep CHAR(8) NOT NULL,
CONSTRAINT Agencia_idbanco_idagencia_PK PRIMARY KEY (id_banco,id_agencia),
CONSTRAINT Agencia_Conta_idagencia_FK FOREIGN KEY (id_agencia)
REFERENCES (id_agencia)
);

CREATE TABLE banco (/*primeira tabela a ser criada por não ter FK*/
id_banco INT,
nm_banco VARCHAR(20) NOT NULL,
CONSTRAINT Banco_idbanco_PK PRIMARY KEY (id_banco),
CONSTRAINT Banco_Agencia_idbanco_FK FOREIGN KEY (id_banco)
REFERENCES agencia (id_banco),
CONSTRAINT Banco_Conta_idbanco_FK FOREIGN KEY (id_banco)
REFERENCES conta (id_banco)
);

CREATE TABLE logradouro(/*QUarta tabela a ser criada por ter FK porém a tabela Municipio já foi criada*/
id_cep CHAR(8),
id_municipio INT ,
ds_tipo VARCHAR(10),
ds_titulo VARCHAR(14),
nm_nome VARCHAR(20) NOT NULL,
CONSTRAINT Logradouro_idcep_PK PRIMARY KEY (id_cep),
CONSTRAINT Logradouro_Agencia_idcep_FK FOREIGN KEY (id_cep)
REFERENCES agencia(id_cep),
CONSTRAINT Logradouro_Correntista_idmunicipio_FK FOREIGN KEY (id_municipio)
REFERENCES correntista(id_municipio)
);


CREATE TABLE municipio(/*Terceira tabela a ser criada por ter FK porém a tabela estado já foi criada*/
id_municipio INT,
id_uf CHAR(2) NOT NULL,
nm_municipio VARCHAR(15)NOT NULL,
CONSTRAINT Municipio_idmunicipio_PK PRIMARY KEY (id_municipio),
CONSTRAINT Municipio_Logradouro_idmunicipio_FK FOREIGN KEY (id_municipio)
REFERENCES logradouro (id_municipio),
CONSTRAINT Municipio_Correntista_idmunicipio_FK FOREIGN KEY (id_municipio)
REFERENCES correntista(id_municipio)
);

CREATE TABLE estado(/*segunda tabela a ser criada por não ter FK*/
id_uf CHAR(2),
nm_uf VARCHAR(10)NOT NULL,
CONSTRAINT Estado_iduf_PK PRIMARY KEY (id_uf),
CONSTRAINT Estado_Municipio_ifuf_FK FOREIGN KEY (id_uf)
REFERENCES municipio(id_uf)
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
CONSTRAINT correntista_Conta_idcorrentista_FK FOREIGN KEY (id_correntista)
REFERENCES conta(id_correntista)
);

CREATE TABLE conta (/*1*/
id_correntista INT,
id_banco INT,
id_conta VARCHAR(5),
id_agencia INT,
nr_digito_conta CHAR(1) NOT NULL,
id_tipo_conta INT ,
cd_tipo_correntista CHAR(1) NOT NULL,
vl_saldo FLOAT NOT NULL,
CONSTRAINT Conta_idconta_PK PRIMARY KEY (id_conta)
);

SHOW TABLES;
CREATE TABLE tipoconta(/*Sexta tabela a ser criada por não ter nenhuma FK*/
id_tipo_conta INT,
nm_tipo_conta VARCHAR(10),
CONSTRAINT Tipoconta_idtipoconta_PK PRIMARY KEY (id_tipo_conta),
CONSTRAINT Tipoconta_conta_idtipoconta_FK FOREIGN KEY (id_tipo_conta)
REFERENCES conta(id_tipo_conta)
);
DROP TABLE tipoconta;
SHOW TABLES;
USE hr;
SELECT * FROM employees;
SELECT e.last_name, d.department_id, d.department_name FROM employees e FULL OUTER JOIN departments d ON   (e.department_id = d.department_id);

SELECT * FROM employees e INNER JOIN departments d
ON (e.department_id = d.department_id);





CREATE DATABASE TELEFONIA;
USE TELEFONIA;
CREATE TABLE assinante (
cd_assinante INT,
nome_assinante VARCHAR(10),
cd_ramo INT,
cd_tipo INT,
CONSTRAINT Assinante_cdassinanete_PK PRIMARY KEY (cd_assinante),
CONSTRAINT Assinante_RamoAtividade_cdramo_FK FOREIGN KEY (cd_ramo)
REFERENCES ramoatividade(cd_ramo),
CONSTRAINT Assinante_Tipoassinanete_cd_tipo_FK FOREIGN KEY (cd_tipo)
REFERENCES tipoassinante(cd_tipo)
);

CREATE TABLE ramoatividade(
cd_ramo INT,
ds_ramo VARCHAR(10),
CONSTRAINT Assinante_cd_ramo_PK PRIMARY KEY (cd_ramo)
);

CREATE TABLE tipoassinante(
cd_tipo INT,
ds_tipo VARCHAR(10),
CONSTRAINT Tipoassinte_cdtipo_PK PRIMARY KEY (cd_tipo)
);

CREATE TABLE endereco(
cd_endereco INT,
ds_endereco VARCHAR(10),
complemento VARCHAR (8),
bairro VARCHAR(10),
CEP VARCHAR(9),
cd_assinante INT,
cd_municipio INT,
CONSTRAINT Endereco_cdendereco_PK PRIMARY KEY (cd_endereco),
CONSTRAINT Endereco_Assinante_cdassinante_FK FOREIGN KEY (cd_assinante)
REFERENCES assinante (cd_assinante),
CONSTRAINT Endereco_Municipio_cdmunicipio_FK FOREIGN KEY (cd_municipio)
REFERENCES municipio(cd_municipio)
);

CREATE TABLE municipio (
cd_municipio INT,
ds_municipio VARCHAR (10),
CONSTRAINT Municipio_cdmunicipio_PK PRIMARY KEY (cd_municipio)
);

CREATE TABLE telefone(
cd_fone INT,
ddd INT,
n_fone VARCHAR(9),
cd_endereco INT,
CONSTRAINT Telefone_cdfone_PK PRIMARY KEY (cd_fone),
CONSTRAINT Telefone_Endereco_FK FOREIGN KEY (cd_endereco)
REFERENCES endereco (cd_endereco)
);

CREATE TABLE municipio (
cd_municipio INT,
ds_municipio VARCHAR (10),
CONSTRAINT Municipio_cdmunicipio_PK PRIMARY KEY (cd_municipio)
);


INSERT INTO ramoatividade VALUES(1,"Ator"),(2,"Duble"), (3,"Reporter"), (4,"Ancora"), (5,"Apresentadora");/**/

INSERT INTO tipoassinante VALUES (1, "Vitalicio"), (2,"Mensalista"), (3,"Anual"), (4, "Plano A"), (5, "NetFibra");

INSERT INTO assinante VALUES (1,"Jonny Garcia", 1,2), (2,"Havengar Junior", 2,3),(3,"Heleonora", 3,3), (4,"Fidelina",3,4),(5,"Fontana",3,4);

INSERT INTO municipio VALUES (1, "São Paulo"), (2, "Maranhao"),(3,"Minas"),(4,"Alagoas"),(5,"Curitiba");

INSERT INTO endereco VALUES (1,"Dr Junior", "casa","Belem","03123-320",1,1),(2,"Garcia","apartamento","Tatuape","1234-123",1,1),
 (3,"Adelino","casa","Gomorra","1234-324",2,3), (4,"Mooca", "vila","onotorio","6457-432",4,5), (5, "Jurubatuba","casa","Malaquias","5456-223",3,4);

INSERT INTO telefone VALUES (1,011,"2934-2345",1), (2,019,"94367-2455",5), (3,021,"6414-2345",4), (4,31,"9829-2345",3), (5,015,"3245-7345",2);

/*Implemente as consultas abaixo considerando o modelo conceitual acima e utilizando para
realizar a junção SOMENTE os comandos INNER JOIN, LEFT OUTER JOIN ou RIGHT OUTER
JOIN.
a) Listar os nomes dos assinantes, seguido dos dados do endereço e os telefones
correspondentes. */

SELECT a.nome_assinante, e.ds_endereco,t.n_fone FROM assinante a
 INNER JOIN endereco e
 INNER JOIN telefone t
 WHERE a.cd_assinante = e.cd_assinante;
 
 
 
 
 
SELECT * FROM assinante;
SELECT * FROM endereco;
SELECT * FROM telefone;

