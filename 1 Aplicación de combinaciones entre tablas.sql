-- ---------------------------------------------------------
-- Consulta 1.1: Nombre del cliente, producto comprado y nombre
-- de la tienda, solo para ventas realizadas en julio.
-- ---------------------------------------------------------
SELECT
    c.nombre        AS cliente,
    p.nombre_producto AS producto,
    s.nombre_sucursal AS tienda
FROM ventas v
JOIN clientes c   ON v.id_cliente  = c.id_cliente
JOIN productos p  ON v.id_producto = p.id_producto
JOIN sucursales s ON v.id_sucursal = s.id_sucursal
WHERE strftime('%Y-%m', v.fecha) = '2024-07';

/*
Nota: se usa strftime('%Y-%m', v.fecha) = '2024-07' para filtrar por
año y mes de forma precisa (no solo por mes), evitando mezclar julios
de distintos años si la base crece a futuro.
*/


-- ---------------------------------------------------------
-- Consulta 1.2: Total de ventas (suma de montos) por ciudad
-- de tienda.
-- ---------------------------------------------------------
SELECT
    s.ciudad AS ciudad_tienda,
    SUM(v.total) AS total_ventas
FROM ventas v
JOIN sucursales s ON v.id_sucursal = s.id_sucursal
GROUP BY s.ciudad
ORDER BY total_ventas DESC;

/*

Nota: la ciudad "Internet" corresponde a la Tienda Online (canal
digital, sin ciudad física asociada en los datos de ejemplo).
*/
