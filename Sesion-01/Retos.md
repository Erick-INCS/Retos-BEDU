## Reto 1: Estructura de una tabla

<div style="text-align: justify;">

Usando la base de datos `tienda`, muestra la descripción de las tablas `articulo`, `puesto` y `venta`. Por cada tipo de dato que encuentres llena la siguiente tabla (a mano, puedes dibujarla en un cuaderno o dónde tú prefieras). Usa la [Documentación de MySQL](https://dev.mysql.com/doc/refman/8.0/en/data-types.html) como referencia si no recuerdas cómo se usa un comando, o por supuesto, preguntarle al experto.

| Tipo     | Descripción                                                                                         |
|----------|-----------------------------------------------------------------------------------------------------|
| int      | Un numero entero.                                                                                   |
| varchar  | Una cadena de caracteres.                                                                           |
| double   | Un numero entenro con decimaneles (soporta mas decimales que otras opciones).                       |
| timestamp| Es un valor que contiene fecha y hora y que tiene la capacidad de inicializarse con la fecha actual.|

<br/>

</div>
	
## Reto 2: Estructura básica de una consulta

<div style="text-align: justify;">

Usando la base de datos `tienda`, escribe consultas que permitan responder las siguientes preguntas.

- ¿Cuál es el nombre de los empleados con el puesto 4?
```sql
tienda> select nombre from empleado where id_puesto = 4;
```
```
+--------+
| nombre |
+--------+
| Norrie |
| Maxy   |
+--------+
```
- ¿Qué puestos tienen un salario mayor a $10,000?
```sql
tienda> select * from puesto where salario > 1000;
+-----------+--------------------------------------+----------+
| id_puesto | nombre                               | salario  |
+-----------+--------------------------------------+----------+
| 1         | Analog Circuit Design manager        | 28500.98 |
| 2         | Junior Executive                     | 10508.47 |
| 3         | Director of Sales                    | 28725.56 |
| 4         | Staff Scientist                      | 14965.31 |
| 5         | Desktop Support Technician           | 15885.41 |
| 6         | Budget/Accounting Analyst III        | 17131.23 |
| 7         | Accounting Assistant III             | 29257.91 |
| 8         | Programmer Analyst II                | 23223.95 |
| 9         | Nurse Practicioner                   | 11483.4  |
| 10        | Social Worker                        | 18008.12 |
| 11        | Teacher                              | 21472.3  |
| 12        | Structural Engineer                  | 10538.63 |
| 13        | Senior Editor                        | 11255.21 |
| 14        | Human Resources Manager              | 20746.5  |
| 15        | Web Designer IV                      | 24826.77 |
...
```
- ¿Qué artículos tienen un precio mayor a $1,000 y un iva mayor a 100?
```sql
tienda> select * from articulo where precio > 1000 and iva > 100;
+-------------+-------------------------------------+---------+---------+----------+
| id_articulo | nombre                              | precio  | iva     | cantidad |
+-------------+-------------------------------------+---------+---------+----------+
| 2           | Pasta - Angel Hair                  | 4391.73 |  959.51 | 503      |
| 3           | Soup Campbells - Tomato Bisque      | 2991.35 |  587.59 | 604      |
| 4           | Wine - Valpolicella Masi            | 2625.2  |  770.1  | 575      |
| 5           | Mousse - Banana Chocolate           | 3701.62 |  893.46 | 248      |
| 7           | Nantucket - Kiwi Berry Cktl.        | 5579.47 | 1012.33 | 527      |
| 8           | Wine - Fontanafredda Barolo         | 2684.64 |  327.16 | 682      |
| 9           | Lotus Rootlets - Canned             | 1996.46 |  324.72 | 636      |
| 10          | Wine - Vovray Sec Domaine Huet      | 6066.99 |  890.47 | 397      |
| 11          | Cake - Pancake                      | 5271.11 |  821.28 | 64       |
| 12          | Chocolate Liqueur - Godet White     | 1616.78 |  612.63 | 929      |
| 13          | Appetizer - Southwestern            | 1771.99 |  248.16 | 589      |
| 14          | Carbonated Water - Cherry           | 3808.49 |  133.03 | 914      |
| 15          | Jolt Cola                           | 5875.28 |  780.3  | 437      |
...
```
- ¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los empleados 835 o 369?
```sql
tienda> select * from venta where id_articulo in (135, 963) and id_empleado in (835, 369);
+----------+-------------+-------------+-----------+---------------------+
| id_venta | id_articulo | id_empleado | clave     | fecha               |
+----------+-------------+-------------+-----------+---------------------+
| 7        | 963         | 369         | 47335-894 | 2019-06-08 00:00:00 |
| 6        | 135         | 835         | 0049-0032 | 2020-02-03 15:05:27 |
+----------+-------------+-------------+-----------+---------------------+

2 rows in set
Time: 0.070s
```

<br/>

</div>
	
## Reto 3: Ordenamientos y Límites

<div style="text-align: justify;">

Usando la base de datos `tienda`, escribe una consulta que permita obtener el top 5 de puestos por salarios.
```sql
tienda> select * from puesto order by salario desc limit 5;
+-----------+-------------------------------+----------+
| id_puesto | nombre                        | salario  |
+-----------+-------------------------------+----------+
| 494       | Sales Representative          | 29996.58 |
| 18        | Speech Pathologist            | 29967.17 |
| 487       | Analog Circuit Design manager | 29923.95 |
| 79        | Junior Executive              | 29916.06 |
| 893       | Technical Writer              | 29912.53 |
+-----------+-------------------------------+----------+
5 rows in set
Time: 0.069s
```

<br/>

</div>
