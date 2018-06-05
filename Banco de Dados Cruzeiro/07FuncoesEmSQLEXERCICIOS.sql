CREATE DATABASE livraria;

USE livraria;

CREATE TABLE assunto(
ass_sigla CHAR(3),
ass_descricao VARCHAR(10),
CONSTRAINT Assunto_asssigla_PK PRIMARY KEY (ass_sigla)
);

CREATE TABLE editora(
edi_codigo INT,
edi_nome VARCHAR(20),
CONSTRAINT Editora_edicodigo_PK PRIMARY KEY (edi_codigo)
);

CREATE TABLE livro(
liv_codigo INT,
liv_titulo VARCHAR(10),
liv_preco INT,
liv_lancamento DATE,
edi_codigo INT,
ass_sigla CHAR(3),
CONSTRAINT Livro_livcodigo_PK PRIMARY KEY (liv_codigo),
CONSTRAINT Livro_Assunto_FK FOREIGN KEY (ass_sigla)
REFERENCES assunto(ass_sigla),
CONSTRAINT Livro_Editora_FK FOREIGN KEY (edi_codigo)
REFERENCES editora (edi_codigo)
);

CREATE TABLE autor(
aut_matricula INT,
aut_nome VARCHAR(10),
aut_cpf VARCHAR(13),
aut_dtnasc DATE,
aut_nascionalidade VARCHAR(30),
CONSTRAINT Autor_autmatricula_PK PRIMARY KEY (aut_matricula)
);

CREATE TABLE escreve(
liv_codigo INT,
aut_matricula INT,
CONSTRAINT Escreve_livcodigo_autmatricula_PK PRIMARY KEY (liv_codigo,aut_matricula),
CONSTRAINT Escreve_Autor_autmatricula_FK FOREIGN KEY (aut_matricula)
REFERENCES autor(aut_matricula),
CONSTRAINT Escreve_livro_livcodigo_FK FOREIGN KEY (liv_codigo)
REFERENCES livro(liv_codigo)
);

INSERT INTO assunto VALUES('BAN','Banco');
INSERT INTO assunto VALUES ('PRO','Programacao');
INSERT INTO assunto VALUES ('RED','Redes');
INSERT INTO assunto VALUES ('SIS','SO');

INSERT INTO editora VALUES(1,'Mirandela');
INSERT INTO EDITORA VALUES(2,'Editora Via Norte');
INSERT INTO editora VALUES(3,'Editora Ilhas Tijucas');
INSERT INTO EDITORA VALUES(4,'Maria José');

ALTER TABLE livro
MODIFY liv_preco FLOAT(10,3);

INSERT INTO livro VALUES(1, "banco de dados para web", 32.20,"1999/01/10",1,"BAN");
INSERT INTO livro VALUES(2, "programando em linguagem c", 30.00, "1997/10/01", 1, "PRO");
INSERT INTO livro VALUES(3,"programando em linguagem c++", 115.50,"1998/11/01",3, "PRO");
INSERT INTO livro VALUES(4, "banco de dados na bioinformática", 48.00, NULL, 2, "BAN");
INSERT INTO livro VALUES(5, "redes de computadores", 42.00,"1996/09/10",2,"RED");

ALTER TABLE livro
MODIFY liv_titulo VARCHAR(30);

INSERT INTO autor VALUES(1,"Gobbato", "202.303.404-34","1987/03/12", "Brasileiro");
INSERT INTO autor VALUES(2,"Luiz", "102.303.404-34","1981/12/22", "Angolano");
INSERT INTO autor VALUES(3,"Joaquim", "302.303.404-34","1991/07/31", "Cubano");
INSERT INTO autor VALUES(4,"Regina", "402.303.404-34","1984/09/27", "Peruana");

INSERT INTO escreve VALUES (1,1);
INSERT INTO escreve VALUES (2,1);
INSERT INTO escreve VALUES (3,2);
INSERT INTO escreve VALUES (4,3);
INSERT INTO escreve VALUES (5,4);

/* Testar no oracle SELECT INITCAP(liv_titulo)"Nome do Livro",liv_preco "Valor do Livro" FROM livro WHERE liv_preco > 100; */

/*1. Exibir os nomes dos livros, que custam mais de R$ 100,00 mostrando o as iniciais em maiúsculo e o valor.*/
SELECT * FROM livro;
SELECT UPPER(liv_titulo),liv_preco FROM livro WHERE liv_preco > 100.00;

/*2. Mostrar qual é o livro mais caro, mostrando somente o valor. */ 
SELECT MAX(liv_preco) FROM livro;

/*3. Contar quantas editoras existem. */
SELECT * FROM editora;
SELECT COUNT (edi_codigo) FROM editora;

/*4. Mostrar o nome do livro, e data de lançamento no formato DD/MM/YYYY dos livros da editora com número 1.*/
SELECT liv_titulo, TO_CHAR (liv_lancamento, 'dd/mm/yyyy') FROM livro WHERE edi_codigo=1;

/*5. Mostrar quantos autores existem no banco de dados.*/
SELECT * COUNT (aut_matricula)FROM autor;

/*6. Mostar os nomes dos livros em maiúsculo.*/
SELECT UPPER(liv_titulo) FROM livro
/*7. Montar a seguinte expressão: “O livro XXX tem YYY caracteres”, onde XXX será o nome do livro e YYY a quantidade de caracteres que este livro tem. */
SELECT liv_titulo"Livro", LENGTH(liv_titulo)"Numero de Caracteres" FROM livro;




