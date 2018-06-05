/* aula03*/
CREATE DATABASE empresa;
use empresa;

create Table empregado(
idempregado int,
nmempregado varchar(30),
dtnascimentopregado date,
enderecompregado INT,
id_departamento int,
CONSTRAINT Empregado_idempregado_pk PRIMARY KEY (idempregado),
CONSTRAINT Empregado_idepartamento_fk FOREIGN KEY (id_departamento)
REFERENCES DEPARTAMENTO(iddepartamento)
);

CREATE Table departamento(
iddepartamento integer,
nomedepartamento varchar(20),
CONSTRAINT Departamento_iddepartamento_pk PRIMARY KEY (iddepartamento)
);

CREATE Table projeto(
idprojeto integer,
nomeprojeto varchar(30),
dt_ini_projeto date,
CONSTRAINT Projeto_idprojeto_pk PRIMARY KEY (idprojeto)
);

CREATE Table projeto_empregado(
id_projeto integer,
id_empregado integer,
CONSTRAINT Projeto_Empregado_PK PRIMARY KEY (id_projeto, id_empregado),
CONSTRAINT Projeto_Empregado_id_projeto_FK FOREIGN KEY (id_projeto)
references Projeto(idprojeto),
CONSTRAINT Projeto_Empregado_id_empregado_FK FOREIGN KEY (id_empregado)
references EMPREGADO (idempregado)
);


