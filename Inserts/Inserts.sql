INSERT INTO tb_clientes (nombre_cliente, email_cliente, telefono_cliente, clave_cliente, estado_cliente) 
VALUES 
('Juan Perez', 'juan@gmail.com', '123-456-7890', 'contraseña123', 'activo'),
('María García', 'maria@gmail.com', '987-654-3210', 'clave123', 'activo'),
('Pedro Ramirez', 'pedro@gmail.com', '555-555-5555', 'contraseña456', 'activo'),
('Ana Martínez', 'ana@gmail.com', '111-222-3333', 'clave456', 'activo'),
('Luis González', 'luis@gmail.com', '333-444-5555', 'password123', 'activo'),
('Laura Rodríguez', 'laura@gmail.com', '999-888-7777', 'password456', 'activo'),
('Carlos Sánchez', 'carlos@gmail.com', '777-888-9999', '123456', 'activo'),
('Sofía López', 'sofia@gmail.com', '666-777-8888', 'abc123', 'activo'),
('Jorge Martín', 'jorge@gmail.com', '222-333-4444', 'qwerty123', 'activo'),
('Marta Fernández', 'marta@gmail.com', '444-555-6666', 'asdf123', 'activo');

SELECT * FROM tb_clientes;

INSERT INTO tb_blogs (titulo_blog, descripcion_blog, imagen_blog) 
VALUES 
('Experiencia increíble con Habit', 'Quiero compartir mi experiencia positiva trabajando con Habit. Su profesionalismo y atención al cliente son inigualables.', 'opinion1.jpg'),
('Recomiendo Habit a todos', 'He tenido la mejor experiencia trabajando con Habit. Su equipo hizo que el proceso de compra de mi casa fuera fácil y sin estrés.', 'opinion2.jpg'),
('Muy satisfecho con el servicio de Habit', 'Estoy muy satisfecho con el servicio que recibí de Habit. Encontraron la casa perfecta para mí y se aseguraron de que todo saliera a la perfección.', 'opinion3.jpg'),
('Profesionales y confiables: Habit', 'Gracias a Habit por su profesionalismo y dedicación. Recomiendo encarecidamente sus servicios a cualquiera que esté buscando comprar o vender una propiedad.', 'opinion4.jpg'),
('¡La mejor decisión que he tomado! - Habit', 'Trabajar con Habit fue la mejor decisión que he tomado en el proceso de compra de mi casa. Su equipo me guió en cada paso y se aseguró de que estuviera completamente satisfecho.', 'opinion5.jpg');

SELECT * FROM tb_blogs; 

INSERT INTO tb_administradores (nombre_administrador, telefono_administrador, email_administrador, clave_administrador, rol_administrador) 
VALUES 
('Juan Pérez', '123-456-7890', 'juan_admin@gmail.com', 'clave123', 1),
('María García', '987-654-3210', 'maria_admin@gmail.com', 'clave456', 0),
('Pedro Ramírez', '555-555-5555', 'pedro_admin@gmail.com', 'clave789', 0),
('Ana Martínez', '111-222-3333', 'ana_admin@gmail.com', 'claveabc', 0),
('Luis González', '333-444-5555', 'luis_admin@gmail.com', 'clavedef', 0),
('Laura Rodríguez', '999-888-7777', 'laura_admin@gmail.com', 'claveghi', 0),
('Carlos Sánchez', '777-888-9999', 'carlos_admin@gmail.com', 'clavejkl', 0),
('Sofía López', '666-777-8888', 'sofia_admin@gmail.com', 'clavemno', 0),
('Jorge Martín', '222-333-4444', 'jorge_admin@gmail.com', 'clavepqr', 0),
('Marta Fernández', '444-555-6666', 'marta_admin@gmail.com', 'clavestu', 0);

SELECT * FROM tb_administradores;

INSERT INTO tb_categorias_propiedades (nombre_categoria) 
VALUES 
('Ranchos'),
('Casas'),
('Apartamentos'),  
('Pisos'),
('Chalets'),
('Terrenos');

SELECT * FROM tb_categorias_propiedades; 

INSERT INTO tb_zonas_propiedades (nombre_zona) 
VALUES 
('Centro'),
('Norte'),
('Sur'),
('Este'),
('Oeste');

SELECT * FROM tb_zonas_propiedades;

