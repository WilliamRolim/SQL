CREATE DATABASE escola;
USE escola;


CREATE TABLE departamento(
coddepto INT,
descricao VARCHAR(15),
CONSTRAINT Departamento_coddepto_PK PRIMARY KEY (coddepto)
);

CREATE TABLE cargo (
codcargo INT,
descricaocargo VARCHAR(15),
CONSTRAINT Cargo_codcargo_PK PRIMARY KEY (codcargo)
);

CREATE TABLE funcionario(
matriculafunc INT,
nomefuncionario VARCHAR(25),
dtnascimentofunc DATE,
nacionalidade VARCHAR(12),
sexo ENUM('M','F'),
estadocivil ENUM ('Casado','Solteiro','Divorciado','Viuvo(a)'),
rg VARCHAR(15),
cpf VARCHAR(14),
endereco VARCHAR(20),
telefone INT,
dtadmissaofunc DATE,
CONSTRAINT Funcionario_matriculafunc_PK PRIMARY KEY (matriculafunc)
);

CREATE TABLE dependente(
iddependente INT,
matriculadependente INT,
nomedependente VARCHAR(25),
datanascimentodependente DATE,
CONSTRAINT Dependente_iddependente_PK PRIMARY KEY (iddependente),
CONSTRAINT Dependente_Funcionario_matriculadependente_FK FOREIGN KEY (matriculadependente)
REFERENCES funcionario(matriculafunc)
);

CREATE TABLE ocupacao(
matriculaocupacao INT,
codcargoocupacao INT,
dtinicioocupacao DATE,
dtfimocupacao DATE,
CONSTRAINT Ocupacao_dtinicioocupacao_PK PRIMARY KEY (dtinicioocupacao),
CONSTRAINT Ocupacao_Funcionario_FG FOREIGN KEY (matriculaocupacao)
REFERENCES funcionario (matriculafunc),
CONSTRAINT Ocupacao_Cargo_codcargoocupacao_FK FOREIGN KEY(codcargoocupacao)
REFERENCES cargo(codcargo)
);

CREATE TABLE lotacao(
matriculalotacao INT,
coddeptolotacao INT,
dtiniciolotacao DATE,
dtfimlotacao DATE,
CONSTRAINT Lotacao_dtiniciolotacao_PK PRIMARY KEY (dtiniciolotacao),
CONSTRAINT Lotacao_Funcionario_matriculalotacao_FK FOREIGN KEY (matriculalotacao)
REFERENCES funcionario(matriculafunc),
CONSTRAINT Lotacao_Departamento_coddeptolotacao_FK FOREIGN KEY (coddeptolotacao)
REFERENCES departamento(coddepto)
);

 SHOW TABLES;
 
INSERT INTO departamento VALUES(10,"Compras");
INSERT INTO departamento VALUES (20,"Manufatura");
INSERT INTO departamento VALUES(30,"TI");
INSERT INTO departamento VALUES(40,"Financeiro");
INSERT INTO departamento VALUES(50,"Manutencao");

INSERT INTO cargo VALUES (986,"Gerente Financeiro");
INSERT INTO cargo VALUES(777,"Analista Manufatura");
INSERT INTO cargo VALUES(635,"Programador");
INSERT INTO cargo VALUES(369, "Gerente de TI");
INSERT INTO cargo VALUES (111,"Encarregado");

INSERT INTO funcionario VALUES(1010,"João Aguiar", "1970/12/01", "Brasileira", "M","Solteiro", "28.740.369- 7", "R.URU 69", 67943764,"1990/05/10","255.366.987-13");
INSERT INTO funcionario VALUES(2935,"Maria Adan", "1960/10/01", "Brasileira", "F", "Casado", "25.879.361-6", "R. Caura 78", 73648194, "1985/01/08","255.669.874-10");
INSERT INTO funcionario VALUES(6987,"Juliana Aguirre","1984/06/15","Americana", "F", "Solteiro","58.741.698-7", "R. Aurea 63",64974359, "2007/03/10","255.699.874-36");
INSERT INTO funcionario VALUES(1234,"Paola Damaris","1988/08/10","Americana","F", "Casado", "36.987.412-5", "R. Pend 47",79843164, "2008/04/03","255.366.987-45");
INSERT INTO funcionario VALUES(7851,"Fabio Pepe","1953/12/12", "Brasileira", "M", "Solteiro", "98.745.365-1","R. Leste 36", 36978452,"1978/06/01","111.477.895-63");

