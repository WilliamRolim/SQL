/*Exibindo dados joins*/

/*-------------------------------NATURAL JOIN-----------------------------------------------*/

/*Se os nomes dos campos e os tipos de dados forem iguais então retorna a consulta com sucesso;*/
/*•Se os nomes forem iguais porém os tipos de dados forem diferentes, retorna erro.*/

SELECT department_id, department_name, location_id, city 
FROM   departments 
NATURAL JOIN locations ;

SELECT  department_id, department_name, location_id, city
FROM departments 
NATURAL JOIN locations
WHERE   department_id IN (20, 50);

 /*Quando temos várias colunas com o mesmo nome e tipos diferentes,  
 podemos escolher o campo de junção através do (USING).*/
 
 
SELECT l.city, d.department_name
 FROM   locations l 
 JOIN departments d 
 USING (location_id)
 WHERE  location_id = 1400;

 /*-------------------------------EQUI JOIN-----------------------------------------------*/

  /*Para ligar as duas tabelas Employees e Departments, faça: */
  
 SELECT  Employees.Employee_ID, Employees.Department_ID, Department_Name 
 FROM Employees, Departments 
 WHERE Employees.Department_ID =  Departments.Department_ID;
 
SELECT  e.Employee_ID, d.Department_ID, Department_Name 
FROM Employees e, Departments d
WHERE e.Department_ID =  d.Department_ID

 /*-------------------------------INNER JOIN-----------------------------------------------*/
/*INNER JOIN : Retorna as linhas quando houver pelo menos uma correspondencia em ambas as tabelas*/
/*junção interna*/

/*Para ligar as duas tabelas Employees e Departments utilizando INNER JOIN, faça:*/

 SELECT  Employees.Employee_ID, Employees.Department_ID, Department_Name
 FROM Employees
 INNER JOIN Departments
  ON Employees.Department_ID =  Departments.Department_ID;

 /*O uso do ALIAS simplifica a consulta. O ‘Alias’ também pode ser utilizado no comando
 select para apelidar tabelas conforme exemplo abaixo*/
 
 SELECT e.employee_id, e.last_name, d.location_id, department_id 
 FROM    employees e 
 JOIN departments d USING (department_id) ;
 
 
 /*Extraindo Dados de Mais de uma Tabela - Equi-Join*/
SELECT E.First_Name, E.Last_Name, D.Department_Name
FROM Employees E,Departments D 
WHERE E.Department_ID =D.Department_ID AND E.Department_ID = 30;

SELECT * FROM employees;
/*Utilizando o Inner Join em condições separadas*/
SELECT  E.department_id, E.First_Name, E.Last_Name, D.Department_Name 
FROM Employees E 
INNER JOIN  Departments D 
ON E.Department_ID =D.Department_ID 
WHERE   E.Department_ID = 30;

/*Join entre três Tabelas*/
SELECT employee_id, city, department_name
FROM employees e 
INNER JOIN    departments d 
ON     d.department_id = e.department_id 
INNER JOIN    locations l 
ON     d.location_id = l.location_id;

/*ou */
SELECT employee_id, city, department_name
FROM    employees e,  departments d,  locations l 
WHERE  d.department_id = e.department_id 
AND d.location_id = l.location_id;

CREATE TABLE job_grades (
grade 		CHAR(1),
lowest_sal 	INT NOT NULL,
highest_sal	INT NOT NULL
);

ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

SELECT * FROM job_grades;

SELECT e.last_name, e.salary, j.grade
FROM    employees e 
INNER JOIN  job_grades j 
ON e.salary 
BETWEEN j.lowest_sal AND j.highest_sal;

SELECT e.last_name, e.salary, j.grade
FROM employees e, job_grades j
WHERE e.`salary` BETWEEN j.`lowest_sal` AND j.`highest_sal`;

/*----------------------------------------OUTER JOIN-----------------------------------*/
/*/*Outer Join: retorna linhas mesmo quando não jouver pelo menos uma correspondia em uma das tabelas (ou ambas) 
(EX: Tenho o livro cadastrado mais não tenho o autor cadastrado do livro).o OUTER JOIN divide-se em LEFT JOIN, RIGHT JOIN e FULL JOIN;*/
 
/*RIGHT JOIN: Retorna todas as linhas da tabela á DIREITA, mesmo se não houver nenhuma correspondencia na tabela á ESQUERDA*/

/*Apresenta os departamentos  que tem e que não tem funcionários*/

SELECT e.last_name, d.department_id, d.department_name 
FROM    employees e
RIGHT JOIN  departments d
ON (e.department_id = d.department_id) ;

/*LEFT JOIN: Retorna todas as linhas da tabela á ESQUERDA, mesmo se não houver nenhuma correspondencia na tabela á direita*/

/*Apresenta os empregados  que tem e que não tem departamentos.*/

SELECT e.last_name, e.department_id, d.department_name
FROM employees e 
LEFT JOIN  departments d 
ON   (e.department_id = d.department_id) ;

/*FULL JOIN: Retorna  linhas quando houver uma correspondência em qualquer uma das tabelas. É uma combinação de LEFT e RIGHT JOINS*/

SELECT e.last_name, d.department_id, d.department_name
 FROM   employees e 
 FULL OUTER JOIN departments d 
 ON   (e.department_id = d.department_id);


 