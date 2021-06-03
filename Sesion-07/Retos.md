## Reto 1: Agrupamientos

<div style="text-align: justify;">

Con base en el ejemplo 1, modifica el agrupamiento para que muestre el costo promedio por habitación por país de las propiedades de tipo casa.

![1.1.1](img/1.1.1.png)

<br/>

## Reto 2: Asociación de colecciones

<div style="text-align: justify;">

Usando las colecciones `comments` y `users`, se requiere conocer el correo y contraseña de cada persona que realizó un comentario.
Construye un pipeline que genere como resultado estos datos.

#### $lookup
```bjson
{
  from: 'users',
  localField: 'email',
  foreignField: 'email',
  as: 'user'
}
```

#### $addFields
```bjson
{
  password: {$arrayElemAt: ["$user.password", 0]}
}
```

#### $project
```bjson
{
  _id: 0,
  email: 1,
  password: 1,
  text: 1
}
```

<br/>

</div>
	
## Reto 3: Generación de vistas

<div style="text-align: justify;">

Usando el *pipeline* que generaste en el Reto 2, genera la vista correspondiente.

![1.1.1](img/1.1.1.png)

</div>
