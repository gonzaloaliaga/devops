-- ==========================================
-- 1. BASE DE DATOS: VENTAS
-- ==========================================
CREATE DATABASE IF NOT EXISTS db_ventas;
USE db_ventas;

-- Crear tabla venta
CREATE TABLE IF NOT EXISTS venta (
    id_venta BIGINT NOT NULL AUTO_INCREMENT,
    direccion_compra VARCHAR(255) NOT NULL,
    valor_compra INT NOT NULL,
    fecha_compra DATE NOT NULL,
    despacho_generado BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY (id_venta)
);

-- Insertar datos de prueba (Ventas)
INSERT INTO venta (direccion_compra, valor_compra, fecha_compra, despacho_generado) VALUES
('Av. Vicuña Mackenna 4917, San Joaquín', 45000, '2026-05-10', 1),
('Providencia 1234, Santiago', 120000, '2026-05-12', 1),
('Av. La Florida 8900, La Florida', 15000, '2026-05-15', 0),
('Alameda 333, Santiago', 85000, '2026-05-18', 0);


-- ==========================================
-- 2. BASE DE DATOS: DESPACHOS
-- ==========================================
CREATE DATABASE IF NOT EXISTS db_despachos;
USE db_despachos;

-- Crear tabla despacho
CREATE TABLE IF NOT EXISTS despacho (
    id_despacho BIGINT NOT NULL AUTO_INCREMENT,
    fecha_despacho DATE,
    patente_camion VARCHAR(255),
    intento INT NOT NULL DEFAULT 0,
    id_compra BIGINT,
    direccion_compra VARCHAR(255),
    valor_compra BIGINT,
    despachado BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY (id_despacho)
);

-- Insertar datos de prueba (Despachos)
-- Nota: id_compra hace referencia conceptual a id_venta de la otra base de datos
INSERT INTO despacho (fecha_despacho, patente_camion, intento, id_compra, direccion_compra, valor_compra, despachado) VALUES
('2026-05-11', 'AB-CD-12', 1, 1, 'Av. Vicuña Mackenna 4917, San Joaquín', 45000, 1),
('2026-05-13', 'EF-GH-34', 2, 2, 'Providencia 1234, Santiago', 120000, 1),
(NULL, NULL, 0, 3, 'Av. La Florida 8900, La Florida', 15000, 0);


-- ==========================================
-- 3. PERMISOS DE USUARIO
-- ==========================================
GRANT ALL PRIVILEGES ON db_despachos.* TO 'user'@'%';
GRANT ALL PRIVILEGES ON db_ventas.* TO 'user'@'%';

FLUSH PRIVILEGES;