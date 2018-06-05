
/*PROJEÇÃO TUDO O QUE QUEREMOS PROJETAR NA TELA*/
SELECT NOW() AS 'DATA';

SELECT NOME, NOW() AS "DATA" /*PROJECAO*/
FROM CLIENTE;
SELECT * FROM endereco;
/* SELECAO - TEORIA DOS CONJUNTOS WHERE CLAUSULA DE SELECAO */

SELECT NOME, SEXO
FROM CLIENTE;

SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'F';

SELECT idcliente,nome,sexo FROM CLIENTE WHERE idcliente=5;/*selecao*/

UPDATE cliente SET sexo = 'F'; = 5 WHERE idcliente = 5;/*selecao*/

/*NOME, SEXO, CIDADE, DATA*/

SELECT nome, sexo,cidade, NOW() AS "data atual"
FROM cliente
INNER JOIN endereco/*inner join junção interna*/
ON idcliente = id_cliente
WHERE  cidade = 'São Paulo';

SELECT * FROM endereco;

SELECT * FROM TELEFONE;
/*NOME, SEXO, BAIRRO,CIDADE, TIPO, NUMERO*/
SELECT cliente.nome, cliente.sexo, endereco.bairro,endereco.cidade, telefone.tipo,telefone.numero
FROM cliente
INNER JOIN endereco/*junte com endereco*/
ON cliente.idcliente = endereco.id_cliente
INNER JOIN telefone
ON CLIENTE.idcliente = telefone.id_cliente
WHERE numero IS NULL;

SELECT cliente.nome, cliente.sexo, endereco.bairro,endereco.cidade, telefone.tipo,telefone.numero
FROM cliente
INNER JOIN endereco/*junte com endereco*/
ON cliente.idcliente = endereco.id_cliente
INNER JOIN telefone
ON CLIENTE.idcliente = telefone.id_cliente
WHERE numero IS NOT NULL;

SELECT c.nome, c.sexo, e.bairro,e.cidade, t.tipo,t.numero
FROM cliente c
INNER JOIN endereco e /*e apelido*/
ON c.idcliente = e.id_cliente
INNER JOIN telefone t
ON c.idcliente = t.id_cliente
WHERE e.cidade = 'São Paulo';
