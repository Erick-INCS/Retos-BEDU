[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 04`](../Readme.md) > Reto 1

## Reto 1: Realizando operaciones con tablas

### 1. Objetivos :dart:
- Realizar operaciones SQL para administrar tablas
- Crear tablas acorde a los datos

### 2. Requisitos :clipboard:
- Servidor __MySQL__ instalado

### 3. Desarrollo :rocket:

1. Definir los campos y tipos de datos para la tabla `movies` haciendo uso de los archivos `movies.dat` y `README`.
```sql

```

1. Crear la tabla `movies` (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos).
```sql

```

1. Definir los campos y tipos de datos para la tabla `ratings` haciendo uso de los archivos `ratings.dat` y `README`.
```sql

```

1. Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)
  ```sql

  ```

---

> **Nota:** *Observa que la tabla `ratings` requiere llaves foráneas. Revisa esta referencia o pregunta a tu experta(o): https://www.w3schools.com/sql/sql_foreignkey.asp*

> *Parte de tu formación como Data Scientist consiste en que aprendas a consultar documentación.* :nerd: Google es tu amigo. :heart:

---

<br/>

[`Anterior`](../Ejemplo-02/Readme.md) | [`Siguiente`](../Readme.md#importando-datos-a-una-tabla-en-formato-csv)   
[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 04`](../Readme.md) > Reto 2

## Reto 2: Importando datos a una tabla en formato CSV

### 1. Objetivos :dart:
- Aplicar el procedimiento para importación de datos a una tabla
- Validar que la correcta importación de los datos

### 2. Requisitos :clipboard:
- Servidor __MySQL__ instalado

### 3. Desarrollo :rocket:

1. Usando como base el archivo `movies.dat`, limpiarlo e importar los datos en la tabla `movies` creada en el Reto 1.   

   > **Importante:** Este archivo presenta un problema muy común de *encoding*, es decir, la codificación con la que fue definido, no es reconocida por __MySQL__. Para solucionar este problema, elige una codificación diferente al momento de cargar los datos.

 ```sql

 ```

1. Usando como base el archivo `ratings.dat`, limpiarlo e importar los datos en la tabla `ratings` creada en el Reto 2.   

   > **Importante:** Como podrás notar, este archivo tiene demasiados registros, de manera que es normal que la carga sea muy lenta. Esto es algo muy común cuando nos enfrentamos a la carga de archivos. Si ya lleva mucho tiempo y no finaliza, no te preocupes, puedes cancelar la carga.
 ```sql

 ```

1. Finalmente, añade un registro en cada tabla usando `INSERT INTO`.
```sql

```

<br/>

[`Anterior`](../Ejemplo-03/Readme.md) | [`Siguiente`](../Readme.md)
[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 04`](../Readme.md) > Reto 3

## Reto 3: Realizando operaciones con Colecciones e importando datos

### 1. Objetivos :dart:
- Que el alumno cuente con una Colección para importar datos
- Que el alumno importe datos en formato CSV a una Colección

### 2. Requisitos :clipboard:
1. MongoDB Compass instalado
1. Datos de conexión al Servidor MongoDB

### 3. Desarrollo :rocket:
Se deberá de crear colecciones e importar los datos de los archivos `movies.csv` y `ratings.csv`.

1. Crear la colección `movies`

   ![Colección movies](imagenes/colecciones.png)

1. Importar datos a la colección `movies` desde el archivo `movies.csv`

   Para importar documentos, se usa la opción del menú `Collection > Import Data` que abre un diálogo para seleccionar del tipo de archivo CSV y el archivo mismo.

   ![Importando datos csv](imagenes/importando-datos.png)

   Validar que cada campo tenga nombre y que estén todos los campos, además valida la cantidad de documentos, que en este caso debería de ser 3883.

1. Crear la colección `ratings`
   ![Colección movies](imagenes/colecciones-02.png)

   Seleccionar la colección y continuar.

1. Importar datos a la colección `ratings` desde el archivo `ratings.csv`

   Para importar usar la opción del menú `Collection > Import Data` que abre un diálogo para seleccionar del tipo de archivo CSV y el archivo mismo.

   Validar que cada campo tenga nombre y que estén todos los campos, además valida la cantidad de documentos, que en este caso debería de ser 1000209 documentos.


[`Anterior`](../Ejemplo-06/Readme.md) | [`Siguiente`](../Readme.md)
