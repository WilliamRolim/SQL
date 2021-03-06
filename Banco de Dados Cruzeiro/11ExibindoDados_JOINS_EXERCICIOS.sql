CREATE DATABASE banco;

USE banco;

CREATE TABLE agencia (/*Terceira tabela a ser criada por ter FK porém a tabela estado já foi criada*/
id_banco INT,
id_agencia INT,
nm_agencia VARCHAR(10) NOT NULL,
nr_digito_agencia INT NOT NULL,
nr_endereco VARCHAR (15) NOT NULL,
id_cep CHAR(8) NOT NULL,
CONSTRAINT Agencia_idbanco_idagencia_PK PRIMARY KEY (id_banco,id_agencia),
CONSTRAINT Agencia_Logradouro_idcep_FK FOREIGN KEY (id_cep)
REFERENCES logradouro (id_cep),
CONSTRAINT Agencia_Banco_id_banco_FK FOREIGN KEY (id_banco)
REFERENCES banco(id_banco)
);

CREATE TABLE banco (/*primeira tabela a ser criada por não ter FK*/
id_banco INT,
nm_banco VARCHAR(20) NOT NULL,
CONSTRAINT Banco_idbanco_PK PRIMARY KEY (id_banco)
);

CREATE TABLE logradouro(/*QUarta tabela a ser criada por ter FK porém a tabela Municipio já foi criada*/
id_cep CHAR(8),
id_municipio INT ,
ds_tipo VARCHAR(10),
ds_titulo VARCHAR(14),
nm_nome VARCHAR(20) NOT NULL,
CONSTRAINT Logradouro_idcep_PK PRIMARY KEY (id_cep),
CONSTRAINT Lougradouro_Municipio_idmunicipio_FK FOREIGN KEY (id_municipio)
REFERENCES municipio(id_municipio)

);


CREATE TABLE municipio(/*Terceira tabela a ser criada por ter FK porém a tabela estado já foi criada*/
id_municipio INT,
id_uf CHAR(2) NOT NULL,
nm_municipio VARCHAR(15)NOT NULL,
CONSTRAINT Municipio_idmunicipio_PK PRIMARY KEY (id_municipio),
CONSTRAINT Municipio_Estado_iduf_FK FOREIGN KEY (id_uf)
REFERENCES estado (id_uf)
);

CREATE TABLE estado(/*segunda tabela a ser criada por não ter FK*/
id_uf CHAR(2),
nm_uf VARCHAR(10)NOT NULL,
CONSTRAINT Estado_iduf_PK PRIMARY KEY (id_uf)
);

CREATE TABLE correntista(/*Quinta tabela a ser criada por ter FK porém a tabela MUNICIPIO E LOGRADOURO já foi criada*/
id_correntista INT,
nm_nome VARCHAR(14),
dt_nascimento DATE,
ds_sexo CHAR(1),
nr_numero VARCHAR(14),
id_municipio INT,
id_cep CHAR(8),
CONSTRAINT Correntista_idcorrentista_PK PRIMARY KEY (id_correntista),
CONSTRAINT Correntista_Municipio_id_municipio_FK FOREIGN KEY (id_municipio)
REFERENCES municipio(id_municipio),
CONSTRAINT Correntista_Logradouro_id_cep_FK FOREIGN KEY (id_cep)
REFERENCES logradouro(id_cep)

);

CREATE TABLE conta (
id_correntista INT,
id_banco INT,
id_conta VARCHAR(5),
id_agencia INT,
nr_digito_conta CHAR(1) NOT NULL,
id_tipo_conta INT ,
cd_tipo_correntista CHAR(1) NOT NULL,
vl_saldo FLOAT NOT NULL,
CONSTRAINT Conta_idconta_PK PRIMARY KEY (id_conta),
CONSTRAINT Conta_Agencia_idagencia_idbanco_FK FOREIGN KEY (id_agencia,id_banco)
REFERENCES agencia (id_agencia,id_banco),
CONSTRAINT Conta_Correntista_id_correntista_FK FOREIGN KEY(id_correntista)
REFERENCES correntista (id_correntista),
CONSTRAINT Conta_Banco_idbanco_FK FOREIGN KEY (id_banco)
REFERENCES banco(id_banco),
CONSTRAINT Conta_Tipoconta_idtipoconta_FK FOREIGN KEY (id_tipo_conta)
REFERENCES tipoconta(id_tipo_conta)
);

