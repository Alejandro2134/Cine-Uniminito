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










