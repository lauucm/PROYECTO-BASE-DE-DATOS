CREATE DEFINER=`root`@`localhost` FUNCTION `gimnasio`.`num_clientes_contratados_entrenador`(id_entrenador int) RETURNS int
    DETERMINISTIC
begin
	declare num_clientes integer; 
	select count(*) into num_clientes from personal_cliente pc 
	where pc.ENTRENADORES_id_entrenador = id_entrenador; 
	return num_clientes; 
end;

CREATE DEFINER=`root`@`localhost` FUNCTION `gimnasio`.`total_clientes`() RETURNS int
    DETERMINISTIC
begin 
	declare num_clientes integer; 
	select count(*) into num_clientes from cliente c; 
	return num_clientes; 
end;
