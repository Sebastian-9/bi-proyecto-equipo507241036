#Instrucciones ETL



##Motor y Versión
Motor de Base de Datos: MySQL 8.x
Herramienta ETL: Pentaho Data Integration (Community Edition, versión 9.4 - Spoon)

##Parámetros de Conexión (Sin Credenciales)
Host / Servidor: `localhost` (o IP del servidor configurado)

Puerto: `3306`

Base de Datos / Esquema: `transrutas_del_caribe`

Usuario de Conexión: `root` (o el usuario asignado para el desarrollo, omitiendo contraseñas por seguridad)

Tipo de Conexión: MySQL Native (JDBC)

##Ubicación Esperada de las Fuentes
Los archivos fuente originales de la operación de transporte deben ubicarse en la siguiente ruta o configurarse en las rutas absolutas de los componentes de entrada en Pentaho:
* `data/source/Operacion_pasajeros_fechas_modificadas.csv` (Archivos planos de despachos y pasajeros)
* Catálogos complementarios de referencia en formato Excel (`.xlsx`).



##Orden de Ejecución del ETL
Para garantizar la integridad referencial y el correcto cargado de las llaves foráneas en el modelo en estrella, el orden estricto de ejecución de las transformaciones es el siguiente:

###Carga de Dimensiones Independientes:
   * `t_dim_tiempo` (Generación y población de la dimensión temporal)
   * `t_dim_ruta` (Extracción, limpieza y carga de rutas)
   * `t_dim_terminal` (Extracción, limpieza y carga de terminales)
   * `t_dim_vehiculo` (Extracción, limpieza y carga de vehículos)

###Carga de la Tabla de Hechos:
`t_hechos_despachos` (Procesa el archivo principal de operaciones, realiza los cruces de búsqueda con las dimensiones previamente cargadas e inserta los registros consolidados en `hechos_despachos`).
