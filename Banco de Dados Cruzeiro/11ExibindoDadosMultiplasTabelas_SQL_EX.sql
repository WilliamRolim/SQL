/* Exibir os correntistas que morem no município de "SAO PAULO" e que
nasceram no município de “CARAGUATATUBA”, mostrando o nome
do mesmo, data de nascimento, endereço, número do endereço, número da conta, saldo
e tipo de conta. (1,0)*/




/*5)Exibir os correntistas que morem no município de "SAO PAULO" e que
nasceram no município de “CARAGUATATUBA”, mostrando o nome
do mesmo, data de nascimento, endereço, número do endereço, número da conta, saldo
e tipo de conta. (1,0)*/

select cor.NM_NOME, m.NM_MUNICIPIO, c.ID_TIPO_CONTA, l.NM_NOME from tab_correntista cor
INNER JOIN tab_conta c
ON cor.ID_CORRENTISTA = c.ID_CONTA
INNER JOIN TAB_CONTA con
ON c.ID_TIPO_CONTA = con.ID_TIPO_CONTA
INNER JOIN TAB_LOGRADOURO l
on cor.ID_CEP = l.ID_CEP
INNER JOIN TAB_MUNICIPIO m
ON l.ID_MUNICIPIO = m.ID_MUNICIPIO
INNER JOIN TAB_ESTADO e
ON m.ID_UF = e.ID_UF
WHERE m.ID_UF = 'SP';

/*6)Exibir a quantidade de clientes Júridicos e
Físicos. (Em um único select )
CD_TIPO_CORRENTISTA = F -> Físico
CD_TIPO_CORRENTISTA = J -> Jurídico.
(1,0)
*/

SELECT cd_tipo_correntista, count(cd_tipo_correntista) as "Tipo de correntista" FROM tab_conta
where CD_TIPO_CORRENTISTA = 'F' OR CD_TIPO_CORRENTISTA = 'J'
GROUP by CD_TIPO_CORRENTISTA;

/*7)Exibir a quantidade de contas, a média, o
maior, o menor e a somatória do saldo por
agência, mostrando o nome da agência e os
totais acima. (1,0)
*/

select * from tab_conta;
/*8)Exibir a quantidade de contas, a média, o
maior, o menor e a somatória do saldo por
agência, mostrando o nome da agência e os
totais acima. (1,0)
*/
select COUNT(c.VL_SALDO) as "Contagem das contas", AVG(c.vl_saldo) as "Media das contas", MAX(c.vl_saldo) as "Maior",
MIN(c.vl_saldo) as "Menor" ,SUM(c.vl_saldo), ba.NM_AGENCIA as "Nome agencia" from tab_conta c 
INNER JOIN tab_banco_agencia ba
ON c.ID_AGENCIA = ba.ID_AGENCIA
and c.ID_BANCO = ba.ID_BANCO
group by ba.NM_AGENCIA;

/*9Exibir a quantidade de correntistas por sexo*/

select * from TAB_CORRENTISTA;

SELECT COUNT(ds_sexo) as "Qtd de sexo" from tab_correntista
where ds_sexo = 'M' or DS_SEXO = 'F'
group by ds_sexo;


/*10Exibir os correntista que são do sexo
Masculino, da agência SAO CARLOS
(NOME DA AGENCIA) e que tenham o
saldo maior que R$ 115,00 exibindo o nome
do correntista, data de nascimento e saldo da
conta. (1,0)*/

SELECT co.NM_NOME, co.DT_NASCIMENTO, c.VL_SALDO FROM tab_conta c
INNER JOIN tab_banco_agencia ba
ON c.ID_AGENCIA = ba.ID_AGENCIA
and c.id_banco = ba.ID_BANCO
inner join TAB_CORRENTISTA co
on c.ID_CORRENTISTA = co.ID_CORRENTISTA
WHERE co.DS_SEXO = 'M' AND ba.NM_AGENCIA='SAO CARLOS' and c.VL_SALDO > 115;

/*)11)Exibir o banco, nome da agência, número da
conta, saldo da conta, nome do correntista,
data de nascimento, dos correntistas que tem
conta do tipo CONTA CORRENTE, do sexo
Masculino e que morem na Unidade
Federativa de SP. (1,0)*/

SELECT * FROM TAB_BANCO_AGENCIA ba
INNER JOIN tab_conta c
ON ba.ID_BANCO = c.ID_BANCO
and ba.ID_AGENCIA = c.ID_AGENCIA
INNER JOIN  TAB_BANCO b
on c.ID_BANCO = b.ID_BANCO
INNER JOIN TAB_CORRENTISTA co
on c.ID_CORRENTISTA = co.ID_CORRENTISTA
INNER JOIN TAB_TIPO_CONTA tp
on c.ID_TIPO_CONTA = tp.ID_TIPO_CONTA
INNER JOIN TAB_MUNICIPIO m
ON  co.ID_MUNICIPIO = m.ID_MUNICIPIO
where tp.NM_TIPO_CONTA = 'CONTA CORRENTE'
AND DS_SEXO = 'M';


/*12)Exibir as contas,(Número da conta, nome do
banco e agência), saldo e nome do
correntista, das contas que são do tipo
"CONTA CORRENTE". (1,0)
*/
select C.ID_CONTA, B.NM_BANCO, A.NM_AGENCIA, C.VL_SALDO, COR.NM_NOME from TAB_BANCO_AGENCIA A
INNER JOIN TAB_CONTA C
on A.ID_BANCO = C.ID_BANCO
AND A.ID_AGENCIA = C.ID_AGENCIA
INNER JOIN TAB_BANCO B
ON C.ID_BANCO = B.ID_BANCO
INNER JOIN TAB_CORRENTISTA COR
ON C.ID_CORRENTISTA = COR.ID_CORRENTISTA
INNER JOIN TAB_TIPO_CONTA TC
ON C.ID_TIPO_CONTA = TC.ID_TIPO_CONTA
WHERE TC.NM_TIPO_CONTA = 'CONTA CORRENTE';

/*13) Exibir a quantidade de correntistas existentes por mês de aniversário, mostrando
o mês e a quantidade de correntistas*/

SELECT COUNT(ID_CORRENTISTA) AS "QTD Correntistas", TO_CHAR(DT_NASCIMENTO, 'MONTH')
FROM TAB_CORRENTISTA
GROUP BY TO_CHAR(DT_NASCIMENTO, 'MONTH');

/*14) Exibir as agências do "BANCO DO BRASIL S/A", mostrando o nome da agência, o
endereço, número do endereço, município e nome da UF. (1,0)*/

SELECT ba.NM_AGENCIA,l.NM_NOME,ba.NR_ENDERECO,l.NM_NOME,l.ID_MUNICIPIO FROM TAB_BANCO_AGENCIA ba
INNER JOIN TAB_LOGRADOURO l
ON ba.ID_CEP = l.ID_CEP
INNER JOIN TAB_MUNICIPIO m
on l.ID_MUNICIPIO = m.ID_MUNICIPIO
INNER JOIN TAB_BANCO b
on ba.ID_AGENCIA = b.ID_BANCO
WHERE b.NM_BANCO = 'BANCO DO BRASIL S/A';