SHOW TABLES;
CREATE TABLE tipoconta(/*Sexta tabela a ser criada por não ter nenhuma FK*/
id_tipo_conta INT,
nm_tipo_conta VARCHAR(10),
CONSTRAINT Tipoconta_idtipoconta_PK PRIMARY KEY (id_tipo_conta)
);
DROP TABLE tipoconta;
SHOW TABLES;




/*VERSION 2 Refazendo exercicios*/


/*1)	Selecionar o número da conta, dígito da conta, 
saldo, nome do banco, nome da agencia, e o tipo da conta
do correntista "ADALTON ISIDORO". (1,0)*/

SELECT  c.ID_TIPO_CONTA, c.NR_DIGITO_CONTA, c.vl_saldo,b.NM_BANCO,ba.NM_AGENCIA,c.ID_TIPO_CONTA, co.NM_NOME
FROM tab_correntista co
INNER JOIN tab_conta c
ON co.ID_CORRENTISTA = c.ID_CORRENTISTA
INNER JOIN TAB_BANCO_AGENCIA ba
ON c.ID_BANCO = ba.ID_BANCO AND
c.ID_AGENCIA = ba.ID_AGENCIA
INNER JOIN TAB_BANCO b
ON ba.ID_BANCO = b.ID_BANCO
WHERE co.NM_NOME = 'ADALTON ISIDORO';

/*2)Exibir a quantidade de municipios por unidade federativa, 
mostrando o nome da unidade e a quantidade de municipios, 
ordenado pelo nome da unidade federativa*/

SELECT COUNT(m.ID_UF) as "Contagem De Estados por UF",e.NM_UF as "nome da UF"
FROM TAB_MUNICIPIO m
INNER JOIN TAB_ESTADO e
ON m.ID_UF = e.ID_UF
GROUP BY e.nm_uF
ORDER BY e.NM_UF;

/*3)	Exibir o nome do correntista, o município de nascimento,
a descrição da UF de nascimento, a data de nascimento, endereço
(tipo, e nome) e o número do endereço dos correntistas que nasceram
no ano de 1971. (1,0)*/
SELECT co.NM_NOME, m.ID_MUNICIPIO, m.NM_MUNICIPIO,co.DT_NASCIMENTO,l.DS_TITULO ,l.NM_NOME,co.NR_NUMERO
FROM TAB_CORRENTISTA co
INNER JOIN TAB_CONTA c
on co.ID_CORRENTISTA = c.ID_CORRENTISTA
INNER JOIN TAB_MUNICIPIO m
ON co.ID_MUNICIPIO = m.ID_MUNICIPIO
INNER JOIN TAB_ESTADO e
on m.ID_UF = e.ID_UF
INNER JOIN TAB_LOGRADOURO l
on co.ID_CEP = l.ID_CEP
WHERE co.DT_NASCIMENTO LIKE '%/71';


/*4)Exibir a quantidade de contas por tipo de conta, exibindo o tipo e a quantidade, 
somente dos tipos que tiverem mais de 100 contas por tipo de conta  */

SELECT COUNT(c.ID_TIPO_CONTA) as "Contagem tipo conta", tc.NM_TIPO_CONTA
from TAB_CONTA c
INNER JOIN TAB_CORRENTISTA co
on co.id_correntista = c.id_correntista
INNER JOIN TAB_TIPO_CONTA tc
ON c.ID_TIPO_CONTA = tc.ID_TIPO_CONTA
GROUP BY tc.NM_TIPO_CONTA
HAVING COUNT(c.ID_TIPO_CONTA) > 100;

/*5)Exibir os correntistas (Número da conta, nome do correntista, nome do banco, data de nascimento, saldo,
endereço da agencia e número do endereço da agencia) das agências com nome "MONTE MOR". */

SELECT TTC.NM_TIPO_CONTA,COUNT(TC.ID_TIPO_CONTA) FROM TAB_CONTA TC  LEFT JOIN TAB_TIPO_CONTA TTC ON TTC.ID_TIPO_CONTA = TC.ID_TIPO_CONTA 
GROUP BY TTC.NM_TIPO_CONTA 
HAVING COUNT(TC.ID_TIPO_CONTA) >100;

/*6)	Exibir os correntistas que morem no município de "SAO PAULO" 
e que nasceram no município de “CARAGUATATUBA”,
mostrando o nome do mesmo, data de nascimento,
endereço, número do endereço, número da conta, saldo e tipo de conta. (1,0)*/

