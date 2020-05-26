const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const connection = require('../database');

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

    if(num > 3) {

        const { fecha_nacimiento, nombre, apellido, telefono } = req.body;
    
        const newClient = {
            nombre: nombre,
            apellido: apellido,
            fechaNacimiento: fecha_nacimiento,
            telefono: telefono,
            email: email,
            contraseña: password
        };
    
        const result = await connection.query('INSERT INTO cliente SET ?', [newClient]);
        newClient.idCliente = result.insertId;
        return done(null, newClient);
    
    } else {

        if(data.eleccion === 'Cliente') {

            const rows = await connection.query('SELECT * FROM cliente WHERE email = ?', [email]);
    
            if(rows.length > 0) {
        
                const user = rows[0];
        
                if(user.contraseña === password) {
                    done(null, user, req.flash('success', 'Bienvenido ' + user.nombre + ' ' + user.apellido));
                } else {
                    done(null, false, req.flash('message', 'Contraseña incorrecta'));
                }

            } else {
                return done(null, false, req.flash('message', 'El nombre de usuario no existe'));
            }

        } else {
            const rows = await connection.query('SELECT * FROM empleado WHERE email = ?', [email]);
    
            if(rows.length > 0) {
        
                const user = rows[0];
        
                if(user.cedula === password) {
                    done(null, user, req.flash('success', 'Bienvenido empleado ' + user.nombre));
                } else {
                    done(null, false, req.flash('message', 'Contraseña incorrecta'));
                }
        
            } else {
                return done(null, false, req.flash('message', 'El nombre de empleado no existe'));
            }
        }      
    }

}));

passport.serializeUser((user, done) => {
    if(user.hasOwnProperty('idCliente')) {
        done(null, user.idCliente);
    } else {
        done(null, user.idEmpleado);
    }
});

passport.deserializeUser(async (id, done) => {
    try {
        const rows = await connection.query('SELECT * FROM cliente WHERE idCliente = ?', id);

        if(rows[0].hasOwnProperty('idCliente')) {
            done(null, rows[0]);
        } else {
            const rows2 = await connection.query('SELECT * FROM empleado WHERE idEmpleado = ?', id);
            done(null, rows2[0]);
        }
    } catch (error) {
        const rows3 = await connection.query('SELECT * FROM empleado WHERE idEmpleado = ?', id); 
        done(null, rows3[0]);
    }
});