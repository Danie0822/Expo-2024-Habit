DROP DATABASE IF EXISTS Expo2024;

CREATE DATABASE IF NOT EXISTS Expo2024 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE Expo2024;

-- Tabla para almacenar información de los clientes
CREATE TABLE tb_clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL UNIQUE,
    telefono_cliente VARCHAR(20) NOT NULL,
    clave_cliente VARCHAR(100) NOT NULL,
    estado_cliente ENUM('activo', 'inactivo') DEFAULT ('activo') NOT NULL
) ENGINE=INNODB;

-- Tabla para almacenar información de los blogs 
CREATE TABLE tb_blogs (
    id_blog INT AUTO_INCREMENT PRIMARY KEY,
    titulo_blog VARCHAR(100) NOT NULL,
    descripcion_blog TEXT NOT NULL,
    fecha_inscripcion DATE DEFAULT (CURRENT_DATE),
    imagen_blog VARCHAR(255) NOT NULL
) ENGINE=INNODB;

-- Tabla para almacenar información de los administradores
CREATE TABLE tb_administradores (
    id_administrador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_administrador VARCHAR(100) NOT NULL,
    telefono_administrador VARCHAR(20) NOT NULL,
    email_administrador VARCHAR(100) NOT NULL UNIQUE,
    clave_administrador VARCHAR(100) NOT NULL, 
    rol_administrador  BOOLEAN DEFAULT (0) NOT NULL
) ENGINE=INNODB;

-- Tabla para almacenar las categorías de las propiedades
CREATE TABLE tb_categorias_propiedades (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE
) ENGINE=INNODB;

-- Tabla para almacenar las zonas de las propiedades
CREATE TABLE tb_zonas_propiedades (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    nombre_zona VARCHAR(100) NOT NULL UNIQUE
) ENGINE=INNODB;

-- Tabla para almacenar información de las propiedades
CREATE TABLE tb_propiedades (
    id_propiedad INT AUTO_INCREMENT PRIMARY KEY,
    titulo_propiedad VARCHAR(255) NOT NULL,
    descripcion_propiedad TEXT NOT NULL,
    fecha_inscripcion DATE DEFAULT (CURRENT_DATE),
    descripcion_dirrecion VARCHAR(255) NOT NULL,
    latitud_ubicacion DECIMAL(10, 8) NOT NULL,
    longitud_ubicacion DECIMAL(11, 8) NOT NULL,
    estado_propiedad ENUM('Venta', 'Alquiler') DEFAULT ('Venta') NOT NULL,
    precio_propiedad DECIMAL(10, 2) NOT NULL CHECK (precio_propiedad > 0),
    id_categoria INT NOT NULL,
    id_zona INT NOT NULL, 
    id_administrador INT NOT NULL,
    CONSTRAINT fk_administrador_propiedades FOREIGN KEY (id_administrador) REFERENCES tb_administradores(id_administrador),
    CONSTRAINT fk_zonas_propiedades FOREIGN KEY (id_zona) REFERENCES tb_zonas_propiedades(id_zona),
    CONSTRAINT fk_categoria_propiedades FOREIGN KEY (id_categoria) REFERENCES tb_categorias_propiedades(id_categoria)
) ENGINE=INNODB;

-- Tabla para almacenar las inmuebles de las propiedades
CREATE TABLE tb_inmobiliarias (
    id_inmobiliario INT AUTO_INCREMENT PRIMARY KEY,
    sanitarios_inmobiliario INT NOT NULL CHECK (sanitarios_inmobiliario > 0),
    habitaciones_inmobiliario INT NOT NULL CHECK (habitaciones_inmobiliario > 0),
    estacionamientos_inmobiliario INT NOT NULL CHECK (estacionamientos_inmobiliario >= 0),
    id_propiedad INT NOT NULL, 
    CONSTRAINT fk_propiedades_inmobiliarias FOREIGN KEY (id_propiedad) REFERENCES tb_propiedades(id_propiedad)
) ENGINE=INNODB;

