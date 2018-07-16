
CREATE TABLE notas_donuts (
  empresa varchar(50) default NULL,
  hora  TIMESTAMP default null, /*time = timestamp DATAS E HORARIOS*/
  dia date  default (sysdate) null , /*(sysdate) estudar*/
  tipo varchar(50) default NULL,
  nota number(4) default NULL,
  comentario varchar(50) default NULL
);
select * from notas_donuts;

INSERT INTO notas_donuts (empresa,hora,dia,tipo,nota,comentario) VALUES ('Starbuzz Coffee',CURRENT_TIMESTAMP,CURRENT_DATE,'cobertura de canela','6','muito condimento');
INSERT INTO notas_donuts (empresa,hora,dia,tipo,nota,comentario) VALUES ('Duncan''s Donuts',CURRENT_TIMESTAMP,'25/08/2007','cobertura simples','5','gorduroso');
INSERT INTO notas_donuts (empresa,hora,dia,tipo,nota,comentario) VALUES ('Duncan''s Donuts',CURRENT_TIMESTAMP,'26/04/2007','geléia','6','não são fresquinhas mas são gostosas');
INSERT INTO notas_donuts (empresa,hora,dia,tipo,nota,comentario) VALUES ('Starbuzz Coffee',CURRENT_TIMESTAMP,'24/05/2007','cobertura simples','7','morno,mas não quente');
INSERT INTO notas_donuts (empresa,hora,dia,tipo,nota,comentario) VALUES ('Krispy King',CURRENT_TIMESTAMP,'27/09/2007','geléia','6','sem geléia suficiente');
INSERT INTO notas_donuts (empresa,hora,dia,tipo,nota,comentario) VALUES ('Starbuzz Coffee',CURRENT_TIMESTAMP,'24/05/2007','chocolate com castanhas','10','marshmallows');
INSERT INTO notas_donuts (empresa,hora,dia,tipo,nota,comentario) VALUES ('Krispy King',CURRENT_TIMESTAMP,'27/09/2007','cobertura simples','8','cobertura de xarope');
INSERT INTO notas_donuts (empresa,hora,dia,tipo,nota,comentario) VALUES ('Cobertura For All',CURRENT_TIMESTAMP,'27/09/2007','cobertura simples','10','cobertura de pudim');

/*Quer encontrar o melhor empresa com donuts com cobertura da cidade */
SELECT empresa, nota,tipo, comentario from notas_donuts where tipo like '%cobertura%';

/*Quer encontrar o melhor empresa com donuts com cobertura da cidade com nota 10*/
SELECT empresa, nota,tipo, comentario from notas_donuts where tipo like '%cobertura%' and nota = 10;

select * from my_contacts;

/*Selecionar o email de todos os programadores de my_contacts*/
select email, profession from MY_CONTACTS where PROFESSION LIKE '%Programmer%';

/*escreva uma consulta para encontra o nome e local de qualquer um com seu aniversário (data do nascimento)*/

SELECT first_name, location, birthday from my_contacts where BIRTHDAY = '1981-05-06' OR BIRTHDAY ='1983-01-10';

/*Escreva uma consulta para encontrar o nome e email de qualquer pessoa solteira na sua cidade.Para pontos extras,
escolha apenas aquelas do sexo que você gostaria de ter um encontro.*/

select first_name ,email, status,gender from MY_CONTACTS where (STATUS = 'single' OR STATUS = 'divorced') and GENDER = 'F';

/*Escreva uma consula para encontrar todas as Annes de São Francisco*/

select first_name, location from MY_CONTACTS where FIRST_NAME like '%Anne%' and (LOCATION like 'San F%' OR LOCATION = 'San Francisco, CA');

/*Consulte apenas os nomes dos drinks com soda e quantidade de 1.5*/
select * from drinks_faceis;

select nome_do_drink,principal,quantidade1 from DRINKS_FACEIS where PRINCIPAL ='soda' and quantidade1 = 1.5;

/*Consulte apenas os nomes dos drinks com soda e quantidade de 2*/
select nome_do_drink,principal,quantidade1 from DRINKS_FACEIS where PRINCIPAL ='soda' and quantidade1 = 2;

/*Selecionar todos os drinks com que a quantidade é maior que 1*/
select nome_do_drink,principal,quantidade1 from DRINKS_FACEIS where PRINCIPAL ='soda' and quantidade1 > 1;

CREATE TABLE drink_info (
  nome_do_drink varchar(16) default NULL,
  preco decimal(4,2) default NULL,
  carboidratos decimal(4,2) default NULL,
  cor varchar(20) default NULL,
  gelo char(1) default NULL,
  calorias NUMBER(11) default NULL
);

INSERT INTO drink_info VALUES ('Blackthorn', 3, 8.4, 'yellow', 'Y', 33); 
INSERT INTO drink_info VALUES ('Blue Moon', 2.5, 3.2, 'blue', 'Y', 12); 
INSERT INTO drink_info VALUES ('Oh My Gosh', 3.5, 8.6, 'orange', 'Y', 35); 
INSERT INTO drink_info VALUES ('Lime Fizz', 2.5, 5.4, 'green', 'Y', 24); 
INSERT INTO drink_info VALUES ('Kiss on the Lips', 5.5, 42.5, 'purple', 'Y', 171); 
INSERT INTO drink_info VALUES ('Hot Gold', 3.2, 32.1, 'orange', 'N', 135); 
INSERT INTO drink_info VALUES ('Lone Tree', 3.6, 4.2, 'red', 'Y', 17); 
INSERT INTO drink_info VALUES ('Greyhound', 4, 14, 'yellow', 'Y', 50); 
INSERT INTO drink_info VALUES ('Indian Summer', 2.8, 7.2, 'brown', 'N', 30); 
INSERT INTO drink_info VALUES ('Bull Frog', 2.6, 21.5, 'tan', 'Y', 80); 
INSERT INTO drink_info VALUES ('Soda and It', 3.8, 4.7, 'red', 'N', 19); 
INSERT INTO drink_info VALUES ('Slim Shady', 4.35, NULL, 'clear', 'Y', NULL); 

select * from drink_info;

/* Exibir os drinks com o preço maior ou igual que 3.5 e com calorias menores ou iguais que 50 da tabela drink_info*/
SELECT nome_do_drink, preco, calorias from drink_info where  preco >= 3.5 and calorias <=50;

/*Exibir o custo de cada drink com gelo que seja amerelo e com mais de 33 calorias da tabela drink_info*/
SELECT nome_do_drink, preco,gelo,cor from drink_info where gelo = 'Y' and cor = 'yellow' and calorias > 33;

/*O nome e cor de cada drink que não contenham mais que 4 gramas de carboidratoe utilizam gelo*/
SELECT nome_do_drink, cor,carboidratos,gelo from DRINK_INFO where carboidratos < 4 and gelo = 'Y';

/*O custo de cada drink que tenha 80 calorias ou mais*/
SELECT preco from DRINK_INFO where CALORIAS >= 80;

/*Drinks com o nome GreyHound e Kiss on the Lips, seguid da cor de cada um e se utilizam gelo ou não para fazer a bebida*/
SELECT nome_do_drink,cor,gelo from DRINK_INFO where (nome_do_drink = 'Greyhound' or nome_do_drink = 'Kiss on the Lips');

/*pagina 113*/