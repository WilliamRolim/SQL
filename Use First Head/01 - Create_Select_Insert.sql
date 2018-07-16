CREATE TABLE lista_donut
(
nome_donut VARCHAR(12) NOT NULL,
tipo_donut VARCHAR(10) NOT NULL,
custo_donut DEC(3,2) DEFAULT 1.00 NOT NULL
);
drop table lista_donut;
INSERT INTO LISTA_DONUT  VALUES ('Bloodberry','recheado', 2.00);
INSERT INTO LISTA_DONUT (NOME_DONUT, TIPO_DONUT) VALUES ('Cinnamondo','anel');
INSERT INTO LISTA_DONUT (NOME_DONUT, TIPO_DONUT) VALUES('Rockstar','enrolado');
INSERT INTO LISTA_DONUT (NOME_DONUT, TIPO_DONUT)  VALUES('Caramelo', 'enrolado');
INSERT INTO LISTA_DONUT  VALUES('Appleblush','recheado',1.40);

SELECT * FROM LISTA_DONUT;

CREATE TABLE my_contacts (
  last_name varchar(30) ,
  first_name varchar(20) ,
  email varchar(50) ,
  gender char(1),
  birthday varchar(10) ,
  profession varchar(50),
  location varchar(50),
  status varchar(20),
  interests varchar(100),
  seeking varchar(100)
) ;
drop table my_contacts ;
select * from my_contacts;
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('Anderson','Jillian','jill_anderson@breakneckpizza.com','F','1980-09-05','Technical Writer','Palo Alto, CA','single','kayaking, reptiles','relationship, friends');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('Kenton','Leo','lkenton@starbuzzcoffee.com','M','1974-01-10','Manager','San Francisco, CA','divorced','women','women to date');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('McGavin','Darrin',' captainlove@headfirsttheater.com','M','1966-01-23','Cruise Ship Captain','San Diego, CA','single','sailing, fishing, yachting','women for casual relationships');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('Franklin','Joe','joe_franklin@leapinlimos.com','M','1977-04-28','Software Sales','Dallas, TX','married','fishing, drinking','new job');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('Hamilton','Jamie','dontbother@starbuzzcoffee.com','F','1964-09-10','System Administrator','Princeton, NJ','married','RPG','nothing');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('Chevrolet','Maurice','bookman4u@objectville.net','M','1962-07-01','Bookshop Owner','Mountain View, CA','married','collecting books, scuba diving','friends');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('Kroger','Renee','poorrenee@mightygumball.net','F','1976-12-03','Unemployed','San Francisco, CA','divorced','cooking','employment');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('Mendoza','Angelina','angelina@starbuzzcoffee.com','F','1979-08-19','UNIX Sysadmin','San Francisco, CA','married','acting, dancing','new job');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('Murphy','Donald','padraic@tikibeanlounge.com','M','1967-01-23','Computer Programmer','New York City, NY','committed relationsh','RPG, anime','friends');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking) VALUES ('Spatner','John','jpoet@objectville.net','M','1963-04-18','Salesman','Woodstock, NY','married','poetry, screenwriting','nothing');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday, profession,location) VALUES ('Toth','Anne','Anne_Toth@leapinlimos.com','F','1969-11-18', 'Artist','San Fran, CA');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday, profession,location) VALUES ('Manson','Anne','am86@objectville.net','F','1977-08-09', 'Baker','Seattle, WA');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday, profession,location) VALUES ('Hardy','Anne','anneh@b0tt0msup.com','F','1963-04-18', 'Teacher','San Fran, CA');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday, profession,location) VALUES ('Parker','Anne','annep@starbuzzcoffee.com','F','1983-01-10', 'Student','San Fran, CA');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday, profession,location) VALUES ('Blunt','Anne','anneblunt@breakneckpizza.com','F','1959-10-09', 'Web Designer','San Fran, CA');
INSERT INTO my_contacts (last_name,first_name,email,gender,birthday, profession,location) VALUES ('Jacobs','Anne','anne99@objectville.net','F','1968-02-05', 'Computer Programmer','San Jose, CA');

select * from MY_CONTACTS where FIRST_NAME LIKE '%Anne%' and LOCATION Like'%San Fran%';

select * from MY_CONTACTS;

