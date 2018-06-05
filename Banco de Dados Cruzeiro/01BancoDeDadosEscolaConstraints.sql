/* estudos 02*/

CREATE DATABASE ESCOLA;
use escola;
CREATE TABLE aluno (
idrgm int,
nomealuno varchar(30) not null,
nomepai varchar(30) not null,
nomemae varchar (30) not null,
dtnascimento DATE not null,
sexo ENUM ('M','F'),
CONSTRAINT Aluno_idrgm_pk PRIMARY KEY (idrgm)
);

create table matricula (
id_classe int,
nr_rgm int,
dt_matricula date not null,
Constraint Matricula_id_classe_pk Primary Key (id_classe,nr_rgm),
Constraint Matricula_id_classe_fk FOREIGN Key (id_classe) REFERENCES CLASSE (idclasse),
CONSTRAINT Matricula_nr_rgm_fk FOREIGN KEY (nr_rgm) References Aluno(idrgm)
);

CREATE TABLE ESCOLA(
idescola int PRIMARY KEY AUTO_INCREMENT,
nomeescola varchar(50) not null,
dsendereco varchar(50) not null,
dsbairro varchar (40) not null
);

CREATE TABLE CLASSE (
idclasses int,
nranoletivo int not null,
id_escola int,
id_grau int,
nrserie int not null,
sgturma varchar(30) not null,
id_periodo int,
CONSTRAINT Classe_id_classes_pk PRIMARY KEY (idclasses),
CONSTRAINT Classe_nranoletivo CHECK (NRANOLETIVO > 2000),
CONSTRAINT Classe_id_grau_FK FOREIGN KEY (id_grau) REFERENCES Grau(idgrau) ,
CONSTRAINT CLasse_id_periodo_FK FOREIGN KEY (id_periodo) REFERENCES Periodo (idperiodo));
);

CREATE TABLE GRAU(
idgrau int,
nomegrau varchar(50),
CONSTRAINT Grau_idgrau_pk PRIMARY KEY (idgrau)
);

CREATE TABLE PERIODO(
idperiodo int,
nomepedido varchar (30) not null,
CONSTRAINT Periodo_idperiodo_pk PRIMARY KEY (idperiodo)
);
