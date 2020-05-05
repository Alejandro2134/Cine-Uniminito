const passportEmple = require ('passport');
const LocalStrategy = require ('passport-local').Strategy;

const connection = require('../database');

passportEmple.use('local.auth', new LocalStrategy({

    passwordField: 'cedula',
    passReqToCallback: true

}, async (req, cedula, done) =>{
    
    let num = 0;
    const data = JSON.parse(JSON.stringify(req.body));

    for(let key in data){
        if(data.hasOwnProperty(key)){
            num +=1;
        }
    }
    if(num >2){

        const{fecha_inicio,nombre,telefono, salario} = req.body;

        const newEmpleado = {
            nombre: nombre,
            cedula: cedula,
            fechaInicio: fecha_inicio,
            telefono: telefono,
            salario: salario
        };

        const result = await connection.query('INSERT INTO empleado SET ?', [newEmpleado]);
        newEmpleado.idEmpleado = result.insertId;
        return done(null, newEmpleado);

    }else{

        const rows = await connection.query('SELECT * FROM cliente WHERE cedula = ?', [cedula]);

        if(rows.length > 0) {

            const user = rows[0];

            if(user.cedula === cedula) {
                done(null, user, req.flash('success', 'Bienvenido ' + user.nombre));
            } else {
                done(null, false, req.flash('message', 'Cedula incorrecta'));
            }

        } else {
            return done(null, false, req.flash('message', 'El nombre de cliente no existe'));
        }
    }
}));

passportEmple.serializeUser((user,done)=>{
    done(null,user.idEmpleado);
});

passportEmple.deserializeUser(async(id,done)=>{
    const rows = await connection.query('SELECT * FROM empleado WHERE idEmpleado = ?', [id]);
    done(null,rows[0]);
});