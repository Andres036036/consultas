DROP DATABASE IF EXISTS consultas;
CREATE DATABASE consultas;
USE consultas;

CREATE TABLE fabricante (
  codigo INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100)
);

CREATE TABLE producto (
  codigo INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  precio DOUBLE,
  codigo_fabricante INT,
  CONSTRAINT fk_codigo_fabricante FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);