INSERT INTO dependente VALUES(1,1010,"Francisca","1978/03/01");
INSERT INTO dependente VALUES(2,2935, "Joana", "1984/08/10");
INSERT INTO dependente VALUES(3,6987, "Hugo", "2009/09/01");
INSERT INTO dependente VALUES(4,6987, "Turine","2003/06/10");
INSERT INTO dependente VALUES(5,1234, "Augusto","2005/06/30");

INSERT INTO ocupacao VALUES(1010,635, "1990/05/10","2000/10/05");
INSERT INTO ocupacao VALUES(2935,777, "1985/01/08", "1990/12/15");
INSERT INTO ocupacao VALUES(6987,635, "2007/03/10", "1987/09/25");
INSERT INTO ocupacao VALUES(1234,635, "2008/03/10", "2018/03/03");
INSERT INTO ocupacao VALUES(7851,111, "1978/06/01", "1979/04/16");
INSERT INTO ocupacao VALUES(1010,369, "2000/10/05", "1981/11/29");

INSERT INTO lotacao VALUES(1010, 30, "1990/05/10","2000/10/05");
INSERT INTO lotacao VALUES(2935, 20, "1985/01/08", "1990/12/15");
INSERT INTO lotacao VALUES(6987, 30, "2007/03/10", "1987/09/25");
INSERT INTO lotacao VALUES(1234, 30, "2008/03/10", "2018/03/03");
INSERT INTO lotacao VALUES(7851, 50, "1978/06/01","2005/06/30");

/*1. Apagar os funcionários que foram admitidos entre 1960 e 1970 e tenham a letra n em
qualquer lugar do nome .*/


/*2. Contar quantos funcionários existem na empresa.*/
SELECT COUNT(matriculafunc)AS "Numero de Funcionarios Existentes" FROM funcionario;

/*3. Mostrar todos os campos da tabela lotacao das matriculas 1010 ou 1234 e que
trabalham no departamento 30.*/
SELECT * FROM lotacao WHERE matriculalotacao BETWEEN 1010 AND 1234 AND coddeptolotacao = 30;

/*4. Mostrar a matrícula do funcionário e o código do cargo de todos os funcionários que
tenham cadastrado uma data final.*/
SELECT matriculaocupacao,codcargoocupacao,dtfimocupacao FROM ocupacao WHERE dtfimocupacao <> NULL;

/*5. Exibir a seguinte expressão: “O dependente: XXXX (Converter para maiúsculo), é
dependente do funcionário de código: 1010 (matricula)”. O nome do dependente deve
iniciar com “T” ou “A”.*/
SELECT  "O dependente:", UPPER(nomedependente),"É dependente do funcionario :", matriculadependente FROM dependente
 WHERE MATRICULADEPENDENTE = 6987 AND  nomedependente LIKE "T%" OR "%A";

/*6. Listar a matricula, o código de departamento e a data de inicio da tabela de lotação. A
data de inicio devera ser impressa no seguinte formato:”10/jan/89” */

/*7. Listar o nome, codigo do dependente e a data de nascimento dos dependentes cujo
código do dependente esteja entre 3 e 6.*/
SELECT * FROM dependente WHERE iddependente BETWEEN 3 AND 6;

/*8. Atualize o endereço do funcionário Fabio Pepe para a tr. Lilas 98.*/ /*obs cpf = endereco troquei sem querer */
UPDATE funcionario SET cpf = "R. Lilas 98" WHERE nomefuncionario = "Fabio Pepe";

/*9. Retorne para a tabela de cargo o seguinte relatório:

Codigo Descrição
635 Prog
369 Gere
111 Enca
*/
SELECT codcargo, SUBSTR(descricaocargo,1,4) AS "Descrição" FROM cargo;






