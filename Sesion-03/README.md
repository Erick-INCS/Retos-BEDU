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

# Ejercicios de la sesion 04
```sql
-- *Para estas consultas usa INNER JOIN*
-- 1. Obtén la cantidad de productos de cada orden.
select
       o.orderNumber as 'order',
       sum(od.quantityOrdered) as productos
from orders as o
inner join orderdetails od on o.orderNumber = od.orderNumber
group by o.orderNumber;

-- 2. Obtén el número de orden, estado y costo total de cada orden.
select
       o.orderNumber as 'order',
       o.status,
       sum(od.quantityOrdered * od.priceEach) as total
from orders as o
inner join orderdetails od on o.orderNumber = od.orderNumber
group by o.orderNumber;

-- 3.  Obtén el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza.
select
       o.orderNumber as 'order',
       o.orderDate,
       od.orderLineNumber,
       p.productName,
       od.quantityOrdered,
       od.priceEach
from orders as o
inner join orderdetails od on o.orderNumber = od.orderNumber
inner join products p on od.productCode = p.productCode;

-- 4. Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
select
       o.orderNumber,
       p.productName,
       p.MSRP,
       p.buyPrice
from orders as o
inner join orderdetails od on o.orderNumber = od.orderNumber
inner join products p on od.productCode = p.productCode;

-- *Para estas consultas usa LEFT JOIN*
-- 5. Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden hecha por cada cliente. ¿De qué nos sirve hacer `LEFT JOIN` en lugar de `JOIN`?
select
    c.customerNumber,
    c.contactFirstName,
    o.orderNumber,
    o.status
from customers as c
left join orders o on c.customerNumber = o.customerNumber;
    -- Sirve para mostrar tambien la los clientes que no tiene ordenes.

-- 6. Obtén los clientes que no tienen una orden asociada.
select
    c.contactFirstName
from customers as c
left join orders o on c.customerNumber = o.customerNumber
where o.orderNumber is null;

-- 7. Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
select
       e.lastName,
       e.firstName,
       c.contactFirstName,
       p.checkNumber,
       p.amount
from employees as e
left join customers c on e.employeeNumber = c.salesRepEmployeeNumber
left join payments p on c.customerNumber = p.customerNumber;

-- *Para estas consultas usa RIGHT JOIN*
-- 8. Repite los ejercicios 5 a 7 usando *RIGHT JOIN*. ¿Representan lo mismo? Explica las diferencias en un comentario. Para poner comentarios usa `--`.
    select
        c.customerNumber,
        c.contactFirstName,
        o.orderNumber,
        o.status
    from customers as c
    right join orders o on c.customerNumber = o.customerNumber;
        -- No es lo mismo porque aqui se priorizan las ordenes.

    -- 8.6. Obtén los clientes que no tienen una orden asociada.
    select
        c.contactFirstName
    from customers as c
    right join orders o on c.customerNumber = o.customerNumber
    where o.orderNumber is null;
    -- En este caso no es lo mismo, por que al cambiar el left join por right join nos estamos asegurando que la condicion del where sea falsa en todos los casos y obligando la consulta a retornar una tabla sin registros.

    -- 8.7. Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
    select
           e.lastName,
           e.firstName,
           c.contactFirstName,
           p.checkNumber,
           p.amount
    from employees as e
    right join customers c on e.employeeNumber = c.salesRepEmployeeNumber
    right join payments p on c.customerNumber = p.customerNumber;
    -- En este caso estamos mostrando solo los casos en donde la union de estas tres tablas sea exitosa.

-- 9. Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.
-- 9.1
create view Clientes_Sin_Orden_279 AS
    select
    c.contactFirstName
from customers as c
left join orders o on c.customerNumber = o.customerNumber
where o.orderNumber is null;

select *
from Clientes_Sin_Orden_279 limit 10;

-- 9.2
CREATE VIEW Ordenes_Custom_Format_279 AS
select
       o.orderNumber as 'order',
       o.status,
       sum(od.quantityOrdered * od.priceEach) as total
from orders as o
inner join orderdetails od on o.orderNumber = od.orderNumber
group by o.orderNumber;

select *
from Ordenes_Custom_Format_279 limit 10;

-- 9.3
create view Products_Custom_Format_279 AS
select
       o.orderNumber as 'order',
       o.orderDate,
       od.orderLineNumber,
       p.productName,
       od.quantityOrdered,
       od.priceEach
from orders as o
inner join orderdetails od on o.orderNumber = od.orderNumber
inner join products p on od.productCode = p.productCode;

select *
from Products_Custom_Format_279 limit 3;
```