INSERT INTO tb_propiedades (titulo_propiedad, descripcion_propiedad, descripcion_dirrecion, latitud_ubicacion, longitud_ubicacion, estado_propiedad, precio_propiedad, id_categoria, id_zona, id_administrador) 
VALUES 
('Hermosa Casa en el Centro', 'Amplia casa con jardín y garaje en el centro de la ciudad. Ideal para familias.', 'Calle Principal 123', 40.7128, -74.0060, 'Venta', 250000, 2, 1, 1),
('Departamento Moderno en el Norte', 'Departamento completamente renovado con acabados de alta calidad. Excelente ubicación cerca de parques y servicios.', 'Avenida Norte 456', 40.7306, -73.9352, 'Alquiler', 1200, 3, 2, 2),
('Terreno Amplio en las Afueras', 'Terreno grande con potencial para desarrollo residencial. Hermosas vistas y fácil acceso desde la autopista.', 'Carretera Sur Km 10', 40.7128, -74.0060, 'Venta', 150000, 3, 3, 3),
('Apartamento Luminoso en el Este', 'Apartamento luminoso y espacioso con balcón. Excelente distribución y cerca de transporte público.', 'Calle Este 789', 40.7128, -74.0060, 'Venta', 180000, 4, 4, 4),
('Casa En Lomas del Sur', 'Casa acogedora con jardín y piscina. Perfecto para disfrutar del aire libre en familia.', 'Avenida Oeste 1011', 40.7128, -74.0060, 'Venta', 350000, 2, 3, 5),
('Apartamento con Jardín en el Oeste', 'Apartamento acogedor con jardín y piscina. Perfecto para disfrutar del aire libre en familia.', 'Avenida Oeste 1011', 40.7128, -74.0060, 'Venta', 350000, 3, 5, 5),
('Rancho en el Norte de la playa', 'Lindo rancho en el norte, muy  acogedor con jardín y piscina. Perfecto para disfrutar del aire libre en familia. Acceso directo a la playa', 'Avenida Calle Sol 1011', 40.7128, -74.0060, 'Venta', 350000, 1, 2, 3),
('Apartamento con acceso directo a centro comercial', 'Apartamento espacioso, con acceso directo a Centro Comercial Galerías. Perfecto para un estudiante o persona soltera', 'Avenida Tutunichapa costado de Galerías Escalón 1201', 40.7128, -74.0060, 'Alquiler', 350000, 3, 1, 6),
('Terreno en el Sur de San Salvador.', 'Terreno especial para construcción de casa. 100mt2 por 100mt2', 'Calle San José', 40.7128, -74.0060, 'Venta', 350000, 6, 3, 4),
('Casa en el Norte de San Salvador.', 'Casa amplia con un jardín grande y piscina. Perfecto para una familia que ame el frío', 'Carretera al volcán km 20', 40.7128, -74.0060, 'Venta', 350000, 6, 3, 4);



SELECT * FROM tb_propiedades ;

INSERT INTO tb_inmobiliarias (sanitarios_inmobiliario, habitaciones_inmobiliario, estacionamientos_inmobiliario, id_propiedad) 
VALUES 
(2, 3, 2, 1),
(1, 2, 1, 2),
(3, 4, 2, 3),
(2, 2, 0, 4),
(4, 5, 3, 5);

SELECT * FROM tb_inmobiliarias;

INSERT INTO tb_proyectos (normativas, id_propiedad) 
VALUES 
('Desarrollo residencial con 20 casas adosadas.', 1),
('Conjunto de 10 casas con áreas verdes y amenidades.', 2),
('Complejo de viviendas de lujo con seguridad las 24 horas.', 3),
('Barrio cerrado con 30 casas y acceso controlado.', 4),
('Proyecto de urbanización con 50 casas unifamiliares.', 5);

SELECT * FROM tb_proyectos;

INSERT INTO tb_propietarios (tipo_propietario, id_cliente, id_propiedad) 
VALUES 
('Terceros', 1, 1),
('Terceros', 2, 2),
('Empresa', NULL, 3),
('Terceros', 3, 4),
('Empresa', NULL, 5);

SELECT * FROM tb_propietarios;


INSERT INTO tb_imagenes_propiedades (imagen_url, id_propiedad) 
VALUES 
('https://ejemplo.com/imagen1.jpg', 1),
('https://ejemplo.com/imagen2.jpg', 2),
('https://ejemplo.com/imagen3.jpg', 3),
('https://ejemplo.com/imagen4.jpg', 4),
('https://ejemplo.com/imagen5.jpg', 5);

SELECT * FROM tb_propietarios;

INSERT INTO tb_estadisticas_busquedas (id_cliente, ubicacion_preferida, precio_min, precio_max, id_categoria) 
VALUES 
(1, 'Centro', 100000, 250000, 2),
(2, 'Norte', 80000, 150000, 3),
(3, 'Sur', 120000, 300000, 4),
(4, 'Este', 150000, 350000, 5),
(5, 'Oeste', 200000, 400000, 1);

SELECT * FROM tb_estadisticas_busquedas;

INSERT INTO tb_conversaciones (id_administrador, id_cliente) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
 
SELECT * FROM tb_conversaciones;

INSERT INTO tb_mensajes (id_conversacion, mensaje_admin, mensaje_cliente, leido_mensaje) 
VALUES 
(1, NULL, 'Hola, ¿en qué puedo ayudarte?', 0),
(2, NULL, 'Buen día, ¿cómo puedo asistirte hoy?', 0),
(3, NULL, 'Hola, ¿qué información necesitas?', 0),
(4, NULL, '¡Hola! ¿En qué puedo ayudarte hoy?', 0),
(5, NULL, 'Hola, ¿cómo estás? ¿En qué puedo ayudarte?', 0);

SELECT * FROM tb_mensajes;

INSERT INTO tb_preferencias_clientes (id_cliente, id_propiedad) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

SELECT * FROM tb_preferencias_clientes;

INSERT INTO tb_tours_virtuales (tour_url, id_propiedad) 
VALUES 
('https://ejemplo.com/tour1', 1),
('https://ejemplo.com/tour2', 2),
('https://ejemplo.com/tour3', 3),
('https://ejemplo.com/tour4', 4),
('https://ejemplo.com/tour5', 5);

SELECT * FROM tb_tours_virtuales;
