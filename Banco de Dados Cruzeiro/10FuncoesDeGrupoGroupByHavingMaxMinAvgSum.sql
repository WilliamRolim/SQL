/*Funções de grupo*/

/*AVG Retorna a média aritmética de um grupo de registros*/

SELECT AVG(Salary) FROM Employees;/*Note que as linhas da tabela Employees são trilhadas num único grupo(uma única linha).*/

/*MIN retorna o valor minimo de uma tabela
MAX retorna o valor maximo de uma tabela
SUM retorna a soma de uma tabela*/

SELECT MIN(Salary), MAX(Salary), SUM(Salary) FROM Employees WHERE Department_ID = 30;

/*Retorna a quantidade de registros de um grupo de registros*/
SELECT Count(*) FROM   Employees WHERE  Department_ID = 30;

/*A CLÁUSULA GROUP BY*/
/*GROUP BY Para agrupar registros em subgrupos baseados em colunas ou valores retornados por uma expressao*/

SELECT first_name, last_name, job_id, salary FROM employees
GROUP BY job_id HAVING salary < 9000 ORDER BY first_name;

/*AGRUPANDO MAIS QUE UMA COLUNA */
SELECT department_id dept_id,job_id,SUM(salary) FROM  employees GROUP BY department_id, job_id ;

/*HAVING Para restringir grupos usamos a cláusula HAVING  estabelecer condições dentro dos grupos  */
/*Você não pode usar funções de grupo na cláusula WHERE */
SELECT first_name, last_name, job_id, salary FROM employees
GROUP BY job_id HAVING salary < 9000 ORDER BY first_name;

/*HAVING se você quiser especificar o qual grupo será mostrado. */

/*•A cláusula WHERE é condição para o SELECT 

•A cláusula HAVING é condição para um GROUP BY*/

SELECT Department_ID, AVG(Salary) FROM  Employees GROUP BY Department_ID HAVING AVG(Salary) > 6000 ORDER BY Department_ID;

/*Excluindo linhas quando estiver Usando o GROUP BY */
SELECT Department_ID, AVG(Salary) FROM   Employees Where Department_ID Not in (10,20,30) Group by Department_ID Order by Department_ID;

/*Para mostrar a quantidade de empregados que tenham o salário acima de 10000 NÃO NULOS por departamento, faça:*/

SELECT first_name, last_name, hire_date, job_id, comMission_pct
FROM employees GROUP BY job_id
HAVING MAX(salary) > 10000 AND (commisSion_pct)IS NOT NULL ;

/*WHERE Você pode unicamente usar WHERE para restringir linhas individuais. Para restringir colunas de grupos usa-se a cláusula HAVING */
/*------------------------------------------------------------------------------------------------------------------------------------------*/
/*Você pode limitar sua seleção incluindo somente os departamentos 10, 20, 30 e 40, usando a clausula WHERE quando estiver agrupando por departamento.*/
 
SELECT first_name, last_name, email,department_id
FROM employees
WHERE department_id IN(10,20,30,40)
GROUP BY department_id;

SELECT first_name, last_name, email,department_id
FROM employees
WHERE department_id IN(10,20,30,40)
GROUP BY department_id
HAVING MAX(salary) > 10000
ORDER BY first_name;

/*-------------------------------------------------------------EXERCICIOS-----------------------------------------------------------------*/

/*1. Encontre o maior, menor, soma e média salarial da tabela de empregados.  Dê alias para as colunas: Maior Salário, Menor Salário,
 Soma de Todos os Salários e Média Salarial.*/
 SELECT  MAX(salary) AS "Maior Salario", MIN(salary) AS "Menor Salario", SUM(salary)  AS "Soma Salarial", AVG(salary) AS "Media Salarial"
FROM employees;

/*2. Altere o exemplo 1 para agrupar por cargo e acrescente a quantidade de funcionários por função. Crie um alias para a quantidade
 de funcionários conforme abaixo.*/

SELECT  COUNT(employee_id) AS " Quantidade de Funcionarios",JOB_ID AS "Setor", MAX(salary) AS "Maior Salario", MIN(salary) AS "Menor Salario", 
SUM(salary)  AS "Soma Salarial", AVG(salary) AS "Media Salarial"
FROM employees GROUP BY salary;

/*3.  Determine o número de gerentes sem listá-los. Dê o nome do alias da coluna de “Número de Gerentes”*/
SELECT COUNT(employee_id) AS "Número de gerentes" FROM employees
GROUP BY job_id
HAVING job_id = "SH_CLERK";

/* Encontre a diferença entre o maior e o menor salário, de o alias para a coluna de diferença*/
SELECT MAX(salary)-MIN(SALARY) AS "Diferença"
FROM employees
ORDER BY salary;


 
 





