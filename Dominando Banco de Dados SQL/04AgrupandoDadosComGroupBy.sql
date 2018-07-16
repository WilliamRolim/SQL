/*toda vez que quero realizar uma consulta e quero realizar um subtotal e um total geral o group by será muito 
util nesse caso */

CREATE TABLE tb_pedidos(
idpedido INT AUTO_INCREMENT NOT NULL,
idpessoa INT NOT NULL,
dtpedido DATETIME NOT NULL,
vlpedido DEC(10,2),
CONSTRAINT PK_pedidos PRIMARY KEY (idpedido),
CONSTRAINT FK_pedidos_pessoas FOREIGN KEY (idpessoa)
REFERENCES tb_pessoas (idpessoa)
);

INSERT INTO tb_pedidos VALUES (NULL, 1, CURRENT_DATE(), 22000.00);
INSERT INTO tb_pedidos VALUES (NULL, 1, CURRENT_DATE(), 5000.00);
INSERT INTO tb_pedidos VALUES (NULL, 1, CURRENT_DATE(), 10000.00);
INSERT INTO tb_pedidos VALUES (NULL, 1, CURRENT_DATE(), 1000.00);
INSERT INTO tb_pedidos VALUES (NULL, 1, CURRENT_DATE(), 3000.00);

INSERT INTO tb_pedidos VALUES (NULL, 2, CURRENT_DATE(), 1999.90);
INSERT INTO tb_pedidos VALUES (NULL, 2, CURRENT_DATE(), 2000);
INSERT INTO tb_pedidos VALUES (NULL, 2, CURRENT_DATE(), 143.45);

INSERT INTO tb_pedidos VALUES (NULL, 3, CURRENT_DATE(), 40000.00);

/*GROUP BY*/
SELECT pes.desnome,
SUM(p.vlpedido) AS 'Total',
CONVERT(AVG(p.vlpedido), DEC(10,2)) AS 'media',
CONVERT(MIN(p.vlpedido), DEC(10,2)) AS 'menor valor',
CONVERT(MAX(p.vlpedido), DEC(10,2)) AS 'maior valor',
COUNT(*) AS 'Total de Pedidos'
FROM tb_pedidos p INNER JOIN tb_pessoas pes USING(idpessoa)
GROUP BY pes.idpessoa ORDER BY SUM(p.vlpedido);

/*HAVING COMPLEMENTO DO GROUP BY HAVING SIGNIFICA TENDO*/
SELECT pes.desnome,
SUM(p.vlpedido) AS 'Total',
CONVERT(AVG(p.vlpedido), DEC(10,2)) AS 'media',
CONVERT(MIN(p.vlpedido), DEC(10,2)) AS 'menor valor',
CONVERT(MAX(p.vlpedido), DEC(10,2)) AS 'maior valor',
COUNT(*) AS 'Total de Pedidos'
FROM tb_pedidos p INNER JOIN tb_pessoas pes USING(idpessoa)
GROUP BY pes.idpessoa 
HAVING SUM(p.vlpedido) > 5000
ORDER BY SUM(p.vlpedido);
