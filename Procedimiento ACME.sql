DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionarEmpleados`(IN `p_identificacion` INT(11), IN `p_nombre` VARCHAR(45), IN `p_apellido` VARCHAR(45), IN `fechanacimiento` DATETIME, IN `p_direccionresidencia` VARCHAR(45), IN `p_iddepartamento` INT(11), IN `p_salario` INT(11))
    NO SQL
BEGIN

Declare numeroRegistros int;
    
    if (p_tipoOperacion = 0) THEN
    
    	Select count(1) into numeroRegistros
        From empleados
        Where nombre = p_nombre;
    
    
    	IF (numeroRegistros = 0) THEN
        
          insert into empleados values(p_identificacion, p_nombre, p_apellido, fechanacimiento, p_direccionresidencia, p_iddepartamento, p_salario);
               
        else
        
          update empleados set nombre = p_nombre, apellido = p_apellido, direccionresidencia = p_direccionresidencia, iddepartamento = p_iddepartamento, salario = p_salario
          Where identificacion = p_identificacion; 
          
        end if; 
        
         else 
  
         	DELETE FROM empleados WHERE identificacion= p_identificacion;
    
    END if ;
        

END$$
DELIMITER ;
