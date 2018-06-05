/*MODELAGEM CLIENTE*/
CREATE DATABASE comercio;

USE comercio;

CREATE TABLE cliente(
idcliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (30) NOT NULL,
sexo ENUM('M','F') NOT NULL,/*ENUM Só aceita os valores definidos nos campus*/
email VARCHAR(100) UNIQUE,
cpf VARCHAR(15) UNIQUE
);

CREATE TABLE telefone (
idtelefone INT PRIMARY KEY AUTO_INCREMENT,
tipo ENUM('COM','RES','CEL'),
numero VARCHAR(10),
id_cliente INT,
FOREIGN KEY (id_cliente)
REFERENCES cliente(idcliente)
);

CREATE TABLE endereco (
idendereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(30) NOT NULL,
bairro VARCHAR(30) NOT NULL,
estado CHAR(2) NOT NULL,
cidade VARCHAR(2) NOT NULL,
id_cliente INT UNIQUE,
FOREIGN KEY (id_cliente)
REFERENCES cliente(idcliente)
);


/*FOREGEIN KEY - CHAVE ESTRANGEIRA FK */

/* É A CHAVE PRIMARIA DE UMA TABELA QUE VAI ATÉ A OUTRA TABELA FAZER 
REFERENCIA*/

/* EM RELACIONAMENTOS 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTOS 1 X N A CHAVE ESTRANGEIRA FICA SEMPRE NA TABELA N */

/*CHAVE PRIMAIRA NÃO TEM UNDERLINE
CHAVE ESTRANGEIRA TEM UNDERLINE*/

/*INSERINDO DADOS */

DESC CLIENTE;

INSERT INTO CLIENTE VALUES (NULL, 'William Rolim', 'M', 'williamrolim2011@hotmail.com', '123.456.655-43');
INSERT INTO cliente VALUES (NULL, 'Ivanira Rolim', 'F','ivanirarolim@bol.com.br', '234.434.322-32');
INSERT INTO cliente VALUES (NULL, 'Joana Prado', 'F', 'feiticeira@yahoo.com.br', '323.434.376-67');
INSERT INTO cliente VALUES (NULL, 'Rodrigo Junior', 'M', 'rodrigojunior@gmail.com', '234.556.745-36');
INSERT INTO cliente VALUES (NULL, 'Anderson Barbosa', 'M', 'balboa@hotmail.com', '323.323.655-34');
INSERT INTO cliente VALUES (NULL, 'Monemur Manisole', 'F', 'monemur@bol.com.br', '233.436.256-63');
INSERT INTO cliente VALUES (NULL, 'Joanete pezita', 'F', 'pezita@gmail.com', '234.534.325-54');
INSERT INTO cliente VALUES (NULL, 'Brujinho piche', 'M', 'desmadre@gmail.com', '323.547.743-53');
INSERT INTO cliente VALUES (NULL, 'Astrogildo Monoru', 'M','astro@hotmail.com', '032.434.534-54');

DESC endereco;


INSERT INTO endereco VALUES (NULL, 'Rua Girassol n 234', 'Paralelepido','São Paulo', 'SP', 9);
INSERT INTO endereco VALUES (NULL, 'Pedrosa figueira 321', 'Monotrilho', 'Rio de Janeiro', 'RJ',3);
INSERT INTO ENDERECO VALUES (NULL, 'Guilherme de Almeida 32', 'Amagorinho', 'Maranhão', 'MA',7);

INSERT INTO endereco VALUES (NULL, 'Somalia n 1343', 'Tancredo alves','São Paulo', 'SP', 6);
INSERT INTO endereco VALUES (NULL, 'Anistia s/n', 'Mataratos', 'Rio Grande do Sul', 'RS',5);
INSERT INTO ENDERECO VALUES (NULL, 'Sem Saida 23', 'Ananias 343', 'Maranhão', 'MA',4);
INSERT INTO endereco VALUES (NULL, 'Clementino 43', 'adilson dias 33','São Paulo', 'SP', 1);
INSERT INTO endereco VALUES (NULL, 'Monoliso Cardoso 24', 'Cobra Kan 79', 'Rio de Janeiro', 'RJ',8);
INSERT INTO ENDERECO VALUES (NULL, 'Eneias Carneiro 593', 'Gleiskon 43', 'Maranhão', 'MA',2);

DESC telefone;

SELECT * FROM telefone;
INSERT INTO telefone VALUES (NULL, 'CEL', '9234-4356', 8);
INSERT INTO telefone VALUES (NULL, 'RES', '2453-3456',3);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '1323-5443',7);
INSERT INTO TELEFONE VALUES (NULL, 'cel', '43456-4345',6);
INSERT INTO telefone VALUES (NULL, 'COM', NULL, 2);
INSERT INTO telefone VALUES (NULL, 'RES', '26935-4335',4);
INSERT INTO telefone VALUES (NULL, 'CEL', NULL, 5);
INSERT INTO telefone VALUES (NULL, 'CEL', '9455-3236',1);
INSERT INTO telefone VALUES (NULL, 'CEL', '3455-3236',9);



