

/*Selecionar o número da conta, dígito da conta, saldo, nome do banco, nome da
agencia, e o tipo da conta do correntista "ADALTON ISIDORO". (1,0)*/

select ba.ID_BANCO,ba.ID_AGENCIA, c.VL_SALDO , b.NM_BANCO, ba.NM_AGENCIA, tc.NM_TIPO_CONTA, cor.NM_NOME
from TAB_BANCO_AGENCIA ba INNER JOIN tab_conta c
ON ba.ID_AGENCIA = c.ID_AGENCIA and ba.ID_BANCO = c.ID_BANCO
INNER JOIN TAB_BANCO b
on c.ID_BANCO = b.ID_BANCO
inner join TAB_TIPO_CONTA tc
on c.id_tipo_conta = tc.ID_TIPO_CONTA
inner join tab_correntista cor
on c.id_correntista = cor.ID_CORRENTISTA
where cor.NM_NOME = 'ADALTON ISIDORO';



/*Exibir a quantidade de municípios por unidade federativa, mostrando o nome da
unidade federativa e a quantidade de municípios, ordenado pelo nome da unidade
federativa. (1,0)*/

select e.nm_uf, COUNT(m.ID_MUNICIPIO) as "Quantidade de municipios" from tab_Municipio m
INNER JOIN TAB_ESTADO e
on e.ID_UF = m.ID_UF group by e.NM_UF /* group by quando quero saber o subtotal*/
order by e.nm_uf;

select * from tab_banco;
select * from tab_banco_agencia;
select * from TAB_CONTA;
select * from tab_correntista;/*nome,dt_nascimento,nr_numero,*/
select * from TAB_TIPO_CONTA;
select * from tab_municipio;
select * from tab_estado;
select * from tab_logradouro;

/*Exibir o nome do correntista(c), o município de nascimento(municipio), a descrição da UF de
nascimento(municipio), a data de nascimento(c), endereço (tipo, e nome)(logradouro) e o número do endereço dos 
correntistas que nasceram no ano de 1971. (1,0)*/
select * from tab_correntista;

select c.NM_NOME, m.NM_MUNICIPIO, m.ID_UF, l.NM_NOME,c.DT_NASCIMENTO, l.DS_TIPO, l.NM_NOME, c.NR_NUMERO
from tab_correntista c
INNER JOIN TAB_MUNICIPIO m
ON c.ID_MUNICIPIO = m.ID_MUNICIPIO
inner join TAB_LOGRADOURO l
ON c.ID_CEP = l.ID_CEP
where c.DT_NASCIMENTO LIKE '%71';

SELECT COR.NM_NOME, MUN.NM_MUNICIPIO, MUN.ID_UF, COR.DT_NASCIMENTO, LOG.DS_TIPO, LOG.NM_NOME, COR.NR_NUMERO
FROM TAB_CORRENTISTA COR
INNER JOIN TAB_MUNICIPIO MUN 
            ON COR.ID_MUNICIPIO = MUN.ID_MUNICIPIO
INNER JOIN TAB_LOGRADOURO LOG 
            ON COR.ID_CEP = LOG.ID_CEP
WHERE COR.DT_NASCIMENTO LIKE '%71';

/*Exibir a quantidade de contas por tipo de conta, exibindo o tipo e a quantidade,
somente dos tipos que tiverem mais de 100 contas por tipo de conta. (1,0)*/

SELECT COUNT(c.ID_TIPO_CONTA), tp.nm_tipo_conta FROM TAB_CONTA c
inner JOIN TAB_TIPO_CONTA tp
ON c.ID_TIPO_CONTA = tp.ID_TIPO_CONTA
group by tp.NM_TIPO_CONTA;

/*Exibir os correntistas (Número da conta,
nome do correntista, nome do banco, data de
nascimento, saldo, endereço da agencia e
número do endereço da agencia) das agências
com nome "MONTE MOR".*/

select C.ID_CONTA, COR.NM_NOME, COR.DT_NASCIMENTO, C.VL_SALDO,A.NM_AGENCIA,A.NR_ENDERECO
FROM TAB_BANCO_AGENCIA A
INNER JOIN TAB_CONTA C 
ON A.ID_AGENCIA = C.ID_AGENCIA AND
A.ID_BANCO = C.ID_BANCO
INNER JOIN TAB_BANCO B
ON C.ID_BANCO = B.ID_BANCO
INNER JOIN TAB_CORRENTISTA COR
ON C.ID_CORRENTISTA = COR.ID_CORRENTISTA
WHERE A.NM_AGENCIA='MONTE MOR';

/*Exibir os correntistas que morem no município de "SAO PAULO" e que
nasceram no município de “CARAGUATATUBA”, mostrando o nome
do mesmo, data de nascimento, endereço,
número do endereço, número da conta, saldo
e tipo de conta. (1,0)*/

SELECT C.NM_NOME, C.DT_NASCIMENTO, L.NM_NOME,COR.NR_NUMERO,  FROM TAB_CORRENTISTA C
INNER JOIN TAB_MUNICIPIO M
ON C.ID_MUNICIPIO = M.ID_MUNICIPIO
INNER JOIN TAB_ESTADO E
ON M.ID_UF = E.ID_UF
INNER JOIN TAB_LOGRADOURO L
ON C.ID_CEP = L.ID_CEP
INNER JOIN TAB_CORRENTISTA COR
ON L.ID_CEP = C.ID_CEP
INNER JOIN TAB_CONTA C;


select * from tab_banco;
select * from tab_banco_agencia;
select * from TAB_CONTA;
select * from tab_correntista;/*nome,dt_nascimento,nr_numero,*/
select * from TAB_TIPO_CONTA;
select * from tab_municipio;
select * from tab_estado;
select * from tab_logradouro;






