-- Crear Base de Datos
CREATE DATABASE employee;
USE employee;

-- Tabla de Género
CREATE TABLE gender (
    id_gender INT AUTO_INCREMENT PRIMARY KEY,
    gender CHAR(1) NOT NULL
);

-- Tabla de Estado Civil
CREATE TABLE marital_status (
    id_marital_status INT AUTO_INCREMENT PRIMARY KEY,
    marital_status VARCHAR(50) NOT NULL
);

-- Tabla de Sucursales
CREATE TABLE branch (
    id_branch INT AUTO_INCREMENT PRIMARY KEY,
    branch VARCHAR(40) NOT NULL
);

-- Tabla de Motivos de Baja
CREATE TABLE leave_reason (
    id_leave_reason INT AUTO_INCREMENT PRIMARY KEY,
    leave_reason VARCHAR(50) NOT NULL
);

-- Tabla de Estado Laboral
CREATE TABLE status (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(30) NOT NULL
);

-- Tabla de Departamentos
CREATE TABLE department (
    id_department INT AUTO_INCREMENT PRIMARY KEY,
    department VARCHAR(50) NOT NULL
);

-- Tabla de Puestos de Trabajo
CREATE TABLE job_title (
    id_job_title INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL
);

-- Tabla de Desempeño
CREATE TABLE performance (
    id_performance INT AUTO_INCREMENT PRIMARY KEY,
    performance VARCHAR(50) NOT NULL
);

-- Tabla de Empleados
CREATE TABLE employee (
    employee_id INT NOT NULL UNIQUE PRIMARY KEY,
    dob DATE NOT NULL,
    age INT NOT NULL,
    surname VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    id_gender INT NOT NULL,
    id_marital_status INT NOT NULL,
    id_branch INT NOT NULL,
    id_leave_reason INT,
    id_status INT NOT NULL,
    id_department INT NOT NULL,
    id_job_title INT NOT NULL,
    id_performance INT NOT NULL,
    FOREIGN KEY (id_gender) REFERENCES gender(id_gender),
    FOREIGN KEY (id_marital_status) REFERENCES marital_status(id_marital_status),
    FOREIGN KEY (id_branch) REFERENCES branch(id_branch),
    FOREIGN KEY (id_leave_reason) REFERENCES leave_reason(id_leave_reason),
    FOREIGN KEY (id_status) REFERENCES status(id_status),
    FOREIGN KEY (id_department) REFERENCES department(id_department),
    FOREIGN KEY (id_job_title) REFERENCES job_title(id_job_title),
    FOREIGN KEY (id_performance) REFERENCES performance(id_performance)
);

-- Tabla transacciones
CREATE TABLE employee_transaction (
   transaction_id INT AUTO_INCREMENT PRIMARY KEY,
   hire_date DATE NOT NULL,
   leave_date DATE,
   employee_satisfaction INT,
   annual_salary DOUBLE NOT NULL,
   bonus DOUBLE,
   employee_id INT,
   
   FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);
