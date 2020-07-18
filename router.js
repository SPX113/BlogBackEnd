var express = require('express')
var fs = require('fs')
var router = express.Router()
var db =require('./conn')

router.all('*', function(req, res, next) { 
    res.header("Access-Control-Allow-Origin", "http://localhost:8080")
    res.header("Access-Control-Allow-Credentials",true)
    res.header("Access-Control-Allow-Headers", "X-Requested-With")
    res.header("Access-Control-Allow-Methods","POST,GET,PUT,DELETE,OPTIONS,HEAD")
    res.header("X-Powered-By",' 3.2.1') 
    res.header("Content-Type", "application/json;charset=utf-8")
    next()
  })


router.get('/recommedArticle',(req,res) => {
   let sql = "select * from article where recommend = 1"
   db.query(sql,(err,result) => {
       if(err){
           return res.status(500).send('Sever Error')
       }
       res.send(JSON.stringify(result))
   })
})

router.get('/article',(req,res) => {
    let id = req.query.id
    let sql = "select * from article where id = " + id + ";UPDATE article SET watches = watches + 1 WHERE id = " + id
    db.query(sql,(err,result) => {
        if(err){
            return res.status(500).send('Sever Error')
        }
        res.send(JSON.stringify(result[0][0]))
    })
})

router.get('/allarticle',(req,res) => {
    let countsql = "SELECT COUNT(*) totalpage FROM article"
    let num = {}
    let pages
    db.query(countsql,(err,result) => {
        if(err){
            return res.status(500).send('Sever Error')
        }
        num = result
        totalnum =num[0].totalpage
    })

    let pageNo = parseInt(req.query.pageNo)
    let pagesql = (pageNo-1)*10
    let sql = "SELECT * FROM article ORDER BY createtime DESC  limit " + pagesql + ",10"
    db.query(sql,(err,result) => {
        if(err){
            return res.status(500).send('Sever Error')
        }
        res.send(JSON.stringify({ 
            result ,
            pageNo ,
            totalnum
         }))
    })
})


router.get('/uploadcomment',(req,res) => {
    let id =req.query.id
    let name = req.query.name
    let comment = req.query.comment
    let sql = "INSERT INTO comments (articleid, name, comment) VALUES ('" + id + "','" + name + "','" + comment + "');UPDATE article SET comments = comments + 1 WHERE id = " + id
    db.query(sql,(err,result) => {
        if(err){
            return res.status(500).send('Sever Error')
        }
        res.send('success')
    })
})

router.get('/giveStar',(req,res) => {
    let id = req.query.id
    let sql = "UPDATE article SET stars = stars + 1 WHERE id = " + id
    db.query(sql,(err,result) => {
        if(err){
            return res.status(500).send('Sever Error')
        }
        res.send('success')
    }) 
})





module.exports = router