-- Tabla para almacenar las proyectos de las propiedades
CREATE TABLE tb_proyectos (
    id_proyectos INT AUTO_INCREMENT PRIMARY KEY, 
    normativas VARCHAR(255) NOT NULL,
    id_propiedad INT NOT NULL, 
    CONSTRAINT fk_propiedades_proyectos FOREIGN KEY (id_propiedad) REFERENCES tb_propiedades(id_propiedad)
) ENGINE=INNODB;   



-- Tabla para almacenar las propietarios de las propiedades
CREATE TABLE tb_propietarios (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    tipo_propietario ENUM('Terceros', 'Empresa') DEFAULT ('Empresa') NOT NULL, 
    id_cliente INT , 
    id_propiedad INT NOT NULL, 
    CONSTRAINT fk_propiedades_propietarios FOREIGN KEY (id_propiedad) REFERENCES tb_propiedades(id_propiedad),
    CONSTRAINT fk_clientes_propietarios FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
) ENGINE=INNODB;

-- Tabla para almacenar las imágenes de las propiedades
CREATE TABLE tb_imagenes_propiedades (
    id_imagen INT AUTO_INCREMENT PRIMARY KEY,
    imagen_url VARCHAR(255) NOT NULL,
    id_propiedad INT NOT NULL,
    CONSTRAINT fk_propiedades_imagenes FOREIGN KEY (id_propiedad) REFERENCES tb_propiedades(id_propiedad)
) ENGINE=INNODB;

-- Tabla para almacenar información de las preferencias de los clientes
CREATE TABLE tb_estadisticas_busquedas (
    id_estadistica INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    ubicacion_preferida VARCHAR(255) NOT NULL,
    precio_min DECIMAL(10, 2) NOT NULL CHECK (precio_min > 0),
    precio_max DECIMAL(10, 2) NOT NULL CHECK (precio_max > 0),
    id_categoria INT NOT NULL,
    CONSTRAINT fk_clientes_busquedas FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente),
    CONSTRAINT fk_categorias_busquedas FOREIGN KEY (id_categoria) REFERENCES tb_categorias_propiedades(id_categoria)
) ENGINE=INNODB;

-- Tabla para almacenar los Conversacion entre clientes y administradores
CREATE TABLE tb_conversaciones (
    id_conversacion INT AUTO_INCREMENT PRIMARY KEY,
    id_administrador INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_administrador_conversacion FOREIGN KEY (id_administrador) REFERENCES tb_administradores(id_administrador),
    CONSTRAINT fk_cliente_conversacion FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
) ENGINE=INNODB;

-- Tabla para almacenar los mensajes entre clientes y administradores
CREATE TABLE tb_mensajes (
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    id_conversacion INT NOT NULL,
    mensaje_admin TEXT NULL,
    mensaje_cliente TEXT NULL,
    fecha_envio TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
    leido_mensaje BOOLEAN DEFAULT (0) NOT NULL,
    CONSTRAINT fk_conversacion_id_conversacion FOREIGN KEY (id_conversacion) REFERENCES tb_conversaciones(id_conversacion)
) ENGINE=INNODB;

-- Tabla para almacenar me gustas de búsquedas de propiedades
CREATE TABLE tb_preferencias_clientes (
    id_preferencia INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_propiedad INT NOT NULL,
    fecha_preferencia DATE DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_cliente_preferencias FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente),
    CONSTRAINT fk_propiedad_preferencias FOREIGN KEY (id_propiedad) REFERENCES tb_propiedades(id_propiedad)
) ENGINE=INNODB;

-- Tabla para almacenar los tours virtuales de las propiedades
CREATE TABLE tb_tours_virtuales (
    id_tour INT AUTO_INCREMENT PRIMARY KEY,
    tour_url VARCHAR(255) NOT NULL,
    id_propiedad INT NOT NULL,
    CONSTRAINT fk_propiedad_tours FOREIGN KEY (id_propiedad) REFERENCES tb_propiedades(id_propiedad)
) ENGINE=INNODB;
