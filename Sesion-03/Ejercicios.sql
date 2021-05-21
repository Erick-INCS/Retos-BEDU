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