USE `consultas`;
DROP procedure IF EXISTS `fabricante`;

DELIMITER $$
USE `consultas`$$
CREATE PROCEDURE `fabricante` (
 IN nombre VARCHAR (100)
)
BEGIN
  INSERT INTO fabricante (nombre)
  VALUES (nombre);
END$$

DELIMITER ;


USE `consultas`;
DROP procedure IF EXISTS `producto`;

USE `consultas`;
DROP procedure IF EXISTS `consultas`.`producto`;
;

DELIMITER $$
USE `consultas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `producto`(
 IN nombre VARCHAR (100),
 IN precio DOUBLE,
 IN fabricante int
)
BEGIN
 INSERT INTO producto (nombre,precio,fabricante) 
 VALUES (nombre,precio,fabricante);
END$$

DELIMITER ;