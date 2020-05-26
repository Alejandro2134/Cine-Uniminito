//Imports
const express = require('express');
const path = require('path')
const exphbs = require('express-handlebars');
const passport = require('passport');
const session = require('express-session');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const helpers = require('./lib/helpers');

const { database } = require('./keys');

//Inicialización
const app = express();
require('./lib/passport');

//Configuración
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    defaultLayout: 'main', 
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: helpers
}));
app.set('view engine', '.hbs');

//Middlewares
app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Middlewares para manejo de sesiones
app.use(session({
    secret: 'nose',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}));

app.use(flash());
app.use(passport.initialize());
app.use(passport.session());

//Variables globales
app.use((req, res, next ) => {
    app.locals.success = req.flash('success');
    app.locals.message = req.flash('message');
    app.locals.user = req.user;
    next();
});

//Configuración de rutas
app.use(require('./routes/sesion'));
app.use('/multiplex', require('./routes/multiplex'));
app.use('/empleado', require('./routes/empleado'));
app.use('/perfil', require('./routes/perfil'));

//Configuración carpeta public
app.use(express.static(path.join(__dirname, 'public')));

//Iniciando el servidor
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});
