/*01 ex departamento */

/*criando o banco de dados */
CREATE DATABASE escritorio;

/*usando o bando de dados */
USE escritorio;


CREATE TABLE empregado (
idempregado INT PRIMARY KEY AUTO_INCREMENT,
nomeempregado VARCHAR(30) NOT NULL,
datanascimento DATE NOT NULL,
enderecoempregado VARCHAR (50) NOT NULL,
id_departamento INT
);

CREATE TABLE departamento (
iddepartamento INT PRIMARY KEY AUTO_INCREMENT,
nomedepartamento VARCHAR(50) NOT NULL
);

CREATE TABLE projetoempregado (
id_projeto INT ,
id_empregado INT 
);

CREATE TABLE projeto (
idprojeto INT PRIMARY KEY AUTO_INCREMENT,
nomeprojeto VARCHAR(30),
datainicioprojeto DATE,
datafimprojeto DATE
);

ALTER TABLE EMPREGADO ADD CONSTRAINT fk_empregado_departamento
FOREIGN KEY (id_departamento) REFERENCES departamento(iddepartamento);

ALTER TABLE projetoempregado ADD CONSTRAINT fk_projetoempregado_empregado
FOREIGN KEY (id_empregado) REFERENCES empregado(idempregado);

ALTER TABLE projetoempregado ADD CONSTRAINT PK_projetoempregado_projeto
FOREIGN KEY (