select * from TAB_CORRENTISTA;select * from TAB_LOGRADOURO;select * from TAB_CONTA;select * from TAB_TIPO_CONTA, m.nm_municipio;
SELECT co.NM_NOME, co.DT_NASCIMENTO, co.DT_NASCIMENTO, l.NM_NOME, co.NR_NUMERO ,c.ID_CONTA,c.VL_SALDO, tp.NM_TIPO_CONTA,m.NM_MUNICIPIO,m.ID_UF
FROM TAB_CONTA c
INNER JOIN TAB_CORRENTISTA co
ON c.ID_CORRENTISTA = co.ID_CORRENTISTA
INNER JOIN TAB_LOGRADOURO l
ON co.ID_CEP= l.ID_CEP
INNER JOIN TAB_TIPO_CONTA tp
ON c.ID_TIPO_CONTA = tp.ID_TIPO_CONTA
INNER JOIN TAB_MUNICIPIO m
ON co.ID_MUNICIPIO = m.ID_MUNICIPIO
where m.nm_municipio ='CARAGUATATUBA' and m.ID_UF = 'SP';

/*7)Exibir a quantidade de clientes Júridicos e Físicos. (Em um único select ) 
CD_TIPO_CORRENTISTA = F -> Físico
CD_TIPO_CORRENTISTA = J -> Jurídico. (1,0)
*/


SELECT CD_TIPO_CORRENTISTA, COUNT(CD_TIPO_CORRENTISTA) AS "Tipos de Correntistas "
FROM TAB_CONTA
GROUP BY CD_TIPO_CORRENTISTA
HAVING (CD_TIPO_CORRENTISTA) = 'F' OR (CD_TIPO_CORRENTISTA) = 'J';

/*8)Exibir a quantidade de contas, a média, o maior, o menor e a somatória
do saldo por agência, mostrando o nome da agência e os totais acima. (1,0)*/

SELECT COUNT(c.id_conta),AVG(c.VL_SALDO),MAX(c.vl_saldo),MIN(c.vl_saldo), SUM(c.vl_saldo),ba.NM_AGENCIA
FROM TAB_CONTA c
LEFT JOIN TAB_BANCO_AGENCIA ba
ON c.ID_AGENCIA = ba.ID_AGENCIA
and c.ID_BANCO = ba.ID_BANCO
GROUP BY ba.NM_AGENCIA;

/*13)	Exibir a quantidade de correntistas existentes por mês de aniversário, 
mostrando o mês e a quantidade de correntistas. (1,0)*/


/*14)	Exibir as agências do "BANCO DO BRASIL S/A", mostrando o nome da agência,
o endereço, número do endereço, município e nome da UF. (1,0)*/
SELECT ba.NM_AGENCIA, l.NM_NOME,ba.NR_ENDERECO, m.ID_UF, e.NM_UF
FROM TAB_BANCO_AGENCIA  ba
INNER JOIN TAB_LOGRADOURO l
ON ba.ID_CEP = l.ID_CEP
INNER JOIN TAB_MUNICIPIO m
ON l.ID_MUNICIPIO = m.ID_MUNICIPIO
INNER JOIN TAB_ESTADO e
ON m.ID_UF = e.ID_UF
INNER JOIN TAB_BANCO b
ON ba.ID_AGENCIA = b.ID_BANCO
WHERE b.NM_BANCO = 'BANCO DO BRASIL S/A';

/*15)	Exibir os correntistas (Número da conta, nome do correntista, 
nome do banco, data de nascimento, saldo, endereço da agencia e número
do endereço da agencia) das agências do município de "SAO PAULO" e que
tenham saldo maior que R$ 2400,00 (1,0)*/
SELECT c.ID_CONTA, co.NM_NOME, b.NM_BANCO, co.DT_NASCIMENTO, c.VL_SALDO,l.NM_NOME, BA.NR_ENDERECO, co.NR_NUMERO, e.NM_UF
FROM TAB_BANCO_AGENCIA BA
INNER JOIN TAB_CONTA c
ON BA.ID_AGENCIA = c.ID_AGENCIA
AND BA.ID_BANCO = c.ID_BANCO
INNER JOIN TAB_CORRENTISTA co
ON c.ID_CORRENTISTA = co.ID_CORRENTISTA
INNER JOIN TAB_BANCO b
ON c.ID_AGENCIA = b.ID_BANCO
INNER JOIN TAB_MUNICIPIO m
ON co.ID_MUNICIPIO = m.ID_MUNICIPIO
INNER JOIN TAB_ESTADO e
ON e.ID_UF = m.ID_UF
INNER JOIN TAB_LOGRADOURO l
ON co.ID_CEP = l.ID_CEP
AND co.ID_MUNICIPIO = l.ID_MUNICIPIO
WHERE e.NM_UF = 'SAO PAULO' AND c.VL_SALDO > 2400;

