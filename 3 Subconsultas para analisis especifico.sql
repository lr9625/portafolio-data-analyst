-- =========================================================
-- Desafío - Explorando relaciones y consultas avanzadas en SQL
-- Requerimiento 3: Subconsultas para análisis específico
-- Base de datos: arquitectura_relacional.sql
-- =========================================================


-- ---------------------------------------------------------
-- Consulta 3.1: Clientes que han realizado compras mayores
-- al promedio general de ventas.
-- ---------------------------------------------------------
SELECT DISTINCT
    c.nombre AS cliente                  -- nombre del cliente (DISTINCT evita repetirlo si tiene varias compras que califican)
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente   -- une cada cliente con sus ventas
WHERE v.total > (
    SELECT AVG(total) FROM ventas        -- subconsulta: calcula el promedio de la columna "total" considerando TODAS las ventas
);                                        -- la consulta externa deja solo las ventas cuyo total supera ese promedio


-- ---------------------------------------------------------
-- Consulta 3.2: Nombre del producto más caro vendido.
-- ---------------------------------------------------------
SELECT
    nombre_producto,
    precio
FROM productos
WHERE precio = (
    SELECT MAX(precio)                   -- subconsulta externa: el precio más alto...
    FROM productos
    WHERE id_producto IN (
        SELECT id_producto FROM ventas   -- subconsulta interna (anidada): solo productos que aparecen en al menos una venta
    )
);                                        -- la consulta principal busca el producto cuyo precio coincide con ese máximo
