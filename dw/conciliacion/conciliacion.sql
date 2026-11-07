
SELECT 
    'hechos_despachos' AS tabla, 
    COUNT(*) AS total_registros 
FROM hechos_despachos;


SELECT 'dim_ruta' AS dimension, COUNT(*) AS total FROM dim_ruta
UNION ALL
SELECT 'dim_terminal' AS dimension, COUNT(*) AS total FROM dim_terminal
UNION ALL
SELECT 'dim_vehiculo' AS dimension, COUNT(*) AS total FROM dim_vehiculo
UNION ALL
SELECT 'dim_tiempo' AS dimension, COUNT(*) AS total FROM dim_tiempo;

SELECT 
    COUNT(h.id_hecho) AS total_despachos_conciliados,
    SUM(h.pasajeros) AS total_pasajeros_movilizados
FROM hechos_despachos h
INNER JOIN dim_ruta r ON h.id_ruta = r.id_ruta
INNER JOIN dim_terminal t ON h.id_terminal = t.id_terminal
INNER JOIN dim_vehiculo v ON h.id_vehiculo = v.id_vehiculo
INNER JOIN dim_tiempo ti ON h.id_tiempo = ti.id_tiempo;