-- 1. Dentro de la tabla `employees`, obtén el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con `A`.
select employeeNumber, lastName, firstName
from employees
where firstName like 'A%';

-- 2. Dentro de la tabla `employees`, obtén el número de empleado, apellido y nombre de todos los empleados cuyo apellido termina con `on`.
select employeeNumber, lastName, firstName
from employees
where employees.lastName like '%on';

-- 3. Dentro de la tabla `employees`, obtén el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena `on`.
select employeeNumber, lastName, firstName
from employees
where firstName like '%on%';

-- 4. Dentro de la tabla `employees`, obtén el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen seis letras e inician con `G`.
select employeeNumber, lastName, firstName
from employees
where firstName like 'G_____';

-- 5. Dentro de la tabla `employees`, obtén el número de empleado, apellido y nombre de todos los empleados cuyo nombre *no* inicia con `B`.
select employeeNumber, lastName, firstName
from employees
where firstName not like 'B%';

-- 6. Dentro de la tabla `products`, obtén el código de producto y nombre de los productos cuyo código incluye la cadena `_20`.
select productCode, productName
from products
where productCode like '%\_20%';

-- 7. Dentro de la tabla `orderdetails`, obtén el total de cada orden.
select orderNumber as orden, sum(quantityOrdered * priceEach) as total
from orderdetails
group by orderNumber;

-- 8. Dentro de la tabla `orders` obtén el número de órdenes por año.
select year(orderDate), count(*)
from orders group by year(orderDate);

-- 9. Obtén el apellido y nombre de los empleados cuya oficina está ubicada en `USA`.
select lastName, firstName
from employees where officeCode in
(select officeCode from offices where country = 'USA');

-- 10. Obtén el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
select
       (select contactFirstName from customers c where c.customerNumber = p.customerNumber) as customer,
       amount, checkNumber
from payments p order by amount desc limit 1;

-- 11. Obtén el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
select
       customerNumber,
       checkNumber,
       amount
from
    (
        select customerNumber, checkNumber, sum(amount) as amount
        from payments group by customerNumber, checkNumber
    ) as tb where tb.amount > (select avg(amount) from payments);

-- 12. Obtén el nombre de aquellos clientes que no han hecho ninguna orden.
select contactFirstName
from customers where customerNumber not in
(select distinct (orders.customerNumber) from orders);

-- 13. Obtén el máximo, mínimo y promedio del número de productos en las órdenes de venta.
select
       orderNumber OrdenDeVenta,
       max(quantityOrdered) Maximo,
       min(quantityOrdered) Minimo,
       avg(quantityOrdered) Promedio
from orderdetails group by orderNumber;

-- 14. Dentro de la tabla `orders`, Obtén el número de órdenes que hay por cada estado.
select
       status as Estado,
       count(*) as 'N. Ordenes'
from orders
group by status;