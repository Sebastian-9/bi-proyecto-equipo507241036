CREATE TABLE IF NOT EXISTS hechos_predicciones (
    id_tiempo BIGINT UNSIGNED NOT NULL,
    id_ruta BIGINT UNSIGNED NOT NULL,
    valor_predicho DECIMAL(10,2) NOT NULL,
    valor_real DECIMAL(10,2) NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT id_pred_tiempo FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo),
    CONSTRAINT id_pred_ruta FOREIGN KEY (id_ruta) REFERENCES dim_ruta(id_ruta)
) ENGINE=InnoDB;