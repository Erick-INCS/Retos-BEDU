## Sesión 8: *Query Competition*

<img src="../imagenes/pizarron.png" align="right" height="100" width="100" hspace="10">
<div style="text-align: justify;">

### 1. Objetivos :dart: 

- Resolver distintos retos mediante la creación de bases de datos y generación de consultas.

### 2. Contenido :blue_book:

---
#### <ins>Starbucks</ins>
<img src="imagenes/imagen1.jpg" align="right" height="200" width="300">

Starbucks comenzó como una empresa minorista de tostado de grano entero, café molido, té y especias con una sola tienda en el mercado Pike Place de Seattle en 1971. La compañía ahora opera más de 24,000 tiendas minoristas en 70 países.

Para este reto usarás un conjunto de datos que incluye registros sobre cada tienda Starbucks o subsidiaria actualmente en funcionamiento.

- [**`RETO 1`**](Reto-01/Readme.md)

---
#### <ins>Pandemia A (H1N1)</ins>
<img src="imagenes/imagen2.jpg" align="right" height="200" width="300">

El influenzavirus A subtipo H1N1, más conocido como A H1N1 humana, es una especie de influenzavirus tipo A del virus de la gripe. La pandemia de gripe A (H1N1), que se inició en 2009, entró en México el 17 de marzo del mismo año. Este fue el primer país en reportar casos de gripe A en el mundo entero.

Para este reto usarás un conjunto de datos proveniente de un reporte de la OMS.

- [**`RETO 2`**](Reto-02/Readme.md)

---
#### <ins>Pandemia Covid-19</ins>
<img src="imagenes/imagen3.jpg" align="right" height="200" width="300">

COVID-19 (Coronavirus Disease 2019), conocida como neumonía por coronavirus es una enfermedad infecciosa causada por el SARS-Cov-2. Se detectó por primera ve en la ciudad china de Wihan en diciembre de 2019. Habiendo llegado a más de 100 territorios, el 11 de marzo de 2020, la OMS la declaró pandemia.

El conjunto de datos que usarás para este reto proviene de la plataforma  *Coronavirus COVID-19 Global Cases by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University (JHU)*.

- [**`RETO 3`**](Reto-03/Readme.md)

</br>

[`Anterior`](../Sesion-07/Readme.md) | [`Siguiente`](../Readme.md)

</div>   
[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 8`](../Readme.md) > Reto 2

## Reto 2: Pandemia A (H1N1)

### 1. Objetivos :dart:
- Resolver este reto mediante la creación de bases de datos y generación de consultas


### 2. Requisitos :clipboard:
- Servidor __MySQL__ o __MongoDB__ instalado, puedes usar también los servidores que __BEDU__ ha dispuesto para ti en este módulo.
- De preferencia trabaja en equipos de no más de tres personas.

### 3. Desarrollo :rocket:

1. Descarga la fuente de datos sobre la pandemia del 2009 (H1N1):

   <a href="datos/h1n1.csv" target="_blank">`Pandemic (H1N1) 2009.csv`</a>

1. Analiza los datos, limpia los datos en caso de ser necesario.

1. Elige __MySQL__ o __MongoDB__ y crea una base de datos para el conjunto de datos del reto.

1. Carga los datos en la base de datos que elegiste y revisa que éstos se muestren correctamente.

1. Responde a las siguientes preguntas usando consultas:

   - ¿Cuál fue el país con mayor número de muertes?
   - ¿Cuál fue el país con menor número de muertes?
   - ¿Cuál fue el país con el mayor número de casos?
   - ¿Cuál fue el país con el menor número de casos?
   - ¿Cuál fue el número de muertes promedio?
   - ¿Cuál fue el número de casos promedio?
   - Top 5 de países con más muertes.
   - Top 5 de países con menos muertes.

<br/>

[`Anterior`](../Readme.md) | [`Siguiente`](../Readme.md)   
[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 8`](../Readme.md) > Reto 3

## Reto 3: Pandemia Covid-19

### 1. Objetivos :dart:
- Resolver este reto mediante la creación de bases de datos y generación de consultas


### 2. Requisitos :clipboard:
- Servidor __MySQL__ o __MongoDB__ instalado, puedes usar también los servidores que __BEDU__ ha dispuesto para ti en este módulo.
- De preferencia trabaja en equipos de no más de tres personas.

### 3. Desarrollo :rocket:

1. Descarga la fuente de datos de los casos sobre la pandemia del COVID-19:

   <a href="datos/2019-nCoV-cases-JHU.csv" target="_blank">`2019-nCoV-cases-JHU.csv`</a>

1. Analiza los datos, limpia los datos en caso de ser necesario.

1. Elige __MySQL__ o __MongoDB__ y crea una base de datos para el conjunto de datos del reto.

1. Carga los datos en la base de datos que elegiste y revisa que éstos se muestren correctamente.

1. Responde a las siguientes preguntas usando consultas:

   - ¿Cuál es país con mayor número de casos?
   - ¿Cuál es el país con mayor número de muertes?
   - Usando las coordenadas, encuentra el epicentro del virus.
   - Usando el epicentro, encuentra las 5 regiones más cercanas a dicho epicentro.

**Nota:** Ten en cuentra que puede haber países o regiones repetidas.

<br/>

[`Anterior`](../Readme.md) | [`Siguiente`](../Readme.md)   
