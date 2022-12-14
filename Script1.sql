-- Codigo SQL para la creación de la base de datos y posterior llenado de sus distintas tablas
-- @author Andrés Castro
DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda;
use tienda;

DROP TABLE IF EXISTS PROVEEDORES;
DROP TABLE IF EXISTS PRODUCTOS;
DROP TABLE IF EXISTS CLIENTES;

-- Se crea la tabla proovedores

CREATE TABLE PROVEEDORES(
ID_PROVEEDOR int not null,
NOMBRE varchar(25),
DIRECCION varchar(50),
EMAIL varchar(250),
TELEFONO bigint,
 primary key (ID_PROVEEDOR)
);

-- Se crea la tabla productos

CREATE TABLE PRODUCTOS(
ID_PRODUCTO int not null,
DESCRIPCION varchar(50),
PRECIO int,
ID_PROVEEDOR int,
primary key (ID_PRODUCTO),
foreign key(ID_PROVEEDOR) REFERENCES PROVEEDORES(ID_PROVEEDOR)
);

-- Se crea la tabla clientes

CREATE TABLE CLIENTES(
ID_CLIENTE bigint not null,
TIPO_ID varchar(25),
NOMBRE varchar(25),
DIRECCION varchar(50),
TELEFONO bigint,
primary key (ID_CLIENTE)
);

-- Se crea la tabla vendedores

CREATE TABLE VENDEDORES(
ID_VENDEDOR int not null,
NOMBRE varchar(25),
primary key (ID_VENDEDOR)
);

-- Se crea la tabla facturas

CREATE TABLE FACTURAS(
ID_FACTURA int not null,
FECHA datetime,
ID_CLIENTE bigint,
ID_VENDEDOR int,
ID_PRODUCTO int,
CANTIDAD int,
CREACION datetime not null,
CANCELACION timestamp,
primary key (ID_FACTURA),
foreign key (ID_CLIENTE) references CLIENTES(ID_CLIENTE),
foreign key (ID_VENDEDOR) references VENDEDORES(ID_VENDEDOR),
foreign key (ID_PRODUCTO) references PRODUCTOS(ID_PRODUCTO)
);

-- Se llena la tabla de proveedores

INSERT INTO PROVEEDORES (ID_PROVEEDOR, NOMBRE, DIRECCION, EMAIL, TELEFONO)
VALUES 
(1, 'Nogogesa S.A.', 'Calle 123', 'ventas@nogogesa.com', 3806449398),
(2, 'Panoribo S.A.', 'Calle 456', 'ventas@panoribo.com', 3062217427),
(3, 'Jagipusi S.A.', 'Calle 789', 'ventas@jagipusi.com', 3052310679);

-- Se llena la tabla de productos

INSERT INTO PRODUCTOS (ID_PRODUCTO, DESCRIPCION, PRECIO, ID_PROVEEDOR)
VALUES 
(1, 'Pulidora 4 1/2" profesional 800w', 500000, 1),
(2, 'Taladro percutor 1/2" 800w', 600000, 1),
(3, 'Esmeril 6" 1/2 HP', 800000, 2),
(4, 'Equipo de soldar 110/220V', 950000, 2),
(5, 'Llave de tubo 26', 150000, 3),
(6, 'Llave bristol T 7mm', 25000, 3);

-- Se llena la tabla de vendedores

INSERT INTO VENDEDORES (ID_VENDEDOR, NOMBRE)
VALUES (1, 'Antonio');

-- Se llena la tabla de clientes

INSERT INTO CLIENTES (ID_CLIENTE, TIPO_ID, NOMBRE, DIRECCION, TELEFONO)
VALUES 
(1461125870, 'CC', 'Hector Moral', 'Calle 741', 307790949),
(1164354954, 'CC', 'Irene Angulo', 'Calle 852', 3127519005),
(1115704290, 'TI', 'Ioana Betancor', 'Calle 963', 3094126930),
(1056231880, 'CC', 'AndreS Fonseca', 'Calle 258', 3011182391),
(1087031087, 'TI', 'Gabriel Merchan', 'Calle 147', 3184012391);

-- Se llena la tabla de facturas

INSERT INTO FACTURAS (ID_FACTURA, FECHA, ID_CLIENTE, ID_VENDEDOR, ID_PRODUCTO, CANTIDAD, CREACION)
VALUES 
(1, now(), 1461125870, 1, 3, 5, now()),
(2, now(), 1164354954, 1, 6, 2, now()),
(3, now(), 1087031087, 1, 4, 1, now()),
(4, now(), 1115704290, 1, 2, 3, now()); 

-- Se realiza borrado logico

UPDATE FACTURAS
SET CANCELACION = now()
WHERE ID_FACTURA = 1;

UPDATE FACTURAS
SET CANCELACION = now()
WHERE ID_FACTURA = 3;

DELETE FROM FACTURAS
WHERE ID_FACTURA = 2;

DELETE FROM FACTURAS
WHERE ID_FACTURA = 4;

-- Se realiza borrado fisico

UPDATE PRODUCTOS 
SET DESCRIPCION = 'Pulidora 4 1/2" profesional 1200w',  ID_PROVEEDOR = 3
WHERE ID_PRODUCTO = 1;

UPDATE PRODUCTOS 
SET DESCRIPCION = 'Esmeril 6" 2 HP',  ID_PROVEEDOR = 1
WHERE ID_PRODUCTO = 3;

UPDATE PRODUCTOS 
SET DESCRIPCION = 'Llave de tubo 24',  ID_PROVEEDOR = 2
WHERE ID_PRODUCTO = 5;