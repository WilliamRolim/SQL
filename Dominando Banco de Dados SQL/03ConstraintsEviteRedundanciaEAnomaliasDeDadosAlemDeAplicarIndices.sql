CREATE DATABASE educacao;

USE educacao;
CREATE TABLE tb_pessoas(
 idpessoa INT AUTO_INCREMENT NOT NULL,
 desnome VARCHAR(256) NOT NULL,
 dtcadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
 CONSTRAINT PK_pessoas PRIMARY KEY (idpessoa)
)ENGINE = INNODB;

CREATE TABLE tb_funcionarios(
idfuncionario INT AUTO_INCREMENT NOT NULL,
idpessoa INT NOT NULL,
vlsalario DECIMAL (10,2) NOT NULL DEFAULT 1000.00,
dtadmissao DATE NOT NULL,
CONSTRAINT PK_funcionarios PRIMARY KEY (idfuncionario),
CONSTRAINT FK_funcionarios_pessoas FOREIGN KEY (idpessoa)
	REFERENCES tb_pessoas (idpessoa)
);

INSERT INTO tb_pessoas VALUES (NULL,'William', CURRENT_TIMESTAMP());
INSERT INTO tb_pessoas VALUES (NULL,'Marilia Braga', CURRENT_TIMESTAMP());
INSERT INTO tb_funcionarios VALUES (NULL,1,5000.00, CURRENT_DATE());

/*ON -ELA SE UNEM POR QUAL COLUNA*/

/*INNER JOIN TEM QUE TER NAS DUAS TABELAS */
SELECT * FROM tb_funcionarios f
INNER JOIN tb_pessoas p ON p.idpessoa= f.idpessoa;/*ON ONDE*/

/*USING PEGA O CAMPO PADRÃO EM COMUM DAS DUAS TABELAS*/
SELECT * FROM tb_funcionarios f
INNER JOIN tb_pessoas p USING (idpessoa);

SELECT * FROM tb_pessoas p
LEFT JOIN tb_funcionarios f USING (idpessoa);

/*subquerys prefira usar os joins do que subquery, pois subquerys exige muito consumo de memoria (consulta dentro de uma consulta)*/
/*SUBQUERYS*/
DELETE FROM tb_pessoas WHERE idpessoa IN(SELECT idpessoa FROM tb_pessoas WHERE desnome LIKE 'J%');

