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

Dentro de la carpeta src, está todo el código del proyecto, dentro de esta hay un archivo muy importante llamado index.js, este tiene las configuraciones del proyecto y en este todo se ejecuta **(entender este archivo no es muy importate entenderlo por ahora).**

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

## Ejemplo











