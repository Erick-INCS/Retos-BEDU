## Reto 1: Agrupamientos y subconsultas

<div style="text-align: justify;">

Usando la base de datos `tienda`, escribe consultas que permitan responder las siguientes preguntas.

- ¿Cuál es el nombre de los empleados que realizaron cada venta?
```sql
tienda> select v.clave as "Venta", e.nombre as "Empleado" from venta as v join empleado as e on v.id_articulo = e.id_empleado;
+------------+-------------+
| Venta      | Empleado    |
+------------+-------------+
| 0228-3661  | Margaret    |
| 52125-277  | Meredithe   |
| 0049-0032  | Olivier     |
| 52125-277  | Terrye      |
| 13107-062  | Marcellina  |
| 0049-0032  | Sylvia      |
...
```
- ¿Cuál es el nombre de los artículos que se han vendido?
```sql
tienda> select v.clave as "Venta", a.nombre as "Articulo" from venta as v join articulo as a on a.id_articulo = v.id_articulo;
+------------+-------------------------------------+
| Venta      | Articulo                            |
+------------+-------------------------------------+
| 0228-3661  | Cake - Cake Sheet Macaroon          |
| 52125-277  | Beans - Long, Chinese               |
| 0049-0032  | Beef - Rib Roast, Capless           |
| 52125-277  | Langers - Ruby Red Grapfruit        |
| 13107-062  | Filter - Coffee                     |
| 0049-0032  | Corn Meal                           |
| 47335-894  | Wine - White, Pelee Island          |
| 52125-277  | Bagelers - Cinn / Brown             |
...
```
- ¿Cuál es el total de cada venta?
```sql
tienda> select clave, round(sum(precio + iva), 2) total from venta as v join articulo as a on v.id_articulo = a.id_articulo group by clave order by
         clave;                                                                                                                                    
+------------+-----------+
| clave      | total     |
+------------+-----------+
| 0002-8149  |  45815.37 |
| 0008-0833  |   1601.41 |
| 0009-0347  |   7506.94 |
| 0019-9888  |   1224.22 |
| 0023-9177  |   4631.5  |
...
```

<br/>

</div>
## Reto 2: Definición de vistas

Usando la base de datos `tienda`, define las siguientes vistas que permitan obtener la siguiente información.

- Obtener el puesto de un empleado.
```sql
tienda> create view puesto_empleado_279 as select e.nombre, p.nombre as puesto from empleado as e join puesto as p on p.id_puesto = e.id_puesto;   
Query OK, 0 rows affected
Time: 0.057s
tienda> select * from puesto_empleado_279 limit 3;                                                                                                 
+------------+------------------------------+
| nombre     | puesto                       |
+------------+------------------------------+
| Enrichetta | Product Engineer             |
| Morey      | Budget/Accounting Analyst IV |
| Jeannette  | Occupational Therapist       |
+------------+------------------------------+
3 rows in set
Time: 0.066s
```
- Saber qué artículos ha vendido cada empleado.
```sql
tienda> create view articulos_emplado_279 as select e.nombre, v.clave as venta, a.nombre as articulo from venta as v join empleado as e on e.id_emp
        leado = v.id_empleado join articulo as a on a.id_articulo = v.id_articulo;                                                                 
Query OK, 0 rows affected
Time: 0.058s
tienda> select * from articulos_emplado_279 limit 3;                                                                                               
+-----------+-----------+----------------------------+
| nombre    | venta     | articulo                   |
+-----------+-----------+----------------------------+
| Arlana    | 0228-3661 | Cake - Cake Sheet Macaroon |
| Julianna  | 52125-277 | Beans - Long, Chinese      |
| Maryellen | 0049-0032 | Beef - Rib Roast, Capless  |
+-----------+-----------+----------------------------+
3 rows in set
Time: 0.066s
```
- Saber qué puesto ha tenido más ventas.
```sql
tienda> create view puesto_mas_ventas_279 as select p.nombre as puesto, count(*) as ventas from venta as v join empleado as e on e.id_empleado = v.
        id_empleado join puesto as p on p.id_puesto = e.id_puesto group by p.id_puesto order by count(*) desc limit 1;                             
Query OK, 0 rows affected
Time: 0.058s
tienda> select * from puesto_mas_ventas_279;                                                                                                       
+---------------------+--------+
| puesto              | ventas |
+---------------------+--------+
| Software Consultant | 8      |
+---------------------+--------+
1 row in set
Time: 0.068s
```

<br/>

</div>
