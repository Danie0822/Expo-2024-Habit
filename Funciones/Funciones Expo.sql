-- Funciones 


-- Función para obtener el número de likes de una propiedad
DROP FUNCTION IF EXISTS obtener_cantidad_likes;
DELIMITER $$

CREATE FUNCTION obtener_cantidad_likes(id_propiedades INT) RETURNS INT
BEGIN
    DECLARE cantidad_likes INT;
    
    SELECT COUNT(*) INTO cantidad_likes
    FROM tb_preferencias_clientes
    WHERE id_propiedad = id_propiedades;
    
    RETURN cantidad_likes;
END$$

DELIMITER ;


-- Función para obtener el rango de precios más buscado
DROP FUNCTION IF EXISTS obtener_rango_precio_mas_buscado;
DELIMITER $$

CREATE FUNCTION obtener_rango_precio_mas_buscado() RETURNS VARCHAR(255)
BEGIN
    DECLARE rango_precios VARCHAR(255);
    
    SELECT CONCAT(ROUND(AVG(precio_min), 2), ',', ROUND(AVG(precio_max), 2))
    INTO rango_precios
    FROM tb_estadisticas_busquedas;
    
    RETURN rango_precios;
END$$

DELIMITER ;


-- Función para obtener las categorías más buscadas de estadisticas de busqueda
DROP FUNCTION IF EXISTS obtener_categorias_mas_buscadas;
DELIMITER $$

CREATE FUNCTION obtener_categorias_mas_buscadas() RETURNS VARCHAR(255)
BEGIN
    DECLARE categorias VARCHAR(255);
    
    SELECT GROUP_CONCAT(nombre_categoria SEPARATOR ', ')
    INTO categorias
    FROM (
        SELECT nombre_categoria
        FROM tb_categorias_propiedades cp
        JOIN tb_estadisticas_busquedas eb ON cp.id_categoria = eb.id_categoria
        GROUP BY nombre_categoria
        ORDER BY COUNT(*) DESC
        LIMIT 5
    ) AS subquery;
    
    RETURN categorias;
END$$

DELIMITER ;


-- Vistas


-- Vista de propiedades con likes e imágenes
DROP VIEW IF EXISTS propiedades_con_likes_e_imagenes;
CREATE VIEW propiedades_con_likes_e_imagenes AS
SELECT p.id_propiedad,
       p.titulo_propiedad,
       p.descripcion_propiedad,
       ip.imagen_url AS url_imagen,
       obtener_cantidad_likes(p.id_propiedad) AS cantidad_likes
FROM tb_propiedades p
JOIN tb_imagenes_propiedades ip ON p.id_propiedad = ip.id_propiedad
GROUP BY p.id_propiedad
ORDER BY cantidad_likes DESC
LIMIT 5;

SELECT * FROM propiedades_con_likes_e_imagenes;

-- Vista de estadísticas
DROP VIEW IF EXISTS estadisticas;
CREATE VIEW estadisticas AS
SELECT 
    CONVERT(SUBSTRING_INDEX(CONVERT(obtener_rango_precio_mas_buscado() USING utf8mb4), ',', 1) USING utf8mb4) AS precio_minimo_mas_buscado,
    CONVERT(SUBSTRING_INDEX(CONVERT(obtener_rango_precio_mas_buscado() USING utf8mb4), ',', -1) USING utf8mb4) AS precio_maximo_mas_buscado,
    obtener_categorias_mas_buscadas() AS categorias_mas_buscadas,
    (SELECT COUNT(*) FROM tb_estadisticas_busquedas) AS total_busquedas;
    


