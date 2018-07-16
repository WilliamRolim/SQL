/* Criar o schema ‘curso_java’ com a senha ‘schema’ e criar novamente as
Tabelas Cliente e Curso.*/
/*Ideal trabalhar com suas proprias tabelas indices funcoes*/
grant connect, create session, resource,
create view to curso_java identified by schema;


CREATE TABLE cliente
(
CPF NUMBER NOT NULL ENABLE,
Nome VARCHAR2(30) NOT NULL ENABLE,
Email VARCHAR2(30) NOT NULL ENABLE,
CONSTRAINT "pk_cliente_cpf" PRIMARY KEY (CPF)
);

CREATE TABLE curso
(
cdcurso NUMBER NOT NULL ENABLE,
nome VARCHAR2(80 BYTE) NOT NULL ENABLE,
valor NUMBER NOT NULL ENABLE,
URL VARCHAR2(80 BYTE) NOT NULL ENABLE,
CONSTRAINT "pk_curso_cdcurso" PRIMARY KEY (cdcurso)
)

DROP TABLE cliente;



/*1) Criar as operações de CRUD (Create Read Update Delete) em SQL para
as Tabelas Cliente e Curso.*/

SELECT * FROM cliente;
SELECT * FROM curso;

select nome from cliente where CPF =9265636590;

INSERT INTO cliente VALUES (12332113421, 'Manuel da Nobrega', 'manuel@gmail.com');
INSERT INTO cliente VALUES (34596434467, 'Pedro de Lara', 'pedro@yahoo.com');
INSERT INTO cliente VALUES (97654367890, 'Fernanda Prado', 'fernanda@hotmail.com');
INSERT INTO cliente VALUES (32572118421, 'Flavia Cavalcanti', 'flavia@ig.com.br');
INSERT INTO cliente VALUES (34546454467, 'Marina Pera', 'marina@gmail.com');
INSERT INTO cliente VALUES (9265636590, 'Mazaropi Junior', 'mazaropi@hotmail.com');
INSERT INTO cliente VALUES (3264656590, 'Teste DELETE', 'DELETE@hotmail.com');

INSERT INTO curso VALUES (1, 'Java Web', 300.00, 'www.universidadejava.com/javaweb');
INSERT INTO curso VALUES (2, 'Java Servlet', 250.00, 'www.universidadejava.com/javaservlet');
INSERT INTO curso VALUES (3, 'Sql Delevoper', 310.00, 'www.universidadejava.com/sqldelevoper');
INSERT INTO curso VALUES (4, 'Java JDBC', 350.00, 'www.universidadejava.com/javaJDBC');
INSERT INTO curso VALUES (5, 'Java POO', 100.00, 'www.universidadejava.com/javapoo');
INSERT INTO curso VALUES (6, 'Android', 400.00, 'www.universidadejava.com/android');
INSERT INTO curso VALUES (7, 'Html', 120.00, 'www.universidadejava.com/html');
INSERT INTO curso VALUES (8, 'CSS', 180.00, 'www.universidadejava.com/css');
INSERT INTO curso VALUES (9, 'DELETE', 180.00, 'www.universidadejava.com/testedelete');


UPDATE cliente SET Nome='Mazzaroppi  Figa' where CPF =9265636590;

UPDATE curso SET nome='Android Mobile', valor=410,url='universidadejava.com/androidmobile' Where cdcurso=6;
commit;

DELETE cliente where cpf=3264656590;

DELETE curso where cdcurso = 9;

alter table cliente 
MODIFY cpf varchar2(15);

drop table cliente;

/*PROCEDURE*/
CREATE OR REPLACE PROCEDURE SP_INSERIRCLIENTE 
(
  CPF IN INTEGER 
, NOME IN VARCHAR2 
, EMAIL IN VARCHAR2 
) AS 
BEGIN
  INSERT INTO CLIENTE VALUES(cpf,nome,email);
END SP_INSERIRCLIENTE;