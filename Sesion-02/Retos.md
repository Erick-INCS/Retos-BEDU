## Reto 1: Agrupamientos y subconsultas

<div style="text-align: justify;">

Usando la base de datos `tienda`, escribe consultas que permitan responder las siguientes preguntas.

- ¿Qué artículos incluyen la palabra `Pasta` en su nombre?
```sql
tienda> select * from articulo where nombre like '%pasta%';                                                                                        
+-------------+-----------------------------------+---------+---------+----------+
| id_articulo | nombre                            | precio  | iva     | cantidad |
+-------------+-----------------------------------+---------+---------+----------+
| 2           | Pasta - Angel Hair                | 4391.73 |  959.51 | 503      |
| 27          | Pasta - Elbows, Macaroni, Dry     | 3668.7  |  253.66 | 392      |
| 70          | Pasta - Shells, Medium, Dry       |  801.74 |  773.8  | 206      |
| 91          | Pasta - Cheese / Spinach Bauletti | 5811.44 |  619.36 | 15       |
| 134         | Pasta - Orzo, Dry                 | 6537.91 | 1113.99 | 906      |
| 213         | Pasta - Rotini, Colour, Dry       | 1830.13 |  373.98 | 309      |
| 233         | Pasta - Cannelloni, Sheets, Fresh | 2316.37 |  605.55 | 307      |
| 327         | Pasta - Cappellini, Dry           | 6994.49 |  766.18 | 828      |
| 361         | Pasta - Penne, Rigate, Dry        | 2222.62 |  584.88 | 276      |
| 426         | Pasta - Cappellini, Dry           | 2417.66 | 1088.42 | 411      |
| 431         | Pasta - Orzo, Dry                 |  806.33 |  495.92 | 142      |
| 570         | Pasta - Penne, Lisce, Dry         | 2141.06 |  809.94 | 88       |
| 600         | Pasta - Ravioli                   | 6504.48 |  612.67 | 15       |
| 655         | Pasta - Fettuccine, Dry           | 5369.44 |  314.75 | 344      |
| 750         | Pasta - Bauletti, Chicken White   | 1365.92 |  786.09 | 701      |
| 855         | Pasta - Tortellini, Fresh         |  708.96 |   61.74 | 38       |
| 994         | Pasta - Detalini, White, Fresh    | 6445.34 |  737.63 | 238      |
+-------------+-----------------------------------+---------+---------+----------+

17 rows in set
Time: 0.117s
```
- ¿Qué artículos incluyen la palabra `Cannelloni` en su nombre?
```sql
tienda> select * from articulo where nombre like '%Cannelloni%';                                                                                   
+-------------+-----------------------------------+---------+--------+----------+
| id_articulo | nombre                            | precio  | iva    | cantidad |
+-------------+-----------------------------------+---------+--------+----------+
| 233         | Pasta - Cannelloni, Sheets, Fresh | 2316.37 | 605.55 | 307      |
+-------------+-----------------------------------+---------+--------+----------+

1 row in set
Time: 0.107s
```
- ¿Qué nombres están separados por un guión (`-`) por ejemplo `Puree - Kiwi`?
```sql
tienda> select * from articulo where nombre like '%-%';                                                                                            
+-------------+-------------------------------------+---------+---------+----------+
| id_articulo | nombre                              | precio  | iva     | cantidad |
+-------------+-------------------------------------+---------+---------+----------+
| 1           | Chocolate - Feathers                | 2738.93 |   12.26 | 144      |
| 2           | Pasta - Angel Hair                  | 4391.73 |  959.51 | 503      |
| 3           | Soup Campbells - Tomato Bisque      | 2991.35 |  587.59 | 604      |
| 4           | Wine - Valpolicella Masi            | 2625.2  |  770.1  | 575      |
| 5           | Mousse - Banana Chocolate           | 3701.62 |  893.46 | 248      |
| 6           | Yeast Dry - Fleischman              |  923.18 |  524.08 | 818      |
| 7           | Nantucket - Kiwi Berry Cktl.        | 5579.47 | 1012.33 | 527      |
| 8           | Wine - Fontanafredda Barolo         | 2684.64 |  327.16 | 682      |
| 9           | Lotus Rootlets - Canned             | 1996.46 |  324.72 | 636      |
| 10          | Wine - Vovray Sec Domaine Huet      | 6066.99 |  890.47 | 397      |
| 11          | Cake - Pancake                      | 5271.11 |  821.28 | 64       |
| 12          | Chocolate Liqueur - Godet White     | 1616.78 |  612.63 | 929      |
| 13          | Appetizer - Southwestern            | 1771.99 |  248.16 | 589      |
| 14          | Carbonated Water - Cherry           | 3808.49 |  133.03 | 914      |
| 17          | Flavouring - Orange                 | 1620.95 |   64.81 | 931      |
| 18          | Sole - Fillet                       |  321.59 |  207.99 | 344      |
...
```
<br/>

