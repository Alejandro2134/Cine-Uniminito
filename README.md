# CineUnimonito

# Ejecución del proyecto

Para ejecutarlo se debe tener nodejs instalado: https://nodejs.org/es/

Adicional se debe tener el proyecto clonado, para esto se debe instalar git en el pc: https://git-scm.com/

Comando para clonar el repositorio: Esto clonara el proyecto en la carpena donde se está posicionado en la consola.

```
git clone https://github.com/Alejandro2134/CineUnimonito
```

Una vez clonado el repositorio, se navega hacia este y se debe ejecutar el siguiente comando para que se instalen todas las dependencias del proyecto.

```
npm install
```

Al tener instaladas las dependencias, se puede hacer ejecución del proyecto con el comando siguiente, el cual inicia el proyecto en el puerto 3000.

```
npm run start
```

# Distribución de carpetas

Dentro de la carpeta src, está todo el código del proyecto, dentro de esta hay un archivo muy importante llamado index.js, este tiene las configuraciones del proyecto y en este todo se ejecuta **(entender este archivo no es muy importante entenderlo por ahora).**

Dentro de src hay un archivo llamado **keys.js** en este se configura un objeto que almacena la configuración para conectarse a la base de datos (en este punto no nos hemos conectado) con propiedades como el nombre de la base de datos, la contraseña configurada para acceder al servicio de mysql, el usuario configurado para ingresar al servicio de mysql, etc.

**Adicional dentro de src hay dos carpetas: routes y views (estas son super importantes, son con las que mas vamos a trabajar).**

# Entendiendo views

Dentro de views se van a almacenar todas mis páginas HTML relacionadas a una ruta, pero en este caso se manejaran con una extensión llamada .hbs, esta extensión permite manejar código de JavaScript dentro de mi HTML.

Dentro de views se encuentran dos carpetas, layouts y partials.

Layouts almacenara un archivo llamado main.hbs, el cual va a ser un contenedor de todas mis vistas, esta las llamara a todas, y en está se declaran por ejemplo estilos globales que quiero que todas mis páginas tengan, este archivo por lo general es muy corto, ya que para llamar a las demas páginas hace uso de llaves triples y dentro de ellas va la palabra body, entonces dependiendo de la página que este viendo el usuario ese body tomara el contenido de dicha página.

## Ejemplo:

Tengo una página llamada home.hbs que tiene el siguiente contenido:

```
<h1>Holaaa mi correo es: {{ email }}</h1>
<h1>Mi contraseña es: {{ password }} </h1>

<form action="/" method="POST"> 
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
```

Tengo mi página main.hbs:

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
    {{{ body }}}

    <!-- Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
```

Cuando el usuario haga uso de la ruta que tiene el contenido de la página home.hbs, si analiza la páginas por medio de las herramientas del navegador podra ver que el HTML es de esta forma: 

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
    <h1>Holaaa mi correo es: {{ email }}</h1>
    <h1>Mi contraseña es: {{ password }} </h1>

    <form action="/" method="POST"> 
      <div class="form-group">
        <label for="exampleInputEmail1">Email address</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" name="password">
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <!-- Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
```

Ahora bien la carpeta layouts lo que hara será almacenar código HTML que se repite dentro de mis páginas, generalmente contienen los headers o el footer que no cambia.

**Importante:** Como bien ya se dijo los archivos .hbs me permiten hacer uso de código JavaScript, para esto se usan las llaves dobles: 

```
<h1>Holaaa mi correo es: {{ email }}</h1>
```
En este caso estamos mostrando una variable llamada email, si su valor es nulo el navagador no lo va a mostrar, ¿entonces como se le da un valor a esa varable? eso lo explicare mas adelante.

# Entendiendo routes

Dentro de routes se van a almacenar uno o varios archivos (tener varios archivos no es necesario, pero es una buena práctica, ya que en proyectos con muchas rutas el código en un solo archivo va a ser muy largo, por lo que se suele separar en funcionalidades ej: un archivo que contenga las rutas de todo lo que tenga que ver con sesión de usuario, otro que tenga que ver con servicios snacks, etc) los cuales van a contener el código de las direntes rutas (entiendase rutas como las direcciones de internet que representan una página), con el cual puedo manipularlas, pasarles información o recibir información de ellas.

Dentro de mi archivo de configuración de rutas debo importar un framework web llamado express, el cual va a permitir crear todo lo relacionado a web de la aplicación, y de express debo importar su método router, el cual me permite manipular y crear las rutas de mi aplicación.

```
const express = require('express');
const router = express.Router(); 
```

## ¿Como crear una ruta?

### Ejemplo 1

```
router.get('/', (req, res) => { 
    res.render('home');
})
```
En este caso le estamos diciento a router que utilice el método get (método asociado a obtener el html de una página para mostrarla cuando voy a una ruta de internet) para renderizar o mostrar el contenido almacenado en el archivo html que tiene como nombre home en la ruta '/', La sintaxis de este codigo se basa en tres partes, el uso de la función get, que recibe 2 parametros: la ruta con la que quiero hacer algo en especifico, una función (en JavaScript se pueden hacer uso de las funciones como parametros) que recibe dos parametros req y res (**req** es una abreviatura de request, este parametro se usa para cuando quiero obtener datos de la página, por ejemplo si tengo un formulario en mi página yo puedo obtener los datos que ingresa el usuario por medio de req, mas adelante muestro un ejemplo de su uso y por otro lado **res** es una abreviatura de response, este paramatro se usa como respuesta, por ejemplo si el usuario entra a la ruta '/' con res le puedo decir que página html mostrarle) y el contenido de la función pasada como parametro, que va a indicar que hacer con esa ruta pasada como primer argumento.

### Ejemplo 2

```
router.post('/', (req, res) => {
    const { password, email } = req.body;
    res.render('home', { password, email });
})
```
En este caso le estamos diciendo a router que utilice el método post (método asociado a eviar datos desde un formulario), al método post le pasamos la ruta '/' como parametro (en muchos casos vamos a tener tanto método get y post asociados a una ruta, ya que la vamos a mostrar pero también queremos obtener datos de ella, entonces cuando entremos a la ruta '/' se va a usar get y cuando llenemos el formulario dentro de ella y o enviemos se va a usar post) y la función con los prametros req y res, dentro de esta función se reciben los datos y se guardan en constantes por medio de req.body (como dije antes req se usa para obtener datos, la propiedad body va a contener todos los datos que el usuario envie por medio de post), luego estos datos se renderizan en conjunto con la página, home, el hacer esto significa que ahora los puedo utilizar dentro de mi html.

