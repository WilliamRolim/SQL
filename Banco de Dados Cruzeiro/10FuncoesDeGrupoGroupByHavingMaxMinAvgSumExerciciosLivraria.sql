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

/*-------------------------------------------------------------EXERCICIOS-----------------------------------------------------------------*/

/*Exibir a quantidade de livros que existem por sigla*/
SELECT ass_sigla AS "Sigla",COUNT(ass_sigla) AS "QUANTIDADE DE LIVROS POR SIGLA"
FROM livro
GROUP BY ass_sigla;

Exibir o maior, o menor e a média dos valores dos livros. 
SELECT MAX(liv_preco) AS "Maior Valor", MIN(liv_preco) AS "Menor Valor", AVG(liv_preco) AS "Media Valores"
FROM livro ORDER BY liv_preco;

7. Exibir os livros (Título) que o autor “Gobbato” escreveu. 
SELECT  liv_titulo AS "Titulo do Livro" 
FROM livro WHERE liv_codigo IN(1)
ORDER BY liv_codigo;

8. Exibir os livros (Título), valor, Lançamento, cujo assunto seja “Banco de Dados”.
SELECT liv_titulo AS "Titulo",liv_preco AS "Valor",liv_lancamento AS "Lancamento" 
FROM livro
WHERE liv_titulo IN ("banco de dados para web","banco de dados na bioinformáti")
GROUP BY liv_titulo;

SELECT liv_titulo AS "Titulo",liv_preco AS "Valor",liv_lancamento AS "Lancamento" 
FROM livro
GROUP BY liv_titulo
HAVING liv_titulo LIKE "banco de dados%";
9. Exibir a quantidade de livros publicados por sigla, exibindo a sigla e a quantidade. 
SELECT ass_sigla AS "Sigla", COUNT(ass_sigla) AS "Qtd Livros Por Sigla"
FROM livro
GROUP BY ass_sigla;

10. Quais livros foram publicados pela editora “Mirandela”.
SELECT liv_codigo, liv_titulo AS "Titulo Livro"
FROM livro
GROUP BY liv_titulo
HAVING liv_codigo = 1; 

SELECT liv_titulo AS "Titulo Livro"
FROM livro
WHERE liv_codigo IN (1)
GROUP BY liv_titulo;

/*ps: id =1 é igual ao mirandela

