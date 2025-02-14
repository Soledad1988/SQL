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

-- 12 Subconsultas
--  Conuslta 1: Encuentra el empleado con el salario más alto.
SELECT * 
FROM employee 
WHERE employee_id = (SELECT employee_id FROM employee_transaction ORDER BY annual_salary DESC LIMIT 1);

-- 13 Condicional IF
--  Conuslta 1: Muestra el estado laboral de los empleados indicando si están "Activos" o "Inactivos".
SELECT name, surname,
	IF(id_status = 1, 'Activo', 'Inactivo') AS estado_laboral
FROM employee;

-- 14 Condicional CASE
-- Agrupa empleados según rangos de edad.
SELECT name, surname, age,
	CASE
		WHEN age < 25 THEN 'Joven'
        WHEN age BETWEEN 25 AND 40 THEN 'Adulto'
        WHEN age > 40 THEN 'Mayor'
        ELSE 'Sin clasificación'
	END AS categoria_edad
FROM employee;

-- 15 CAST
describe employee;

SELECT * FROM employee 
WHERE CAST(dob AS DATE) > '1970-01-01';

-- 16 Funciones de Fecha
--  Conuslta 1:
SELECT name, dob, YEAR(dob) AS Año, MONTH(dob) AS Mes
FROM employee;

--  Conuslta 2:
SELECT hire_date, DATE_ADD(hire_date, INTERVAL 90 DAY) AS 'Fin período de prueba'
FROM employee_transaction;

--  Conuslta 3:
SELECT hire_date,
DATEDIFF(CURDATE(), hire_date) AS dias_transcurridos
FROM employee_transaction;

-- 17 Cadenas de Texto
SELECT UPPER(surname) AS Mayuscula FROM employee;

SELECT LOWER(name) AS Minuscula FROM employee;

SELECT CONCAT(name, ' (', dob, ')') AS Año_nacimiento FROM employee;

SELECT SUBSTRING(job_title,1,5) AS Extracto_ocupación FROM job_title;

SELECT job_title, LENGTH(job_title) AS longitud FROM job_title;

-- 18 CTEs
WITH listaEmpleados AS (
SELECT employee_id, name, surname FROM employee
),

listaSueldos AS (
SELECT employee_id, annual_salary FROM employee_transaction
)

SELECT * FROM listaEmpleados
JOIN listaSueldos 
ON listaEmpleados.employee_id = listaSueldos.employee_id;

-- 19 ROW_NUMBER()
SELECT job_title,
ROW_NUMBER() OVER(ORDER BY job_title) AS Orden
FROM job_title;

-- 20 PARTITION BY()
SELECT e.id_gender, t.job_title,
ROW_NUMBER() OVER(PARTITION BY e.id_gender ORDER BY t.job_title) AS Orden
FROM employee e
JOIN job_title t 
ON e.id_job_title = t.id_job_title;

SELECT * FROM gender;

-- 20 PROCEDURE

-- consulta 1. Lista todos los campos de la tabla empleados
DELIMITER //

CREATE PROCEDURE lista_empleados()
BEGIN
	SELECT * FROM employee;
END //

DELIMITER ;

-- Consulta 2. Este procedimiento recibe un id_departmento y devuelve los empleados de ese departamento.
DELIMITER //
CREATE PROCEDURE traerEmpleadosPorDepartamento(IN dep_id INT)
BEGIN
	SELECT e.employee_id, e.name, e.surname, d.department
    FROM employee e
    JOIN department d 
    ON e.id_department = d.id_department
    WHERE e.id_department = dep_id;
END //
DELIMITER ;

-- 21 Triggers

-- Consulta 1. Cada vez que un empleado tiene una fecha de salida (leave_date), se cambia automáticamente su estado laboral a "Inactivo"
DELIMITER //

CREATE TRIGGER salida_empleado
AFTER UPDATE ON employee_transaction
FOR EACH ROW
BEGIN
    IF NEW.leave_date IS NOT NULL THEN
        UPDATE employee
        SET id_status = (SELECT id_status FROM status WHERE status = 'Inactive')
        WHERE employee_id = NEW.employee_id;
    END IF;
END //

DELIMITER ;

SELECT DISTINCT(employee_id), name, surname 
FROM employee
WHERE id_status = 1
LIMIT 15;

SELECT employee_id, id_status 
FROM employee 
WHERE employee_id = 10006;

UPDATE employee_transaction 
SET leave_date ='2025-01-31'
WHERE employee_id = 10006;

SELECT * FROM status;

-- Viws
-- Consulta1. Vista de empleados activos con su información principal
CREATE VIEW EmpleadosActivos AS
SELECT e.employee_id, e.name, e.surname, d.department, j.job_title, s.status
FROM employee e
JOIN department d ON e.id_department = d.id_department
JOIN job_title j ON e.id_job_title = j.id_job_title
JOIN status s ON e.id_status = s.id_status
WHERE s.status = 'Active';

-- Consulta 2. vista con el nombre del departamento y la cantidad de empleados activos en ese departamento
CREATE VIEW EmpleadosActivosPorDepartamento AS
SELECT d.department, COUNT(e.employee_id) AS empleados_activos
FROM employee e
JOIN department d 
ON e.id_department = d.id_department
JOIN status s 
ON e.id_status = s.id_status
WHERE s.status = 'Active'
GROUP BY d.department;

-- Consulta 3. Cantidad de empleados activos
CREATE VIEW CuentaEmpleadosActivos AS
SELECT COUNT(*) AS empleados_activos
FROM employee e
WHERE e.id_status = (SELECT id_status FROM status WHERE status = 'Active');

SELECT * FROM CuentaEmpleadosActivos;
