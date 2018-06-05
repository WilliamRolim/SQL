/*exericios*/
CREATE TABLE clienteoficina (
idclienteoficina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
endereco VARCHAR(40) NOT NULL,
idade INT
);

CREATE TABLE telefone (
idtelefone INT PRIMARY KEY AUTO_INCREMENT,
tipo ENUM('RES','CEL','COM'),
numero INT,
id_clienteoficina INT,
FOREIGN KEY
(id_clienteoficina)
REFERENCES clienteoficina(idclienteoficina)
);

CREATE TABLE carro(
idcarro INT PRIMARY KEY AUTO_INCREMENT,
marca VARCHAR (20)NOT NULL,
modelo VARCHAR (20) NOT NULL,
qtdportas INT,
id_clienteoficina INT,
FOREIGN KEY
(id_clienteoficina)
REFERENCES clienteoficina(idclienteoficina)
);

CREATE TABLE cor (
idcor INT PRIMARY KEY AUTO_INCREMENT,
cor VARCHAR(50),
marcatinta VARCHAR (30),
id_carro INT,
FOREIGN KEY
(id_carro)
REFERENCES carro(idcarro)
);

SELECT * FROM telefone;

INSERT INTO clienteoficina VALUES(NULL, 'William Rolim', 'Dr.Guilherme Ellis n 3824', 20);
INSERT INTO clienteoficina VALUES(NULL, 'Mariele Pereira', 'Alto do Piqueri n 223', 30);
INSERT INTO clienteoficina VALUES(NULL, 'Maria do Rosario', 'Sonda n 30', 22);
INSERT INTO clienteoficina VALUES(NULL, 'Sarney Filho', 'Alto do Ipiranda', 25);
INSERT INTO clienteoficina VALUES(NULL, 'Ivan Cruzes', 'Rua Veneza', 37);
INSERT INTO clienteoficina VALUES(NULL, 'Conrado Junior', 'Madre Tereza 224', 55);
INSERT INTO clienteoficina VALUES(NULL, 'Monalisa Monsinhor', 'Bom Retiro n 321', 46);

INSERT INTO telefone VALUES (NULL,'RES',23453456, 7);
INSERT INTO telefone VALUES (NULL,'RES',23453456, 4);
INSERT INTO telefone VALUES (NULL,'CEL',3243434, 5);
INSERT INTO telefone VALUES (NULL,'RES',43434334, 3);
INSERT INTO telefone VALUES (NULL,'COM',77667786, 1);
INSERT INTO telefone VALUES (NULL,'CEL',43434456, 2);
INSERT INTO telefone VALUES (NULL,'RES',65474357, 6);

SELECT * FROM cor;

INSERT INTO carro VALUES (NULL,'Camaro', 'E5345BI', 4, 4);
INSERT INTO carro VALUES (NULL, 'Ferrari', '4fdfgtr', 2, 5);
INSERT INTO carro VALUES (NULL, 'Mitsubish', 'version2', 2, 6);
INSERT INTO carro VALUES (NULL, 'Lamborghini', '4343FDFD', 4, 7);
INSERT INTO carro VALUES (NULL, 'Ferrari', '4fdfgtr', 2, 1);
INSERT INTO carro VALUES (NULL, 'FIAT', 'adf43tr', 4, 2);
INSERT INTO carro VALUES (NULL, 'UNO', '994433tr', 4, 3);

INSERT INTO cor VALUES (NULL, 'amarelo','Madara',2);
INSERT INTO cor VALUES (NULL, 'pink','Naruto',3);
INSERT INTO cor VALUES (NULL, 'red','YIYI',4);
INSERT INTO cor VALUES (NULL, 'amarelo','Walking',5);
INSERT INTO cor VALUES (NULL, 'white','Jupter',1);
INSERT INTO cor VALUES (NULL, 'amarelo','Zeus',6);
INSERT INTO cor VALUES (NULL, 'red','Itaiupu',7);

SELECT * FROM cor;
SELECT c.nome, c.endereco, c.idade, t.tipo,t.numero
FROM clienteoficina c
INNER JOIN telefone t
ON t.id_cliente = idcliente

SELECT * FROM cor;
SELECT c.nome, c.endereco, c.idade, t.tipo,t.numero,car.marca,car.modelo,car.qtdportas, cor,marcatinta
FROM clienteoficina c
INNER JOIN telefone t
ON c.idclienteoficina = t.id_clienteoficina
INNER JOIN carro car
ON c.idclienteoficina = car.id_clienteoficina
INNER JOIN cor cr
ON car.idcarro = cr.id_carro;