SELECT DEPARTMENT_ID,DEPARTMENT_NAME,
        LOCATION_ID, CITY
FROM HR.DEPARTMENTS
NATURAL JOIN HR.LOCATIONS
WHERE DEPARTMENT_NAME LIKE 'S%' AND
    LOCATION_ID BETWEEN 1000 AND 2000;

SELECT l.CITY, d.DEPARTMENT_NAME FROM HR.LOCATIONS 
l JOIN HR.DEPARTMENTS d USING (LOCATION_ID)
WHERE LOCATION_ID IN(1400,1500,1600);

SELECT EMPLOYEE_ID,
       DEPARTMENT_NAME,
       JOB_TITLE
       FROM HR.EMPLOYEES,HR.DEPARTMENTS,HR.JOBS
WHERE HR.EMPLOYEES.DEPARTMENT_ID = HR.DEPARTMENTS.DEPARTMENT_ID
   AND EMPLOYEES.JOB_ID = JOBS.JOB_ID;
   
SELECT EMPLOYEE_ID,
       DEPARTMENT_NAME
FROM HR.EMPLOYEES 
INNER JOIN HR.DEPARTMENTS ON HR.EMPLOYEES.DEPARTMENT_ID = HR.DEPARTMENTS.DEPARTMENT_ID
INNER JOIN HR.JOBS ON HR.EMPLOYEES.JOB_ID = JOBS.JOB_ID
WHERE SALARY BETWEEN 1400 AND 5000;

SELECT * FROM HR.EMPLOYEES E RIGHT JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT D.DEPARTMENT_NAME,SUM(SALARY) FROM HR.EMPLOYEES E RIGHT JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME;

SELECT E.LAST_NAME, E.DEPARTMENT_ID,D.DEPARTMENT_NAME FROM HR.EMPLOYEES E LEFT JOIN HR.DEPARTMENTS D ON
(E.DEPARTMENT_ID = D.DEPARTMENT_ID);