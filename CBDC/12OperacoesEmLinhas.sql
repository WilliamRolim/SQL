/*OPERAÇÕES EM LINHA*/

SELECT nome, janeiro, fevereiro, marco,
(janeiro + fevereiro + marco) AS "Valor dos 3 meses",
TRUNCATE((janeiro + fevereiro + marco) / 3,2) AS "Media dos 3 meses"
FROM VENDEDORES;

SELECT nome, janeiro, fevereiro, marco,
(janeiro + fevereiro + marco) AS "Valor dos 3 meses",
TRUNCATE((janeiro + fevereiro + marco) /3,2 ) *2.5 AS "Desconto de 2.5",
TRUNCATE((janeiro + fevereiro + marco) / 3,2) AS "Media dos 3 meses"
FROM VENDEDORES;
