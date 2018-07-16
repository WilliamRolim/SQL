CREATE TABLE tb_funcionarios(
id_funcionario INT AUTO_INCREMENT,
nome VARCHAR(14),
salario DECIMAL(10,2),
admissao DATE,
sexo ENUM ('F','M'),
cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
CONSTRAINT Funcionarios_idfuncionario PRIMARY KEY (id_funcionario)
);

INSERT INTO tb_funcionarios (nome,salario,admissao,sexo) VALUES ('William Rolim', 400.00,'2018-06-03','M');

INSERT INTO tb_funcionarios (nome,salario,admissao,sexo) VALUES ('Marina Silva', 1800.00,'2014-01-02','F'),
('Pamela Anderson', 2800.00,'2013-12-02','F'),('Roberto Recife', 4800.00,'2010-10-31','M'),
('Larrisa Santos',600.00,'2018-01-03','F'),('Ricardo Pig', 4500.00,'2017-01-02','M'),
('Morgana Deth',3600.00,'2010-01-03','F'),('Malequias Dig', 7500.00,'2009-12-22','M'),
('Marinha Blue', 6000.00,'2006-12-31','F');

UPDATE tb_funcionarios SET admissao = '2018-06-18' WHERE id_funcionario = 1;
SELECT * FROM tb_funcionarios;

SELECT nome,salario AS atual,
CONVERT(salario * 1.1, DEC(10,2)) AS 'salario com aumento de 10%'
FROM tb_funcionarios;

SELECT * FROM tb_funcionarios WHERE sexo = 'F' AND salario > 3500;

/*Trazer todos os nomes que COMEÇAM com M*/
SELECT * FROM tb_funcionarios WHERE nome LIKE 'M%';

/*Trazer todos os nomes que TERMINAM com G*/
SELECT * FROM tb_funcionarios WHERE nome LIKE '%g';

/*Trazer todos os nomes que apos 2 casas __ comece com M */
SELECT * FROM tb_funcionarios WHERE nome LIKE '__m%';

/*Trazer todos os nomes que NÃO COMEÇAM com M E R*/
SELECT * FROM tb_funcionarios WHERE nome NOT LIKE 'M%' AND nome NOT LIKE'R%';

/*Saber quantos funcionarios ganham entre 1000 e 3000*/
SELECT * FROM tb_funcionarios WHERE salario BETWEEN 1000 AND 3000;

/*Saber quantos funcionarios NÃO ganham entre 1000 e 3000*/
SELECT * FROM tb_funcionarios WHERE salario NOT BETWEEN 1000 AND 3000;

/*SOUNDEX FAZ UMA BUSCA FONETICA EX: LUIS COM S E LUIZ COM Z --Busca pela pronuncia 
Sempre leva em considereção a primeira letra, exemplo Katia com K e Catia com C não daria certo, pois
não pode ser a primeira letra*/
SELECT * FROM tb_funcionarios WHERE SOUNDEX(nome) = SOUNDEX('Willian Rolin');

/*current_date() pega a data atual diretamente do banco de dados */
UPDATE tb_funcionarios SET admissao = CURRENT_DATE() WHERE id_funcionario= 1;

/*adicionar 60 dias À mais da data atual*/
UPDATE tb_funcionarios SET admissao = DATE_ADD(CURRENT_DATE(), INTERVAL 60 DAY) WHERE id_funcionario = 2;

/*qual é a diferença da data inicial e final - Qual a diferença em dias entre essas duas datas*/
SELECT DATEDIFF(admissao,CURRENT_DATE())AS'Diferença de Dias' FROM tb_funcionarios WHERE id_funcionario = 2;

/*quero saber todos que foram contratados no mes 1*/
SELECT * FROM tb_funcionarios WHERE MONTH (admissao) = 1;

/*quero saber todos que foram contratados no mes 1 e entre o ano de 2010 e 2017*/
SELECT * FROM tb_funcionarios WHERE MONTH (admissao) = 1 AND YEAR(admissao) = 2010 OR YEAR(admissao) = 2017;

/*ordenar por nome*/
SELECT * FROM tb_funcionarios ORDER BY nome;

/*ordenar pela coluna 2*/
SELECT * FROM tb_funcionarios ORDER BY 2;

/*Ordenar os salarios order crescente*/
SELECT * FROM tb_funcionarios ORDER BY SALARIO;

/*Ordenar os salarios order decrescente*/
SELECT * FROM tb_funcionarios ORDER BY SALARIO DESC;

/*Ordenar apenas os 4 funcionarios com salario em ordem crescente - LIMIT 0 (INICIAL) 4 (FINAL)*/
SELECT * FROM tb_funcionarios ORDER BY SALARIO LIMIT 0,4;

SELECT * FROM tb_funcionarios
WHERE YEAR(admissao)=2018 AND MONTH(admissao) = 1  ORDER BY SALARIO LIMIT 0,4;