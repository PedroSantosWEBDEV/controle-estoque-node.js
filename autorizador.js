async function connect(){
    if(global.connection && global.connection.state !== 'disconnected')
        return global.connection;

    var mysql = require("mysql2/promise");
    var connection = await mysql.createConnection("mysql://root:@localhost:3306/estoque");
    // console.log("Conectou no MySQL!");
    global.connection = connection;
    return connection;
}

async function selectCustomers(){
    var conn = await connect();
    var [rows] = await conn.query('SELECT * FROM usuario;');
    return rows;
}
 
module.exports = {selectCustomers}