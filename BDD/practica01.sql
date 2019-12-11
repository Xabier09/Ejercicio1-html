DROP DATABASE DeptEmpleados; --Borrar la base de datos
CREATE DATABASE DeptEmpleados;

USE DeptEmpleados;

CREATE TABLE Departamentos ( 
    NDep      INT PRIMARY KEY,
    Nombre    VARCHAR(20),
    Localidad VARCHAR(20)
);

CREATE TABLE Empleados (
   NEmple INT,
   Apellido VARCHAR(20),
   Salario INT,
   Comision FLOAT,
   Departamento INT,
   Jefe INT,
   PRIMARY KEY (NEmple),
   FOREIGN KEY (Departamento) REFERENCES Departamentos(NDep),
   FOREIGN KEY (Jefe) REFERENCES Empleados(NEmple)
);