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
