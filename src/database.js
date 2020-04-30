const mysql = require('mysql'); 
const { promisify } = require('util');
const { database } = require('./keys');
 
const connection = mysql.createConnection(database);

connection.connect((err) => {
    err 
        ? console.log('error ' + err.stack)
        : console.log('db connected');
})

connection.query = promisify(connection.query);

module.exports = connection;