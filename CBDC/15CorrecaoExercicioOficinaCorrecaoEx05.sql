/*correcao do exercicio oficina*/
criando tabela
CREATE DATABASE PROJETO
USE projeto;

CREATE TABLE cliente (
idcliente INT PRIMARY KEY AUTO_INCREMENT
nome VARCHAR(3) NOT NULL,
sexo ENUM('M','F'),
id_carro  INT UNIQUE
);

CREATE TABLE telefones (
idtelefone INT PRIMARY KEY AUTO_INCREMENT,
tipo NUM('RES','COM','CEL') NOT NULL,
numero INT NOT NULL,
id_cliente INT
);
