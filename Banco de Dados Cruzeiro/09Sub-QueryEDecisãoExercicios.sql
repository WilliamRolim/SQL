/*a) Mostrar o nome, a data de admissão, cargo e o cod. do depto de todos os empregados que tenham o mesmo depto que o funcionário de nome Steven King. Tabela employees. */

SELECT first_name, hire_date,job_id,department_id 
FROM employees 
WHERE department_id = (
SELECT department_Id 
FROM employees 
WHERE first_name="Steven" AND last_name="king"); 

/*b) Mostrar o nome, cod. depto e cargo de todos os empregados que trabalhem nos departamentos que fazem parte da cidade “Toronto”. 
Tabelas: Employees, departments e locations. */

SELECT e.first_name, e.department_id,e.job_id 
FROM employees e
WHERE e.department_id = (
SELECT d.department_id 
FROM departments d
WHERE d.location_id = (
SELECT l.location_id 
FROM locations l
WHERE l.city ='Toronto'));

/*c) Exibir cod. do depto, nome, cargo de todos os empregados que pertençam ao departamento denominado ‘Sales’. Tabelas employees e departments. */

SELECT department_id, first_name,last_name, job_id 
FROM employees
WHERE department_id = 
(SELECT department_id 
FROM departments
WHERE department_name = "Sales");

/*d) Selecionar nome, cargo e salário de todos os empregados cujo salário seja maior que a média salarial de todos os empregados. */

SELECT first_name, last_name, job_id, salary,department_id FROM employees WHERE
salary > (SELECT AVG(salary) FROM employees);/*6461.682243*/

/*e) Exibir, nome, salário, data de admissão e cod. depto de todos os empregados que trabalhem no mesmo depto que o funcionário de nome Steven King 
e tenham o salário menor que a média salarial dos empregados.*/


SELECT first_name,last_name,job_id, salary, hire_date,department_id
FROM employees
WHERE department_id = (SELECT department_id
FROM employees
WHERE first_name ='Steven' AND salary < (SELECT AVG(salary) /*24000.00*/
 FROM employees));

/*1) Crie uma querie que mostre o  número do empregado, o último nome e o salário de todos os empregados 
que ganhem mais  que a média salarial. Ordenar o resultado em ordem crescente de salários. Seguir alias conforme cabeçalho.*/
SELECT * FROM employees;

SELECT employee_id AS "Número do Empregado",last_name AS "Ultimo Nome", salary AS "Salario"
FROM employees
WHERE salary > (
SELECT AVG(salary) FROM employees);

/*2) Crie uma querie que mostre o último nome, o número do departamento e o código do cargo de todos os empregados 
cuja localização do departamento seja igual a 1700*/

SELECT employee_id AS "Numero do Empregado", last_name AS "Ultimo Nome",department_id AS "Departamento" ,job_id  AS "Cargo"
FROM employees
GROUP BY d.department_id
HAVING department_id =(
SELECT d.department_id 
FROM departments d
WHERE d.location_id = 1700
)

/*2) Crie uma query que mostre o último nome, o número do departamento e o código do cargo de todos os empregados 
cuja localização do departamento seja igual a 1700*//*REVER ESSE EXERCICIO */

SELECT last_name AS "Ultimo Nome", department_id AS "Número do departamento",manager_id AS "Codigo do Cargo"
FROM employees
WHERE department_id IN (30,90,100);

SELECT last_name AS "Ultimo Nome", department_id AS "Número do departamento",manager_id AS "Codigo do Cargo"
FROM employees
WHERE department_id = (SELECT department_id
FROM departments 
WHERE department_id
HAVING location_id = 1700
)

/*3) Pesquise na tabela locations (retorne CITY e STATE_PROVINCE) aplicando uma funçao de decisão  no campo State_Province seguindo a instrução abaixo.
Se STATE_PROVINCE for igual a                   Valor Retornado (Criar uma alias para a coluna de retorno Retorno_Decode)
 Washington                                     A String ‘Bem vindo a Casa Branca’
  Texas                                         A String ‘Olá Cowboy ’ 
  California                                    O campo cidade (CITY) 
  New Jersey                                    O campo Street_Address
 */
 SELECT city, state_province,
CASE 
WHEN state_province = "Washington" THEN "Bem vindo a casa Branca"
WHEN state_province = "Texas" THEN "Olá Cowboy from HELL"
WHEN state_province = "California" THEN "O campo cidade"
WHEN state_province = "New Jersey" THEN "O campo doce" 
ELSE
"NÃO CLASSIFICADO"
END CLASSIFICACAO
FROM locations;

/*4) Pesquise na tabela employees (retorne o last_name e o salary) usando uma  função  de decisão  no campo  Salary seguindo a instrução abaixo.

SALARIO                                    Novo Salário
 >= 4200 e <=6000                          Aumento de 10% 
 >=9000 e <=17000 			   Aumento de 20%
  Outros casos                             Retorna o salario atual*/
  
SELECT last_name, salary,
CASE
WHEN salary >= 4200 AND salary <= 6000 THEN "Aumento de 10%"
WHEN salary >= 9000 AND salary <= 17000 THEN "Aumento de 20%"
ELSE
salary
END Classificacao
FROM employees;

/*Crie uma querie que mostre o último nome e o salário de todos os funcionários que tenham o King como gerente*/

SELECT * FROM employees;
SELECT * FROM departments;
SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID ,salary  FROM EMPLOYEES WHERE manager_id = ANY (
SELECT MANAGER_ID FROM departments);


/*Crie uma querie que mostre o número do departamento, o último nome e o código do cargo para cada empregado que esteja no departamento ‘Executive’*/
SELECT department_id, last_name, job_id
FROM employees
WHERE department_id = (SELECT department_id
FROM departments
WHERE department_name = "Executive");