/*16Exibir os correntistas que nasceram no município de "SAO JOSE DO RIO PRETO",
mostrando o nome do mesmo, data de nascimento, endereço, número do endereço,
município do endereço, número da conta, saldo e tipo de conta. (1,0)*/

SELECT co.NM_NOME, co.DT_NASCIMENTO, l.NM_NOME, co.NR_NUMERO, m.ID_UF, c.ID_CONTA, c.VL_SALDO, tc.NM_TIPO_CONTA, m.NM_MUNICIPIO
FROM TAB_CONTA c
INNER JOIN TAB_CORRENTISTA co
ON c.ID_CORRENTISTA = co.ID_CORRENTISTA
INNER JOIN TAB_LOGRADOURO l
ON co.ID_CEP = l.ID_CEP
inner join TAB_MUNICIPIO m
ON co.ID_MUNICIPIO = m.ID_MUNICIPIO
INNER JOIN TAB_TIPO_CONTA tc
ON c.ID_TIPO_CONTA = tc.ID_TIPO_CONTA
WHERE m.NM_MUNICIPIO = 'SAO JOSE DO RIO PRETO';

/*17)	Exibir a quantidade de clientes por banco, mostrando o nome 
do banco e a quantidade de clientes, ordenado pelo nome do banco (1,0)*/

SELECT COUNT(b.ID_BANCO) as "Quantidade de Clientes", b.NM_BANCO as "Nome do Banco"
FROM TAB_BANCO b
INNER JOIN TAB_CONTA c
ON b.ID_BANCO = c.ID_CONTA
GROUP BY b.NM_BANCO
ORDER BY b.NM_BANCO;

/*18)	Exibir os correntistas que nasceram em ano bissexto, 
mostrando o nome do mesmo, e data de nascimento. (1,0)*/


/*19)Exibir os correntistas que tem saldo superior
a R$ 2.450,00 mostrando o nome do mesmo,data de nascimento,
endereço, número do endereço,número da conta, saldo e tipo de conta. */

SELECT co.NM_NOME, co.DT_NASCIMENTO, l.NM_NOME, co.NR_NUMERO, c.ID_CONTA, c.VL_SALDO, tc.NM_TIPO_CONTA
FROM TAB_CONTA c
INNER JOIN TAB_CORRENTISTA co
ON c.ID_CORRENTISTA = co.ID_CORRENTISTA
INNER JOIN TAB_LOGRADOURO l
ON co.ID_CEP = l.ID_CEP
INNER JOIN TAB_TIPO_CONTA tc
ON c.ID_TIPO_CONTA = tc.ID_TIPO_CONTA
WHERE c.VL_SALDO > 2450;


select * from tab_banco;/*ID_BANCO NM_BANCO*/
select * from TAB_BANCO_AGENCIA;/* Id_Banco Id_Agencia (c Nm_Agencia Nr_Dig_Agencia Id_Cep Nr_Endereco */
select * from TAB_CONTA;/*Id_Correntista Id_Banco Id_Conta Id_Agencia Nr_Digito_Conta Cd_Tipo_CorrentistaId_Tipo_Conta Vl_Saldo*/
select * from TAB_CORRENTISTA;/*Id_Correntista Nm_Nome Dt_Nascimento Id_Municipio Ds_Sexo Id_Cep Nr_Numero*/   
select * from TAB_ESTADO; /*Id_UF Campo Chave Nm_UF*/
select * from TAB_LOGRADOURO;/*Id_Cep Id_Municipio Ds_Tipo Ds_Titulo Nm_Nome */
select * from TAB_MUNICIPIO;/*Id_Municipio Id_UF  Nm_Municipio*/
select * from TAB_TIPO_CONTA;/*Id_Tipo_Conta Nm_Tipo_Conta */


