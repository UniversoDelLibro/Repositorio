--Consulta para saber que datos han sido introducidos por los usuario y su rol 

select u.email, u.contraseña, u.numero_celular, u.direccion, u.estado, ur.rol_nombre from usuario u
inner join usuario_rol ur on u.id = ur.id_usuario

--Consulta para saber si el cliente es mayor de edad, menor de edad o es extranjero

select c.primer_nombre, c.primer_apellido, td.sigla, c.numero_documento, td.estado from tipo_documento td
inner join cliente c on td.id = c.id_tipo_documento
where td.sigla = 'T.I'

select c.primer_nombre, c.primer_apellido, td.sigla, c.numero_documento, td.estado from tipo_documento td
inner join cliente c on td.id = c.id_tipo_documento
where td.sigla = 'C.C'

select c.primer_nombre, c.primer_apellido, td.sigla, c.numero_documento, td.estado from tipo_documento td
inner join cliente c on td.id = c.id_tipo_documento
where td.sigla = 'C.E'

-- Consulta para saber la categoria y el proveedor de los productos

select c.nombre, c.estado, pr.nombre_contacto, pr.nombre_compañia, pr.direccion, pr.estado, pd.nombre, pd.codigo_producto, pd.precio, pd.num_existen from categoria c
inner join producto pd on c.id = pd.id_categoria 
inner join proveedor pr on pd.id_proveedor = pr.id

--Consulta para ver una forma de factura y los productos, precios, las fechas y demas cosas

select p.nombre, p.codigo_producto, p.num_existen, pd.precio, pd.cantidad, pd.total, e.fecha_envio, e.fecha_entrega, e.estado, pd.direccion, f.fecha_orden, pd.estado from producto p
inner join pedido pd on p.id = pd.id_producto 
inner join factura f on pd.id = f.id_pedido
inner join envio e on f.id = e.id_factura

-- Consulta para ver la factura con todos los campos que necesita 

select p.nombre, p.codigo_producto,  pd.precio, pd.cantidad, pd.total, e.fecha_envio, e.fecha_entrega, pd.direccion, cl.primer_nombre, cl.primer_apellido, cl.numero_documento, mt.metodo_pago, pg.fecha_pago, pg.estado, f.fecha_orden, pd.estado from producto p
inner join pedido pd on p.id =pd.id_producto 
inner join factura f on pd.id = f.id_pedido
inner join envio e on f.id = e.id_factura
inner join cliente cl on cl.id = f.id_cliente
inner join pago pg on pg.id = f.id_pago
inner join metodo_pago mt on mt.id = pg.id_met_pago

-- Consulta para ver las facturas de los menores de edad, mayores de edad y extranjeros

select p.nombre, p.codigo_producto,  pd.precio, pd.cantidad, pd.total, e.fecha_envio, e.fecha_entrega, pd.direccion, cl.primer_nombre, cl.primer_apellido, cl.numero_documento, mt.metodo_pago, pg.fecha_pago, pg.estado, f.fecha_orden, pd.estado from producto p
inner join pedido pd on p.id =pd.id_producto 
inner join factura f on pd.id = f.id_pedido
inner join envio e on f.id = e.id_factura
inner join cliente cl on cl.id = f.id_cliente
inner join tipo_documento td on td.id = cl.id_tipo_documento
inner join pago pg on pg.id = f.id_pago
inner join metodo_pago mt on mt.id = pg.id_met_pago
where td.sigla = 'T.I'

select p.nombre, p.codigo_producto,  pd.precio, pd.cantidad, pd.total, e.fecha_envio, e.fecha_entrega, pd.direccion, cl.primer_nombre, cl.primer_apellido, cl.numero_documento, mt.metodo_pago, pg.fecha_pago, pg.estado, f.fecha_orden, pd.estado from producto p
inner join pedido pd on p.id =pd.id_producto 
inner join factura f on pd.id = f.id_pedido
inner join envio e on f.id = e.id_factura
inner join cliente cl on cl.id = f.id_cliente
inner join tipo_documento td on td.id = cl.id_tipo_documento
inner join pago pg on pg.id = f.id_pago
inner join metodo_pago mt on mt.id = pg.id_met_pago
where td.sigla = 'C.C'

select p.nombre, p.codigo_producto,  pd.precio, pd.cantidad, pd.total, e.fecha_envio, e.fecha_entrega, pd.direccion, cl.primer_nombre, cl.primer_apellido, cl.numero_documento, mt.metodo_pago, pg.fecha_pago, pg.estado, f.fecha_orden, pd.estado from producto p
inner join pedido pd on p.id =pd.id_producto 
inner join factura f on pd.id = f.id_pedido
inner join envio e on f.id = e.id_factura
inner join cliente cl on cl.id = f.id_cliente
inner join tipo_documento td on td.id = cl.id_tipo_documento
inner join pago pg on pg.id = f.id_pago
inner join metodo_pago mt on mt.id = pg.id_met_pago
where td.sigla = 'C.E'

-- Consulta para ver los pagos realizados y sus metodos de pago

select m.metodo_pago, p.estado, p.fecha_pago from metodo_pago m
inner join pago p on m.id = p.id_met_pago