CREATE TABLE drinks_faceis(
nome_do_drink varchar(40),
principal varchar (30),
quantidade1 dec (3,2),
segundo varchar (40),
quantidade2 dec(3,2),
instrucoes varchar(100)
);

INSERT INTO drinks_faceis VALUES ('Blackthorn', 'água tónica', 1.5, 'suco de abacaxi', 1, 'mexa com gelo, coloque em uma taça de coquetel com limão batido');
INSERT INTO drinks_faceis VALUES ('Blue moon', 'soda', 1.5, 'suco de mirtilo', 0.75, 'mexa com gelo, coloque em uma taça de coquetel com limão batido');
INSERT INTO drinks_faceis VALUES ('Oh My Gosh', 'néctar de pessego', 1, 'suco de abacaxi',1, 'mexa com gelo, coloque um copinho de licor');
INSERT INTO drinks_faceis VALUES ('Lime Fizz', 'Sprite', 1.5, 'suco de limão',0.75, 'mexa com gelo, coloque uma taça de coquetel');
INSERT INTO drinks_faceis VALUES ('Kiss on the Lips', 'suco de cereja', 2, 'néctar de damasco',7, 'sirva com gelo e canudo');
INSERT INTO drinks_faceis VALUES ('Hot Gold', 'néctar de pêssego', 3, 'suco de laranja',6, 'coloque suco de laranja quente em uma caneca e adicione néctar de pêssego');
INSERT INTO drinks_faceis VALUES ('Lone Tree', 'soda', 1.5, 'suco de cereja',0.75, 'mexa com gelo e adicione uma taça de coquetel');
INSERT INTO drinks_faceis VALUES ('Greyhound', 'soda', 1.5, 'suco de toranja', 5, 'sirva com gelo, mexa bem');
INSERT INTO drinks_faceis VALUES ('Indian Summer', 'suco de maça', 2, 'chá quente', 6, 'adicionar o suco em uma cena e completar o resto com chá quente');
INSERT INTO drinks_faceis VALUES ('Bull Frog', 'chá gelado', 1.5, 'limonada', 5, 'sirva com gelo e uma fatia de limão');
INSERT INTO drinks_faceis VALUES ('Soda and it', 'soda', 2, 'suco de uva', 1, 'misture em uma taça de coquetel, sem gelo');


SELECT * FROM drinks_faceis WHERE principal = 'Sprite'; 

SELECT * FROM drinks_faceis WHERE principal = 'soda'; 

SELECT * FROM drinks_faceis WHERE segundo = 'suco de laranja'; 

SELECT * FROM drinks_faceis WHERE quantidade1 = 1.5; 

SELECT * FROM drinks_faceis WHERE quantidade2 < 1; 

/*Funciona esperava que não fosse funcionar por causa do '1';*/
SELECT * FROM drinks_faceis WHERE quantidade2 < '1'; 

SELECT * FROM drinks_faceis WHERE quantidade1 < 1.5; 

SELECT * FROM my_contacts;
select * from DRINKS_FACEIS;
INSERT INTO my_contacts VALUES ('Funyon', 'Steve', 'steve@onionflavoredrings.com', 'M', '1970-04-01','Punk','Grover\´s Mill, NJ', 'Solteiro', 'esmagar o estado','compatriotas, guitarristas');
DELETE my_contacts WHERE first_name = 'Steve' and LAST_NAME = 'Funyon' and INTERESTS = 'esmagar o estado';

select nome_do_drink, principal, segundo from DRINKS_FACEIS where principal = 'soda';

select nome_do_drink from DRINKS_FACEIS where PRINCIPAL = 'suco de cereja';

/* Todas as maneiras de selecionar a bebida kiss on the lips */
select * from drinks_faceis where quantidade1 = 2 and segundo = 'néctar de damasco';

select * from drinks_faceis where segundo = 'néctar de damasco';

select * from drinks_faceis where quantidade2 = 7;

select * from drinks_faceis where instrucoes = 'sirva com gelo e canudo';

select * from drinks_faceis where nome_do_drink = 'Kiss on the Lips';

/*Escreva 3 comandos selects que darao a você um blue frog*/

select * from DRINKS_FACEIS where nome_do_drink = 'Bull Frog';

select * from DRINKS_FACEIS where principal = 'chá gelado';

select * from DRINKS_FACEIS where SEGUNDO = 'limonada';


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