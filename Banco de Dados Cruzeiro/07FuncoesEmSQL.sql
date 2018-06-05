/*funcoes*/

/*Manuseando Valores Nulos NVL */
SELECT First_Name, Last_Name,  Salary*12+Commission_pct SALARIO_ANUAL FROM Employees;

/*NVL converte valores NULLS para NÃO NULLS - ASSIM COMO QUALQUER VALOR ----> NÃO FUNCIONA NO MYSQL*/
SELECT First_Name, Last_Name,  Salary*12+ NVL(Commission_pct,0)) AS 'SALARIO_ANUAL' FROM Employees;

/*COALESCE converte valores NULLS para NÃO NULLS - ASSIM COMO QUALQUER VALOR  ----> NÃO FUNCIONA NO MYSQL*/
SELECT First_Name, Last_Name,  Salary*12+ COALESCE(Commission_pct,0)) AS 'SALARIO_ANUAL' FROM Employees;

/*LOWER converte um campo ou expressão para minusculo*/
SELECT LOWER(department_name), LOWER('BANCO DE DADOS') FROM DEPARTMENTS;

SELECT First_name, Salary FROM employees WHERE lower(First_name) = 'steven' ;

/*UPPER Converte um campo ou expressão para maiusuculo*/
SELECT UPPER(First_Name), Upper(Last_Name) FROM EMPLOYEES;

SELECT First_name, Salary FROM employees WHERE UPPER(First_name) = 'STEVEN';

/*INITCAP(COL/VAL)Converte as iniciais de cada palavra para maiusuculo -NÃO FUNCIONA NO MYSQL PESQUISAR QUAL É ELA*/
SELECT 'Nome: ' || InitCap(First_Name || ' ' || Last_Name) Nome FROM EMPLOYEES;

/*SUBSTR(col/valor,pos,n) – Retorna parte de uma expressão, tendo como parâmetro a posição inicial (pos) e a quantidade de caracteres (n). */
SELECT First_Name, Last_Name Nome, Substr(First_Name , Last_Name,2,3)  FROM EMPLOYEES;

/*Instr(col/valor,’caracter’) – Retorna a posição da primeira ocorrência do caracter. ou Instr(col/valor,’caracter’,pos,n)
 – Retorna a posição da “n” ocorrência do caracter a partir da posição “pos”.*/
SELECT Department_name,
 Instr(Upper(Department_name),'A'),
 Instr(Upper(Department_name),'ES'),
 Instr(Upper(Department_name),'A',1,2)
 FROM Departments;

 /*Retorna o numero de caracteres de uma expressão de campo*/
 SELECT Department_name, LENGTH(Department_name) FROM Departments;
 
 /*Translate Translate(col/valor,de,para)  substitui o campo pelos itens passados pelo paramentro - no exemplo substitui L por x*/
 SELECT First_Name,TRANSLATE(Upper(First_name),'L','X') FROM Employees;
 
/*Replace(col/valor,de,para) – Substitui a expressão “de”, para a expressão “para”. Se o parâmetro para for omitido o mesmo será removido.*/
 SELECT Job_Title, REPLACE(Job_Title,'Finance Manager','Gerente Financeiro'), REPLACE(Job_Title,'nt','XX') FROM Jobs;
 
 /*ROUND Round(col/valor,n) – Arredonda o valor com “n” casas decimais. Se “n” for omitido não será definido casas decimais. Valores de 5 ou superior,
 arredondará para cima e inferiores a 5 o arredondamento será para baixo*/
 SELECT ROUND(45.923,1), ROUND(45.923), ROUND(45.323,1), ROUND(45.323,-1), Salary/32, ROUND(Salary/32,2) FROM Employees;

/*Trunc(col/valor,n) – Trunca o valor com “n” casas decimais. Se “n” for omitido não será definido casas decimais.
Funções Numéricas*/
SELECT Trunc(45.923,1), Trunc(45.923), Trunc(45.323,1), Trunc (45.323,-1), Salary/32, Trunc(Salary/32,2) FROM Employees;

/*POWER Power(col/valor,n) – Eleva um campo ou valor na potência definida em “n”.*/
SELECT Power(Salary,2),Power(Salary,2),Power(50,2) FROM Employees Where Department_id = 30;

/*SQRT Sqrt(col/valor) – Retorna a raiz quadrada do campo ou valor informado.*/
SELECT SQRT(Salary),SQRT(65536),SQRT(Commission_pct) FROM Employees Where Department_id = 30;

/*MOD Mod(col/valor,valor2) – Retorna o resto da divisão do campo ou valor pelo “valor2”*/
 SELECT Salary,Commission_pct*33,MOD(Salary,Commission_pct*33), MOD(100,40) FROM Employees Where Commission_pct <> 0;
 
 /*SUM Retorna a soma de N AVG Retorna a média aritmética de N COUNT Retorna o número de linhas da consulta.
 MAX Retorna o valor máximo de N MIN Retorna o valor mínimo de N*/
 SELECT sum(Salary), avg(Salary), count(*), min(Salary), max(Salary) FROM employees;

 /*Count*/
 SELECT count(*) FROM employees WHERE Salary > 10000;
 
/*TO_CHAR(data,’mascara’) – Especifica que a data está sendo convertida para um novo formato na saída.*/
 /*A função TO_CHAR é freqüentemente usada para modificar um formato de data padrão para um formato alternativo. */
 SELECT TO_CHAR(SYSDATE,'DAY DDTH MONTH YYYY') FROM DUAL;

/*OBS.: SYSDATE retorna a data e hora atual.*?*/

/*TO_CHAR pode também ser usado para extrair o horário de um único dia, e mostrá-lo no especificado formato.
Para mostrar o horário de uma respectiva data:*/

SELECT TO_CHAR(SYSDATE,'HH:MI:SS') FROM DUAL;

/*OBS DUAL TABELA INTERNA APENAS PARA TESTE NÃO TEM NO SQLYOG*/







