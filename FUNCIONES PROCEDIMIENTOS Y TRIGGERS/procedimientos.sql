CREATE DEFINER=`root`@`localhost` PROCEDURE `gimnasio`.`actualizar_hora_clase`(clase_id  int, hora_inicio time, hora_final time)
begin
	update clase set hora_inicio = hora_inicio, hora_final = hora_final where id_clase = clase_id ;
end;

CREATE DEFINER=`root`@`localhost` PROCEDURE `gimnasio`.`listar_clientes_sin_entrenador`()
begin
	select c.nombre, c.apellido1, c.apellido2 from cliente c 
	left join personal_cliente pc on c.id_cliente = pc.CLIENTE_id_cliente
	where pc.ENTRTENADORES_id_entrenador is null; 
end;

CREATE DEFINER=`root`@`localhost` PROCEDURE `gimnasio`.`sp_lista_clientes_por_clase`(clase_nombre varchar(50), clase_dia varchar(20), clase_hora_inicio time)
begin
	SELECT c.nombre, c.apellido1, c.apellido2
  FROM cliente c
  INNER JOIN matricula m ON c.id_cliente = m.CLIENTE_id_cliente
  INNER JOIN clase cl ON m.cod_matricula = cl.sala_numero
  WHERE cl.dia = clase_dia AND cl.hora_inicio = clase_hora_inicio AND cl.id_clase IN (
    SELECT ce.id_clase
    FROM clase_entrenadores ce
    INNER JOIN entrenadores e ON ce.id_entrenador = e.id_entrenador
    INNER JOIN actividad a ON ce.id_clase = a.nombre
    WHERE a.nombre = clase_nombre);
end;