</div>
## Reto 2: Funciones de agrupamiento

<div style="text-align: justify;">

Usando la base de datos `tienda`, escribe consultas que permitan responder las siguientes preguntas.

- ¿Cuál es el promedio de salario de los puestos?
```sql
tienda> select AVG(salario) as 'Promedio de salario' from puesto;                                                                                  
+---------------------+
| Promedio de salario |
+---------------------+
| 19595.051179999973  |
+---------------------+
1 row in set
Time: 0.075s
```
- ¿Cuántos artículos incluyen la palabra `Pasta` en su nombre?
```sql
tienda> select COUNT(*) from articulo where nombre like '%pasta%';                                                                                 
+----------+
| COUNT(*) |
+----------+
| 17       |
+----------+
1 row in set
Time: 0.121s
```
- ¿Cuál es el salario mínimo y máximo?
```sql
tienda> select min(salario) as minimo, max(salario) as maximo from puesto;                                                                         
+----------+----------+
| minimo   | maximo   |
+----------+----------+
| 10013.44 | 29996.58 |
+----------+----------+
1 row in set
Time: 0.082s
```
- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
```sql
tienda> select sum(salario) as 'Suma de los ultimos 5 salarios' from (select salario from puesto order by id_puesto desc limit 5) as slarios;      
+--------------------------------+
| Suma de los ultimos 5 salarios |
+--------------------------------+
| 79690.05                       |
+--------------------------------+
1 row in set
Time: 0.094s
```

