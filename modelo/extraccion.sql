SELECT 
    t.id_tiempo,
    t.anio,
    t.mes,
    t.fecha_completa,
    r.id_ruta,
    r.municipio_origen_nombre,
    r.municipio_destino_nombre,
    term.nombre_terminal,
    v.clase_vehiculo,
    SUM(hd.pasajeros) AS total_pasajeros
FROM hechos_despachos hd
JOIN dim_tiempo t ON hd.id_tiempo = t.id_tiempo
JOIN dim_ruta r ON hd.id_ruta = r.id_ruta
JOIN dim_terminal term ON hd.id_terminal = term.id_terminal
JOIN dim_vehiculo v ON hd.id_vehiculo = v.id_vehiculo
GROUP BY 
    t.id_tiempo, 
    t.anio, 
    t.mes, 
    t.fecha_completa, 
    r.id_ruta, 
    r.municipio_origen_nombre, 
    r.municipio_destino_nombre, 
    term.nombre_terminal, 
    v.clase_vehiculo
ORDER BY t.fecha_completa ASC;