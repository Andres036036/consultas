create database db_personas; 
use db_personas;
CREATE TABLE persona 
( id int NOT NULL AUTO_INCREMENT, 
identificacion varchar(50) NOT NULL, 
nombre varchar(50) NOT NULL, 
apellido varchar(50) NOT NULL, 
email varchar(100) NOT NULL, 
telefono varchar(20) DEFAULT NULL, 
direccion varchar(255) DEFAULT NULL, 
PRIMARY KEY (id) ) ENGINE=InnoDB AUTO_INCREMENT=39;

Insert Into persona(identificacion, nombre, apellido, email, telefono, direccion) values 
("123456","pedro","lopez","pedroL@gmail.com","3218674847","calle 127 #16b8"
);