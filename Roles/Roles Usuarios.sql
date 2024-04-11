
DROP USER IF EXISTS 'habit_inmobiliaria_desarrollador'@'localhost';

-- Crear usuario para la base de datos
CREATE USER 'habit_inmobiliaria_desarrollador'@'localhost' IDENTIFIED BY 'habit123';

-- Otorgar permisos DML
GRANT SELECT, INSERT, UPDATE, DELETE ON Habit_inmobiliaria.* TO 'habit_inmobiliaria_desarrollador'@'localhost';

-- Otorgar permisos para ejecutar y crear funciones, procedimientos, triggers y vistas
GRANT EXECUTE, CREATE ROUTINE, ALTER ROUTINE, CREATE VIEW, TRIGGER ON Habit_inmobiliaria.* TO 'habit_inmobiliaria_desarrollador'@'localhost';


-- Pruebas de usuario

-- Pruebas de funciones
SELECT obtener_cantidad_likes(1) AS likes_propiedad_1;
SELECT obtener_rango_precio_mas_buscado() AS rango_precio_mas_buscado;
SELECT obtener_categorias_mas_buscadas() AS categorias_mas_buscadas;

-- Pruebas de Vistas
SELECT * FROM propiedades_con_likes_e_imagenes;
SELECT * FROM estadisticas;