</div> 
[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 02`](../Readme.md) > `Reto 3`
	
## Reto 3: Agrupamientos

<div style="text-align: justify;">

Usando la base de datos `tienda`, escribe consultas que permitan responder las siguientes preguntas.

- ¿Cuántos registros hay por cada uno de los puestos?
```sql
tienda> select nombre, count(*) from puesto group by nombre;                                                                                       
+--------------------------------------+----------+
| nombre                               | count(*) |
+--------------------------------------+----------+
| Analog Circuit Design manager        | 8        |
| Junior Executive                     | 8        |
| Director of Sales                    | 8        |
| Staff Scientist                      | 9        |
| Desktop Support Technician           | 5        |
| Budget/Accounting Analyst III        | 4        |
| Accounting Assistant III             | 3        |
| Programmer Analyst II                | 2        |
| Nurse Practicioner                   | 16       |
| Social Worker                        | 10       |
| Teacher                              | 9        |
| Structural Engineer                  | 10       |
| Senior Editor                        | 10       |
| Human Resources Manager              | 6        |
...
```
- ¿Cuánto dinero se paga en total por puesto?
```sql
tienda> select nombre, sum(salario) from puesto group by nombre;                                                                                   
+--------------------------------------+---------------------+
| nombre                               | sum(salario)        |
+--------------------------------------+---------------------+
| Analog Circuit Design manager        | 179310.18000000002  |
| Junior Executive                     | 156846.26           |
| Director of Sales                    | 136630.69           |
| Staff Scientist                      | 157528.98           |
| Desktop Support Technician           |  92315.22           |
| Budget/Accounting Analyst III        |  70107.77           |
| Accounting Assistant III             |  78947.08           |
| Programmer Analyst II                |  35658.78           |
| Nurse Practicioner                   | 296384.04           |
| Social Worker                        | 168107.81           |
| Teacher                              | 176137.90999999997  |
| Structural Engineer                  | 196719.8            |
| Senior Editor                        | 194293.35           |
| Human Resources Manager              | 134137.89           |
| Web Designer IV                      |  94720.48999999999  |
...
```
- ¿Cuál es el número total de ventas por vendedor?
```sql
tienda> select id_empleado, count(*) as ventas from venta group by id_empleado;                                                                    
+-------------+--------+
| id_empleado | ventas |
+-------------+--------+
| 2           | 2      |
| 3           | 2      |
| 4           | 1      |
| 5           | 1      |
| 6           | 2      |
| 12          | 5      |
| 15          | 4      |
| 18          | 2      |
| 22          | 1      |
| 23          | 2      |
| 25          | 1      |
| 26          | 1      |
...
```
- ¿Cuál es el número total de ventas por artículo?
```sql
tienda> select id_articulo, count(*) as ventas from venta group by id_articulo;                                                                    
+-------------+--------+
| id_articulo | ventas |
+-------------+--------+
| 2           | 1      |
| 3           | 1      |
| 4           | 2      |
| 8           | 1      |
| 10          | 1      |
| 11          | 1      |
| 12          | 1      |
| 13          | 2      |
| 15          | 1      |
| 18          | 1      |
| 20          | 1      |
...
```

<br/>

</div>
	
## Reto 4: Subconsultas

<div style="text-align: justify;">

Usando la base de datos `tienda`, escribe consultas que permitan responder las siguientes preguntas.

- ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $10,000?
```sql
tienda> select nombre from empleado e where (select p.salario from puesto p where p.id_puesto = e.id_puesto) > 10000;                              
+-------------+
| nombre      |
+-------------+
| Enrichetta  |
| Morey       |
| Jeannette   |
| Cassey      |
| Gnni        |
| Lisle       |
| Andre       |
| Land        |
| Nikki       |
| Aldridge    |
| Jerald      |
...
```
- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
```sql
tienda> select id_empleado, max(cantidad) as MayorCantidad, min(cantidad) as MenorCantidad from (select clave, id_empleado, count(*) as cantidad from venta group by clave, id_empleado) t group by id_empleado                                                                               
+-------------+---------------+---------------+
| id_empleado | MayorCantidad | MenorCantidad |
+-------------+---------------+---------------+
| 569         | 1             | 1             |
| 413         | 2             | 1             |
| 765         | 1             | 1             |
| 119         | 1             | 1             |
| 90          | 1             | 1             |
| 835         | 1             | 1             |
| 369         | 1             | 1             |
| 555         | 1             | 1             |
| 187         | 1             | 1             |
| 42          | 1             | 1             |
| 682         | 1             | 1             |
| 341         | 1             | 1             |
...
```
- ¿Cuál es el nombre del puesto de cada empleado?
```sql
tienda> select nombre, (select p.nombre from puesto as p where p.id_p
        uesto = empleado.id_puesto) as puesto from empleado;         
+-------------+--------------------------------------+
| nombre      | puesto                               |
+-------------+--------------------------------------+
| Enrichetta  | Product Engineer                     |
| Morey       | Budget/Accounting Analyst IV         |
| Jeannette   | Occupational Therapist               |
| Cassey      | Financial Advisor                    |
| Gnni        | Physical Therapy Assistant           |
| Lisle       | Marketing Assistant                  |
| Andre       | Tax Accountant                       |
| Land        | Product Engineer                     |
| Nikki       | Sales Associate                      |
| Aldridge    | Structural Engineer                  |
| Jerald      | GIS Technical Architect              |
| Crissie     | Help Desk Technician                 |
...
```

</div>
