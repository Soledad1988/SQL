-- 1 Consultas con SELECT
-- Consulta 1: Seleccionar todos los empleados de la tabla empleados
SELECT * FROM employee;

-- Consulta 2: Seleccionar nombre, apelldio y edad de los empleados
SELECT name, surname, age FROM employee;

-- Consulta 3: Seleccionar las sucursales
SELECT * FROM branch;

-- 2  Consultas con ORDER BY
-- Consulta 1: Ordenar empleados por edad (ascendente)
SELECT name, age FROM employee
ORDER BY age ASC;

-- Consulta 2: Ordenar los títulos de los empleos alfabéticamente 
SELECT job_title FROM job_title
ORDER BY job_title;

-- 3 Consultas con DISTINCT
-- Consulta 1: Cuantos niveles de satisfacción del empleado hay
SELECT DISTINCT employee_satisfaction FROM employee_transaction
ORDER BY employee_satisfaction;

-- 4. Consultas con LIMIT
-- Consulta 1: Mostrar los primeros 5 empleados
SELECT * FROM employee
LIMIT 5;

-- Consulta 2: Mostrar las primeras 5 transacciones
SELECT * FROM employee_transaction
LIMIT 5;

-- 5 Consultas con WHERE (incluyendo operadores lógicos y de comparación)
-- Consulta 1: Empleados mayores de 30 años
SELECT name, age 
FROM employee 
WHERE age > 30;

-- Consulta 2: Transacciones con salario mayor a 50,000 y bonus no nulo
SELECT * FROM employee_transaction
WHERE annual_salary > 50000 AND bonus IS NOT NULL;

-- 6. Consultas con LIKE
-- Consulta 1: Buscar empleados con apellido que empieza con 'G'
SELECT * FROM employee
WHERE surname
LIKE 'G%';     -- Comodín "%"

-- Consulta 2: Buscar trabajos que terminan con 'Manager'
SELECT * FROM job_title
WHERE job_title
LIKE '%Manager';

-- 7 Consultas con funciones de agregación
-- Consulta 1: Calcular el salario promedio
SELECT AVG(annual_salary) AS total_empleados
FROM employee_transaction;

-- Consulta 2: Contar el número total de empleados
SELECT COUNT(*) AS total_empleados
FROM employee;

-- Consulta 3: Calcular la suma total de bonificaciones
SELECT SUM(bonus) AS suma_bonificacion
FROM employee_transaction;

-- 8 Consultas con Group By
-- Consulta 1: Agrupar a los empleados por edad
SELECT age, COUNT(*) AS cantidad_empleados
FROM employee
GROUP BY age
ORDER BY age DESC;

-- Consulta 2: Agrupar a los empleados según la escala de satisfacción
SELECT employee_satisfaction, COUNT(*) AS total_empleados
FROM employee_transaction
GROUP BY employee_satisfaction
ORDER BY employee_satisfaction;

-- 9 Consultas con Having
SELECT employee_satisfaction, COUNT(employee_id) AS total_empleados
FROM employee_transaction
GROUP BY employee_satisfaction
HAVING COUNT(employee_id) < 100
ORDER BY employee_satisfaction;

-- 10 Consultas con JOIN
-- Consulta 1: Obtener el nombre del empleado junto con el nombre del puesto al que pertenece
SELECT e.name, e.surname, t.job_title
FROM employee e
INNER JOIN job_title t
ON e.id_job_title = t.id_job_title
ORDER BY name;

-- Consulta 2: Obtener empleados junto con su información de estado civil
SELECT e.employee_id AS Legajo, e.name AS Nombre, e.surname AS Apellido, m.marital_status AS Estado_Civil
FROM employee e
LEFT JOIN marital_status m
ON e.id_marital_status = m.id_marital_status;

-- 11 Consultas con UNION y UNION ALL
-- Conuslta 1: Supongamos que quieres crear una lista combinada con los nombres dos departamentos
SELECT * FROM department
WHERE department = 'Production'
UNION ALL
SELECT * FROM department
WHERE department = 'Sales';
