var mysql = require('mysql')

const db = mysql.createConnection({
    host :"localhost",
    user : "root",
    password: "",
    database: "blog"
})
db.connect( err => {
    if (err) throw err;
    console.log('Mysql连接成功!')
})

module.exports = db