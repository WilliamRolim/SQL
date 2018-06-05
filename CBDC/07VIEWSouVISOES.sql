/*VIEWS OU VISÕES */

/*MENAS PERFORMACE DO QUE FAZER A QUERY*/

CREATE VIEW VIEW_RELATORIO AS/*as em ingles significa como*/
SELECT c.nome AS "CLIENTE", /*as em ingles significa como*/
	c.sexo AS "SEXO",/*as em ingles significa como*/
	IFNULL(c.email, 'SEM EMAIL') AS 'EMAIL',/*IFNULL RECEBE UM VALOR NULO E DEVOLVE UM VALOR DE SAIDA */
	t.tipo AS "TIPO CELULAR",/*as em ingles significa como*/
	t.numero AS "TELEFONE",
	e.bairro AS "Bairro",
	e.cidade AS "Cidade",
	e.estado AS "Estado"
FROM cliente c
INNER JOIN telefone t
ON c.idcliente = t.id_cliente
INNER JOIN endereco e /*junte com*/
ON c.idcliente = e.id_cliente
WHERE t.tipo = 'CEL' AND e.estado = 'RJ' AND c.sexo='F';

SELECT * FROM VIEW_RELATORIO;

SELECT * FROM VIEW_RELATORIO
WHERE bairro = "Solimoes";

SHOW TABLES;
SELECT * FROM cliente;

/*apagando uma view*/
DROP VIEW view_relatorio;
SELECT * FROM telefone;


SELECT CLIENTE,SEXO, EMAIL,"TIPO CELULAR",TELEFONE,Bairro,Cidade,Estado
FROM VIEW_RELATORIO;