var express = require('express')
var router = require('./router')
var bodyparser = require('body-parser')

var app = express()


app.use(bodyparser.urlencoded({ extended : true }))


app.use(router)
app.use('/',express.static('./public/'))

app.listen(3000,() => {
    console.log("服务器打开成功!")
})