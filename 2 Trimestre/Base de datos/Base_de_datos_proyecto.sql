create table rol(
	nombre varchar(40) not null,
	constraint pk_rol primary key (nombre)
);

create table usuario(
	id integer not null,
	login varchar(50) not null,
	contraseña varchar(60) not null,
	email varchar(2549) not null,
	numero_celular int8 not null,
	direccion varchar(70) not null,
	estado varchar(40) not null,
	constraint pk_usuario primary key (id),
	constraint uk_usuario unique (login, email)
);

create table usuario_rol(
	rol_nombre varchar (40) not null,
	id_usuario integer not null,
	constraint pk_usuario_rol primary key (rol_nombre, id_usuario),
	constraint fk_rol_usu foreign key (rol_nombre) references rol(nombre),
	constraint fk_usua_usu foreign key (id_usuario) references usuario (id)
);

create table tipo_documento(
	id integer not null,
	sigla varchar(10) not null,
	nombre_documento varchar(100) not null,
	estado varchar(40) not null,
	constraint pk_tipo_documento primary key (id),
	constraint uk_documento unique (sigla, nombre_documento)
);

create table cliente(
	id integer not null,
	id_tipo_documento integer not null,
	numero_documento varchar(50) not null,
	primer_nombre varchar(50) not null,
	segundo_nombre varchar(50),
	primer_apellido varchar(50) not null,
	segundo_apellido varchar(50),
	id_usuario integer not null,
	constraint pk_cliente primary key (id),
	constraint uk_cliente unique (id_tipo_documento, numero_documento),
	constraint uk_user unique (id_usuario),
	constraint fk_tip_clien foreign key (id_tipo_documento) references tipo_documento (id),
	constraint fk_usu_clien foreign key (id_usuario) references usuario (id)
);

create table categoria(
	id integer not null,
	nombre varchar(50) not null,
	estado varchar(40) not null,
	constraint pk_categoria primary key (id),
	constraint uk_categoria_nombre unique (nombre)
);

create table proveedor(
	id integer not null,
	nombre_contacto varchar(50) not null,
	numero_celular_proveedor int8 not null,
	nombre_compañia varchar(150) not null,
	direccion varchar(100) not null,
	email_compañia varchar(100) not null,
	estado varchar (40) not null,
	constraint pk_proveedor primary key (id),
	constraint uk_proveedor unique (email_compañia, numero_celular_proveedor)
);

create table producto(
	id integer not null,
	nombre varchar(100) not null,
	imagen varchar(100) not null,
	codigo_producto varchar(40) not null,
	precio numeric(15,0) not null,
	descripcion varchar(500) not null,
	num_existen int4 not null,
	id_categoria integer not null,
	id_proveedor integer not null,
	estado varchar(40) not null,
	constraint pk_producto primary key (id),
	constraint uk_producto unique (codigo_producto),
	constraint fk_cat_prod foreign key (id_categoria) references categoria (id),
	constraint fk_proveedor foreign key (id_proveedor) references proveedor (id)
);

create table metodo_pago(
	id integer not null,
	metodo_pago varchar(40) not null,
	constraint pk_met_pago primary key (id),
	constraint uk_met_pago unique (metodo_pago)
);

create table pago(
	id integer not null,
	id_met_pago integer not null,
	fecha_pago date not null,
	estado varchar(40) not null,
	constraint pk_pago primary key (id),
	constraint uk_fecha_pago unique (fecha_pago),
	constraint fk_metod_pago foreign key (id_met_pago) references metodo_pago (id)
);

create table pedido(
	id integer not null,
	id_producto integer not null,
	precio numeric(15,0) not null,
	cantidad varchar(40) not null,
	total numeric(15,0) not null,
	direccion varchar(100) not null,
	estado varchar(40) not null,
	constraint pk_carr_compr primary key (id),
	constraint fk_prod_ped foreign key (id_producto) references producto (id)
);

create table factura(
	id integer not null,
	id_pago integer not null,
	id_cliente integer not null,
	id_pedido integer not null,
	fecha_orden timestamp not null,
	constraint pk_fac primary key (id),
	constraint uk_factura unique (id_pago, id_cliente, id_pedido),
	constraint fk_pago_fact foreign key (id_pago) references pago (id),
	constraint fk_clie_fact foreign key (id_cliente) references cliente (id),
	constraint fk_ped_fact foreign key (id_pedido) references pedido (id)
);

create table envio(
	id integer not null,
	id_factura integer not null,
	fecha_envio timestamp not null,
	fecha_entrega timestamp not null,
	estado varchar(40) not null,
	constraint pk_envio primary key (id),
	constraint uk_envio unique (id_factura),
	constraint fk_carr_env foreign key (id_factura) references factura (id)
	
);
