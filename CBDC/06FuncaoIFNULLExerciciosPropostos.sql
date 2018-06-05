USE DATABASE comercio;


/*Para uma campanha de marketing o setor solucitou uma campanha com nome, email, telefone celular, dos clientes que moram no estado
do rio de janeiro vocé terá que passar uma QUERY para gerar o relatorio para o programador */

SELECT * FROM ENDERECO;
SELECT * FROM cliente;
SELECT * FROM telefone;

SELECT c.nome, c.email, t.numero
FROM cliente c
INNER JOIN telefone t
ON c.idcliente = t.id_cliente
INNER JOIN endereco e
ON c.idcliente = e.id_cliente
WHERE t.tipo = "CEL" AND estado = "RJ" ;

/* Para uma Campanha de produtos de beleza, o comercial solicitou um relatorio com o nome, email e telefone celular
das mulheres que moram no estado de são paulo você tera que passar a query para gerar o relatorio para o programador*/

SELECT c.nome,c.email,t.numero
FROM cliente c
INNER JOIN telefone t
ON c.idcliente = t.id_cliente
INNER JOIN endereco e /*junte com*/
ON c.idcliente = e.id_cliente
WHERE t.tipo = 'CEL' AND e.estado = 'SP' AND c.sexo='F';

/*/*IFNULL RECEBE UM VALOR NULO E DEVOLVE UM VALOR DE SAIDA */

SELECT c.nome AS "CLIENTE",
	IFNULL(c.email, 'SEM EMAIL') AS 'EMAIL',/*IFNULL RECEBE UM VALOR NULO E DEVOLVE UM VALOR DE SAIDA */
	t.numero AS "CELULAR"
FROM cliente c
INNER JOIN telefone t
ON c.idcliente = t.id_cliente
INNER JOIN endereco e /*junte com*/
ON c.idcliente = e.id_cliente
WHERE t.tipo = 'CEL' AND e.estado = 'RJ' AND c.sexo='F';