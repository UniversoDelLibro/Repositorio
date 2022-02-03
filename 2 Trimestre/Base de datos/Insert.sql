insert into rol values 
('vendedor'),
('cliente');

insert into usuario (id, login, contraseña, email, numero_celular, direccion, estado)values 
('1', 'romeromvop@gmail.com','sadkajdJKja', 'romeromvop@gmail.com', '32123432', 'Cll 52 SUR #94D07', 'Activo'),
('2', 'elbergomez@gmail.com','sasdsaddJKja', 'elbergomez@gmail.com', '32121232', 'Cll 43 SUR #94D07', 'Activo'),
('3', 'florr0301@gmail.com','sghjhjhgja', 'florr0301@gmail.com', '3265432', 'Cll 52 SUR #23V47', 'Inactivo'),
('4', 'BruceWayne@gmail.com','elcaballerodelanc', 'BruceWayne@gmail.com', '34212312', 'Cll 52 GTAM #94D07', 'Activo'),
('5', 'carlJHonson@gmail.com','CJdJKja', 'carlJHonson@gmail.com', '32234432', 'Cll 52 SUR #43W32', 'Activo'),
('6', 'martyMcfly@gmail.com','backtothefuture', 'martyMcfly@gmail.com', '32132124', 'Cll 52 SUR #84D07', 'Activo'),
('7', 'CrisCR7@gmail.com','elcerre7', 'CrisCR7@gmail.com', '32121232', 'Cll 45 SUR #94D07', 'Inactivo');

insert into usuario_rol values 
('cliente', '1'),
('cliente', '2'),
('cliente', '3'),
('cliente', '4'),
('cliente', '5'),
('vendedor', '6'),
('cliente', '7');

insert into tipo_documento (id, sigla, nombre_documento, estado) values 
('1', 'C.C', 'Cedula de Ciudadania', 'Activo'),
('2', 'T.I', 'Tarjeta de identidad', 'Activo'),
('3', 'C.E', 'Cedula Extranjera', 'Activo');

insert into cliente (id, id_tipo_documento, numero_documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_usuario) values
('1', '2', '1000380426', 'Bruce', '', 'Wayne', '', '4'),
('2', '1', '100234423', 'Santiago', '', 'Romero', 'Peña', '1'),
('3', '2', '0380425', 'Elber', '', 'Gomez', 'Rodriguez', '2'),
('4', '3', '23371551', 'Flor', 'Edilsa', 'Peña', 'Rojas', '3'),
('5', '1', '123434324', 'Carl', '', 'Jhonson', 'CJ', '5'),
('6', '2', '102342346', 'Marty', '', 'Mcfly', 'Perez', '6'),
('7', '3', '100234426', 'Cristiano', 'Messi', 'Ronaldo', '', '7');

insert into proveedor (id, nombre_contacto, numero_celular_proveedor, nombre_compañia, direccion, email_compañia, estado) values
('1', 'Servientrega', '32134455', 'Risadas', 'Cl. 42 Sur ##12', 'Risadas@gmail.com', 'Activo'),
('2', 'Servientrega', '32136677', 'Viveres El Condado S A S', 'Cl. 42 Sur ##32', 'ViveresElCondadoSAS@gmail.com', 'Activo'),
('3', 'Servientrega', '32131122', 'Viveres Palmeras S A S', 'Cl. 42 Sur ##02', 'Viveres Palmeras S A S@gmail.com', 'Activo'),
('4', 'Servientrega', '32134433', 'Coca-Cola', 'Cl. 23 Sur ##54', 'Coca-Cola@gmail.com', 'Activo'),
('5', 'Servientrega', '32134445', 'Rico - Helado', 'Cl. 543 Sur ##52', 'RicoH@gmail.com', 'Activo'),
('6', 'Servientrega', '32134225', 'CIGARRERIA PIPE', 'Cl. 62 Sur ##76', 'CIGARRERIA_PIPE@gmail.com', 'Activo');

insert into categoria (id, nombre, estado) values
('1', 'Leche y derivados', 'Disponible'),
('2', 'Carnes, pescados y huevos', 'Disponible'),
('3', 'Patatas, legumbres, frutos secos', 'Disponible'),
('4', ' Verduras y Hortalizas', 'Disponible'),
('5', 'Frutas', 'Disponible'),
('6', 'Cereales y derivados, azúcar y dulces', 'Disponible'),
('7', 'Grasas, aceite y mantequilla', 'Disponible');


insert into producto (id, nombre, imagen, codigo_producto, precio, descripcion, num_existen, id_categoria, id_proveedor, estado) values
('1', 'Aceite Vegetal', '', 'KASJDKJAW', '15000','ACEITE VEGETAL OLEOPALMA 1000 ML', '13', '7', '3', 'Disponible'),
('2', 'Arroz Diana', '', 'KAasdasdAW', '5000','ARROZ DIANA 1000 G', '13', '6', '2', 'Disponible'),
('3', 'Paquetes de gomas', '', 'KAcdsW', '1500','Gomas Dientes Dracoola Bebeto X 150 GRS', '13', '6', '3', 'Disponible'),
('4', 'Racimo de platanos', '', 'KAaswAW', '7000','Platanos maduros ', '13', '5', '2', 'Disponible'),
('5', 'Leche entera', '', 'asdsdsdSW', '2000','LECHE ENTERA ALPINA BOLSA 900ML', '13', '1', '2', 'Disponible'),
('6', 'Racimo de platanos', '', 'KAAswAW', '7000','Platanos maduros ', '13', '5', '2', 'Disponible');


insert into pedido (id, id_producto, precio, cantidad, total, direccion, estado) values 
('1', '1', '15000', '1', '15000', 'Cll 52 SUR #94D07', 'Completo'),
('2', '2', '5000', '3', '15000', 'Cll 43 SUR #94D07','Completo'),
('3', '3', '1500', '4', '6000', 'Cll 52 SUR #23V47', 'Completo'),
('4', '4', '7000', '1','7000', 'Cll 52 GTAM #94D07', 'Completo'),
('5', '5', '2000', '2', '4000', 'Cll 52 SUR #43W32', 'Completo');

insert into factura (id, id_pago, id_cliente, id_pedido, fecha_orden) values
('1', '1', '1', '1', '2021-01-05 08:11:00'),
('2', '2', '2', '2', '2024-02-15 08:11:00'),
('3', '3', '3', '3', '2020-03-23 08:11:00'),
('4', '4', '4', '4', '2022-04-21 08:11:00'),
('5', '5', '5', '5', '2019-05-31 08:11:00');

insert into envio (id, id_factura, fecha_envio, fecha_entrega, estado) values 
('1', '1', '2021-01-23 05:03:00', '2021-01-25', 'Completo'),
('2', '2', '2021-01-23 14:09:00', '2021-01-26', 'Completo'),
('3', '3', '2021-01-23 22:23:00', '2021-01-28', 'Completo'),
('4', '4', '2021-01-2 04:12:00', '2021-01-3', 'Completo'),
('5', '5', '2021-01-1 07:18:00', '2021-01-2', 'Completo');


insert into metodo_pago (id, metodo_pago) values
('1', 'Tarjeta de credito'),
('2', 'Transferencia'),
('3', 'Efectivo');

insert into pago (id, id_met_pago, fecha_pago, estado) values
('1', '1', '2021-01-21 04:11:00', 'Completado'),
('2', '2', '2021-03-31 08:11:00', 'Completado'),
('3', '3', '2021-02-23 07:11:00', 'Completado'),
('4', '2', '2021-05-13 08:11:00', 'Completado'),
('5', '1', '2021-04-03 01:11:00', 'Completado');





