-- =========================================================
-- Desafío - Explorando relaciones y consultas avanzadas en SQL
-- Requerimiento 2: Uso de funciones de agregación y cláusula HAVING
-- Base de datos: arquitectura_relacional.sql
-- =========================================================


-- ---------------------------------------------------------
-- Consulta 2.1: Nombre de producto y cantidad total vendida,
-- solo para productos con más de 1 unidad vendida.
-- ---------------------------------------------------------
SELECT
    p.nombre_producto AS producto,             -- nombre del producto a mostrar
    SUM(v.cantidad) AS cantidad_total_vendida  -- suma todas las unidades vendidas de ese producto
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto  -- une cada venta con el producto vendido
GROUP BY p.nombre_producto              -- agrupa las ventas por producto, para poder sumar sus cantidades
HAVING SUM(v.cantidad) > 1;             -- filtra los grupos ya sumados, dejando solo productos con más de 1 unidad vendida en total


-- ---------------------------------------------------------
-- Consulta 2.2: Cuántas ventas realizó cada sucursal y el
-- promedio de total vendido por venta.
-- ---------------------------------------------------------
SELECT
    s.nombre_sucursal AS sucursal,          -- nombre de la sucursal
    COUNT(v.id_venta) AS cantidad_ventas,   -- cuenta cuántas filas de venta tiene cada sucursal
    AVG(v.total) AS promedio_total          -- calcula el promedio del monto "total" de esas ventas
FROM ventas v
JOIN sucursales s ON v.id_sucursal = s.id_sucursal  -- une cada venta con la sucursal donde se realizó
GROUP BY s.nombre_sucursal;              -- agrupa por sucursal para que COUNT y AVG se calculen por separado en cada una
