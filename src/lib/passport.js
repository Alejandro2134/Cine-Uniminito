const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');

passport.use('local.auth', new LocalStrategy ({

    usernameField: 'email',
    passwordField: 'password',
    passReqToCallback: true

}, async (req, email, password, done) => {

    let num = 0;

    const data = JSON.parse(JSON.stringify(req.body));

    for(let key in data) {
        if(data.hasOwnProperty(key)) {
            num += 1;
        }
    }

    if(num > 2) {

        const { fecha_nacimiento, nombre, apellido, telefono } = req.body;

        const newClient = {
            nombre: nombre,
            apellido: apellido,
            fechaNacimiento: fecha_nacimiento,
            telefono: telefono,
            email: email,
            contraseña: password
        };

        const result = await pool.query('INSERT INTO cliente SET ?', [newClient]);
        newClient.idCliente = result.insertId;
        return done(null, newClient);

    } else {

        const rows = await pool.query('SELECT * FROM cliente WHERE email = ?', [email]);

        if(rows.length > 0) {

            const user = rows[0];

            console.log(user);
            console.log(password);

            if(user.contraseña === password) {
                done(null, user, req.flash('success', 'Bienvenido ' + user.nombre));
            } else {
                done(null, false, req.flash('message', 'Contraseña incorrecta'));
            }

        } else {
            return done(null, false, req.flash('message', 'El nombre de usuario no existe'));
        }

    }

}));

passport.serializeUser((user, done) => {
    done(null, user.idCliente);
});

passport.deserializeUser(async (id, done) => {
    const rows = await pool.query('SELECT * FROM cliente WHERE idCliente = ?', [id]);
    done(null, rows[0]);
});