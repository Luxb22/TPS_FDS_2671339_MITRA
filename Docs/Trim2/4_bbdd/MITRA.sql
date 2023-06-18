drop database mitra;

create database mitra;

use mitra;

CREATE TABLE usuarios(
idusers INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (100),
apellido VARCHAR (100),
cedula VARCHAR (50),
email VARCHAR (50),
Celular VARCHAR (15)
)ENGINE = InnoDB;

CREATE TABLE rol(
idrol INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50),
apellido VARCHAR (50),
cargo VARCHAR (50)
);

CREATE TABLE relacion_Usuario_Rol(
idusers INT,
idrol INT,
CONSTRAINT fk_ROL_relacion_usuario_rol
	FOREIGN KEY (idusers)
	REFERENCES usuarios(idusers)
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
CONSTRAINT fk_USER_relacion_usuario_rol
	FOREIGN KEY (idusers)
	REFERENCES rol(idrol)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE venta(
idventas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
codigo INT NOT NULL,
factura INT NOT NULL,
venta_abonado VARCHAR (200),
venta_total VARCHAR (200)
);
    ALTER TABLE venta
    ADD COLUMN idusers INT NULL,
    ADD CONSTRAINT fK_venta_usuario
	FOREIGN KEY (idusers)
	REFERENCES usuarios(idusers)
	ON DELETE CASCADE 
	ON UPDATE CASCADE;
    
CREATE TABLE produccion(
idproduccion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
producto INT NOT NULL,
descripcion VARCHAR (500),
cantidad VARCHAR (100),
fecha VARCHAR(10)
);
    ALTER TABLE produccion
    ADD COLUMN idventas INT NULL,
    ADD CONSTRAINT fK_prduccion_venta
	FOREIGN KEY (idventas)
	REFERENCES venta(idventas)
	ON DELETE CASCADE 
	ON UPDATE CASCADE;
    
CREATE TABLE compra(
idcompra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50),
fecha VARCHAR (20),
total VARCHAR(100)
);
  ALTER TABLE compra
  ADD COLUMN idproduccion INT NULL,
  ADD CONSTRAINT fk_compras_produccion
  FOREIGN KEY (idproduccion)
  REFERENCES produccion (idproduccion)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
  
CREATE TABLE insumo(
idinusmo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre INT NOT NULL,
cantidad VARCHAR(100),
fecha_ingreso VARCHAR(20)
);
  
  ALTER TABLE insumo
  ADD COLUMN idcompra INT NULL,
  ADD CONSTRAINT fk_inusmo_compra
  FOREIGN KEY (idcompra)
  REFERENCES compra(idcompra)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
  
CREATE TABLE compra(
idcompra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50),
fecha VARCHAR (20),
total VARCHAR(100)
);

  
CREATE TABLE labor(
idlabor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
asignar_labor VARCHAR (50)
);

  ALTER TABLE nomina
  ADD COLUMN idlabor INT NULL,
  ADD CONSTRAINT fk_nomina_labor
  FOREIGN KEY (idlabor)
  REFERENCES labor (idlabor)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

  ALTER TABLE usuarios
  ADD COLUMN idlabor INT NULL,
  ADD CONSTRAINT fk_usuarios_labor
  FOREIGN KEY (idlabor)
  REFERENCES labor (idlabor)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

CREATE TABLE nomina(
idnomina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_colabordor INT NOT NULL,
idnomina INT NOT NULL,
fechas_labores VARCHAR (10),
labores_hechas INT NOT NULL
);






