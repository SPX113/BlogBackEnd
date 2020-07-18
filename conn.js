var mysql = require('mysql')

const db = mysql.createConnection({
    host :"localhost",
    user : "root",
    password: "",
    database: "blog",
    //为true时可以同时执行多条语句
    multipleStatements: true
})
db.connect( err => {
    if (err) throw err;
    console.log('Mysql连接成功!')
})

module.exports = db