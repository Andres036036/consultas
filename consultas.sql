DROP DATABASE IF EXISTS consultuas;
CREATE DATABASE consultas;
USE consultas;
CREATE TABLE fabricante (
codigo INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (100)
);
CREATE TABLE producto (
codigo INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (100),
precio DOUBLE,
fabricante INT,
FOREIGN KEY (fabricante) REFERENCES fabricante (codigo)
);