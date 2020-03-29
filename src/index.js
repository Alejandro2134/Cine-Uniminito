//Imports
const express = require('express');
const path = require('path')
const exphbs = require('express-handlebars');

//Inicialización
const app = express();

//Configuración
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    defaultLayout: 'main', 
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
}));
app.set('view engine', '.hbs');

//Middlewares
app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Configuración de rutas
app.use(require('./routes'));

//Configuración carpeta public
app.use(express.static(path.join(__dirname, 'public')));

//Iniciando el servidor
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});
