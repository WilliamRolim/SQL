USE hr;
/*Selecionando informação no banco de dados - Comandos Especificos, DISTINCT, Between, In,Like,ORDER BY,AndeOR*/

SELECT DISTINCT department_id  FROM employees ORDER BY department_id;

/*DISTINCT elimina valores duplicados da tabela*/
SELECT distinct department_id FROM employees ORDER BY department_id;


/*Between compara uma faixa de valores inclusive o maior e o menor valor*/
Select First_name, Last_name, Salary FROM employees WHERE Salary BETWEEN 10000 AND 20000;

/*In compara valores especificos dentro de uma lista*/
SELECT first_name, last_name,email,phone_number,salary from employees where salary IN(2400.00,2600.00, 3100.00);

/*Like selecionar linhas atraves de parametros alfanumericos*/

/*Selecionar todos os empregados que COMECEM com a letra s*/
SELECT first_name, last_name from employees where first_name Like 's%';

/*SElecionar todos os empregados que TERMINEM com a letra s*/
SELECT first_name, last_name from employees where first_name LIKE '%S';

/*Selecionar uma busca exata em TODAS as palavras que tenham a LETRA S*/
SELECT first_name, last_name from employees where first_name LIKE '%S%';

/*O operador is null verifica que os operadores estão com os campos nulos */
SELECT First_name, Last_name, Salary, Manager_id FROM Employees WHERE Manager_id is null;

/*Expressões negativas podemos negar tudo o que foi estudado*/

/*NOT BETWEEN*/
Select First_name, Last_name, Salary FROM employees WHERE Salary NOT BETWEEN 10000 AND 20000;

/*NOT IN*/
SELECT first_name, last_name,email,phone_number,salary from employees where salary NOT IN(2400.00,2600.00, 3100.00);

/*NOT LIKE*/
SELECT first_name, last_name from employees where first_name NOT LIKE '%S%' AND last_name NOT LIKE '%A%';

/*NOT NULL*/
SELECT First_name, Last_name, Salary, Manager_id FROM Employees WHERE Manager_id is NOT null;



/*Operadores logicos AND = Espera APENAS UMA condição ser VERDADEIRA
	                 OR = APENAS UMA DAS CONDICOES seja VERDADEIRA*/
/*Você pode combinar AND E OR na mesma expressão , POREM o AND SERÁ EXECUTADO PRIMEIRO*/
				 
/*Para encontrar todos os escriturários do departamento SA_MAN que ganhem entre 20000 e 30000.*/
SELECT First_name, Last_name, Salary, Job_ID FROM Employees where Salary BETWEEN 10000 and 20000 and job_id ='SA_MAN';
SELECT First_name, Last_name, Salary, Job_ID FROM Employees where Salary BETWEEN 2000 and 3000 and job_id ='ST_CLERK';

/*Prioridades de operadores*/
SELECT First_name, Last_name, Salary, Job_ID FROM Employees WHERE Salary > 8000 and Job_id = 'ST_CLERK' OR Job_id = 'ST_MAN';

SELECT First_name, Last_name, Salary, Job_ID FROM Employees WHERE Salary > 8000 and (Job_id = 'ST_CLERK' OR Job_id = 'ST_MAN');

/*Order By Ordenar as linhas dos campos definidas de forma ascendente (A,B,C,D - 0, 1,2,3,4,5*/

SELECT First_name, Last_name, Salary FROM Employees where salary BETWEEN 10000 AND 20000 ORDER BY First_name;

/*Desc ordena de forma descrecente*/
SELECT First_name, Last_name, Salary FROM Employees where salary BETWEEN 10000 AND 20000 ORDER BY First_name DESC;

/*ORDER BY ORDENDANDO VARIAS COLUNAS*/
/*Para ordenar por duas colunas, e mostrar ordem inversa do salário, e ordem crescente do sobrenome faça:*/
 SELECT First_name, Last_name, Salary FROM Employees WHERE salary BETWEEN 10000 AND 20000 ORDER BY salary DESC,last_name;
 
 
 /*EXERCICIOS*/
 
 /*Liste todos os empregados que têm um salário (salary) entre 10000 e 20000. */
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 20000;

 /*• Liste os números e nomes dos departamentos ordenados por nome do departamento. (departaments*/
 SELECT department_id,first_name,last_name,job_id FROM employees ORDER BY job_id;
 
 /*• Liste todos os tipos diferentes de funções desempenhadas pelos empregados.*/
 SELECT job_id from employees;
 
/* • Liste a informação detalhada dos empregados dos departamentos 10 e 20 por ordem alfabética do nome.*/
SELECT * from employees WHERE department_id IN(10,20) ORDER BY first_name;

 /*• Liste os nomes e funções de todos os empregados de escritório (clerk) do departamento 50.*/
 SELECT first_name, job_id,department_id from employees where job_id = "ST_CLERK" and department_id = 50;
 
 /*• Apresente todos os nomes de empregados que tenham th ou ll.*/
 SELECT first_name, last_name from employees where first_name LIKE '%TH%' or '%ll%';
 
 /*• Liste o nome, função e salário para todos os empregados que tenham um chefe (mgr).*/
 SELECT first_name, last_name, job_id from employees where job_id like '%mgr';
 

/* Apresente o nome e a remuneração total (14 vezes o salário mais a comissão)
para todos os empregados.*/
SELECT first_name,(salary * 14 + commission_pct) AS "TOTAL" from employees WHERE commission_pct is NOT NULL;

/* Apresente todos os empregados que foram admitidos durante 1983.*/
select * from employees WHERE hire_date LIKE "%1998%";

/*  Liste o nome, salário anual (14 vezes o salário mensal) e comissão para todo o
pessoal de vendas (SA_MAN) cujo salário mensal for maior que a comissão.*/
select first_name, salary * 14 AS 'Salario Anual',commission_pct,job_id from employees WHERE job_id  = "SA_MAN" And salary > commission_pct;

/* employee_id, manager_id,department_id,first_name,last_name,email,phone_number,job_id,*/


