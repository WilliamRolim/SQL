/*09 Subquerys consultas externas RETORNA UM RESULTADO EXTERNO QUE irá servir como fonte de dados para uma nova consulta*/

/*Para encontrar todos os empregados do mesmo departamento do David Lee fazemos:*/

SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 
(SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME = 'David' AND LAST_NAME = 'Lee') 
ORDER BY FIRST_NAME

/*pesquisa atende para encontrar os empregados que ganham acima da média salarial.*/

											    /*Single Row retorno de um unico valor da Subquery*/												
SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE SALARY >  (SELECT AVG(SALARY) FROM EMPLOYEES) ORDER BY FIRST_NAME;

/*A seguinte pesquisa atende para encontrar os empregados que trabalham nos departamentos de Marketing e Administração.*/

SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID IN

 /*Multiple Row Subquery – Retorno de vários valores na subquerie*/
 
(SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME IN ('Marketing','Administration'))
ORDER BY FIRST_NAME;

/*Sub-pesquisas Aninhadas.
Mostrar o primeiro e último nome, cargo, código do departamento e salário para os empregados cujo o salário é maior que o maior salário no departamento ‘SALES’.
*/
SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE SALARY > ( 
SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = (
SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Sales')) ORDER BY FIRST_NAME

/* encontrar os empregados que tem no mínimo uma pessoa subordinada a ele*/
SELECT EMPLOYEE_ID, MANAGER_ID, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID, SALARY FROM EMPLOYEES E WHERE EXISTS (
SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE EMPLOYEES.MANAGER_ID = E. EMPLOYEE_ID) ORDER BY EMPLOYEE_ID;


/*Encontrar os empregados que não tem departamento relacionado na tabela DEPARTAMENTS:*/
SELECT EMPLOYEE_ID, MANAGER_ID, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE NOT EXISTS (
SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID);

/*Outro caminho para encontrar o departamento que não tem nenhum empregado :*/
SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS  D WHERE NOT EXISTS (
SELECT 'X' FROM EMPLOYEES E WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) ORDER BY 2;


/*ANY Compara o valor com cada valor retornado pela subquerie.
 • < ANY   = menor que o maior valor
 • > ANY = maior que o menor valor
*/

/*4200,4800,6000,9000 faixas salariais de it_prog*/

SELECT employee_id, last_name, job_id, salary,job_id FROM employees WHERE salary < ANY (
SELECT salary FROM   employees WHERE  job_id = 'IT_PROG') /*comparando que qualquer salario de todos funcionarios é MENOR que 'IT_PROG'*/
AND    job_id <> 'IT_PROG'; /*comparando que qualquer salario de todos funcionarios é DIFERENTE que 'IT_PROG'*/

/*ALL  Compara o valor com todos os valores retornados pela subquerie */
SELECT employee_id, last_name, job_id, salary FROM   employees WHERE  salary < ALL (
SELECT salary FROM   employees WHERE  job_id = 'IT_PROG')
 AND    job_id <> 'IT_PROG'; 
 
/* O exemplo abaixo mostra  os códigos de departamentos e os menores salários da tabela de empregados,
 agrupado por departamento,que tenha o menor salário maior que o menor salário dos funcionários do departamento 50.*/

 SELECT   department_id, MIN(salary) FROM employees GROUP BY department_id HAVING MIN(salary) > (
 SELECT MIN(salary) FROM   employees WHERE department_id = 50) ;/*2100 department id 50 pega o menor valor desse departamento = 2100*/
 
 
/*O seguinte exemplo decodifica os cargos dos tipos IT_PROG e CLERK unicamente. Os outros cargos serão padrão alterados para INDEFINIDO.*/
SELECT FIRST_NAME, JOB_ID, DECODE(JOB_ID,'IT_PROG','PROGRAMADOR', 'FI_ACCOUNT','CONTADOR', 'INDEFINIDO') DECODE_CARGO FROM EMPLOYEES;

/*mostrar a gratificação percentual dependendo da região*/
SELECT REGION_ID, DECODE(REGION_ID,1,'15%', 2,'10%', 3,'8%', '5%') BONUS FROM REGIONS;

/*Retornar o salário incrementado de acordo com o tipo de cargo.*/
SELECT FIRST_NAME, JOB_ID, SALARY, DECODE( JOB_ID,'IT_PROG',SALARY * 1.1, 'FI_ACCOUNT',SALARY * 1.2, 'AD_VP', SALARY * 0.95, SALARY) DECODE_CARGO FROM hr.EMPLOYEES

SELECT last_name, DECODE(department_id, 90,'Phoenix', 60, 'Denver', 100, 'St Louis', 'Albuquerque')FROM EMPLOYEES;


/*CASE*/
SELECT FIRST_NAME, JOB_ID, SALARY, 
CASE WHEN SALARY < 5000 THEN 'AUMENTO' /*THEN então*/
WHEN SALARY > 10000 THEN 'VERIFICAR' /*when quando*/
ELSE 'NÃO AUMENTAR' 
END CLASSIFICAÇÃO
FROM EMPLOYEES;

