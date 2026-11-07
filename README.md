#bi-proyecto-equipo507241036

##Integrantes

Angie Salome Barrera Roldan - 507241701

Andres Felipe Cruz Osorio - 507241703

Sebastian Molina Murillo - 507241036

##Descripcion del Caso

TransRutas del Caribe S.A.S. es una empresa colombiana con más de 8 años de experiencia en el sector de movilidad y transporte intermunicipal de pasajeros y encomiendas en la región Caribe. La compañía opera una flota propia y afiliada de 100 vehículos (microbuses, busetas y buses de niveles básico y de lujo) conectando las terminales de transporte y rutas estratégicas entre Barranquilla Armenia y Buenaventura. Actualmente comercializa tiquetes a través de dos canales principales: taquillas presenciales en las terminales y una plataforma digital (sitio web y aplicación móvil). 
 
La directora de planeación y operaciones de TransRutas del Caribe S.A.S., Claudia Rincón, lleva más de seis meses intentando consolidar un informe gerencial que logre cruzar de manera efectiva la rentabilidad por trayecto municipal, la tasa de ocupación real de la flota —cruzando el número de pasajeros transportados frente a la capacidad nominal de los vehículos registrados en el catálogo operativo (microbuses, busetas y buses de niveles básico y de lujo)— y el rendimiento de combustible por cada código de origen y destino según el catálogo maestro territorial de la compañía. 

En la actualidad, Claudia se enfrenta a una parálisis operativa: es incapaz de tomar decisiones estratégicas sobre la asignación eficiente de microbuses y buses ejecutivos, la optimización de frecuencias en rutas de alta y baja densidad, o el ajuste de tarifas diferenciales. 

Al examinar el flujo diario de la compañía, se observa que los registros masivos de despachos de vehículos por carretera —que almacenan fechas de salida, códigos de origen y destino, número de pasajeros movilizados y las placas de los automotores— presentan inconsistencias en la codificación de municipios y formatos de texto variables que dificultan su lectura automatizada. 

Por otro lado, el catálogo oficial de vehículos define con precisión los identificadores únicos de los automotores, su clase, su nivel de servicio y su capacidad exacta de pasajeros; sin embargo, este registro opera de forma totalmente aislada y carece de mecanismos de sincronización con las planillas de despacho diario. 

Asimismo, aunque la departamentalización y los códigos numéricos oficiales de los municipios se encuentran consignados en las tablas maestras de referencia territorial de la organización, las áreas operativas suelen utilizar en la práctica nombres comerciales abreviados o variantes escritas de manera distinta en los reportes de ruta, lo que rompe los cruces geográficos automáticos entre sistemas. 

Cada fin de mes, el equipo de tecnología y estadística invierte jornadas completas intentando unificar y cruzar manualmente estos volúmenes de datos provenientes de archivos CSV O XML para presentar un informe preliminar. Esto genera retrasos críticos, cifras contradictorias entre departamentos y una total falta de visibilidad analítica para la alta gerencia. 


##Documentación del Proceso ETL - TransRutas del Caribe

Este documento describe la configuración técnica, los parámetros de conexión y la secuencia de ejecución de los procesos ETL implementados en Pentaho Data Integration para el Data Warehouse de TransRutas del Caribe.

1. Motor y Versión
Motor de Base de Datos: MySQL 8.x
Herramienta ETL: Pentaho Data Integration (Community Edition, versión 9.4 - Spoon)


2. Parámetros de Conexión (Sin Credenciales)
Host / Servidor: `localhost` (o IP del servidor configurado)
Puerto: `3306`
Base de Datos / Esquema: `transrutas_del_caribe`
Usuario de Conexión: `root` (o el usuario asignado para el desarrollo, omitiendo contraseñas por seguridad)
Tipo de Conexión: MySQL Native (JDBC)

3. Ubicación Esperada de las Fuentes
Los archivos fuente originales de la operación de transporte deben ubicarse en la siguiente ruta o configurarse en las rutas absolutas de los componentes de entrada en Pentaho:
* `data/source/Operacion_pasajeros_fechas_modificadas.csv` (Archivos planos de despachos y pasajeros)
* Catálogos complementarios de referencia en formato Excel (`.xlsx`).



4. Orden de Ejecución del ETL
Para garantizar la integridad referencial y el correcto cargado de las llaves foráneas en el modelo en estrella, el orden estricto de ejecución de las transformaciones es el siguiente:

1. Carga de Dimensiones Independientes:
   * `t_dim_tiempo` (Generación y población de la dimensión temporal)
   * `t_dim_ruta` (Extracción, limpieza y carga de rutas)
   * `t_dim_terminal` (Extracción, limpieza y carga de terminales)
   * `t_dim_vehiculo` (Extracción, limpieza y carga de vehículos)

2. Carga de la Tabla de Hechos:
`t_hechos_despachos` (Procesa el archivo principal de operaciones, realiza los cruces de búsqueda con las dimensiones previamente cargadas e inserta los registros consolidados en `hechos_despachos`).
