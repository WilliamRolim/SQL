/*UPDATE*/
UPDATE tb_funcionarios SET salario = 3800, admissao='2018-06-16'
WHERE salario = 400 AND id_funcionario = 1;

SELECT * FROM tb_funcionarios WHERE id_funcionario =1;

/*Iniciar uma transação que poderá ser cancelada ou confirmada*/
START TRANSACTION;

DELETE FROM tb_funcionarios; 

SELECT * FROM tb_funcionarios;

/*REFAZER A exclusão*/
ROLLBACK;

/*COMMIT CONFIRMA O que vc fez*/
COMMIT;

/*Formata a tabela inteira ex: o delete deixa rastros, o proximo registro continua daonde ele parou, para apagar usa-se o truncate*/
TRUNCATE TABLE tb_funcionarios;