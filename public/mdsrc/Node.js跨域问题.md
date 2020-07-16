

## 序言

一天、本小白在搭建 `node` 本地服务器时，忽然发现这个问题？？？？？？？跨域？？？？？？什么东西？？？？

![image-20200714213659788](http://localhost:3000/mdsrc/image-20200714213659788.png)

## 什么是跨域?

出于浏览器的同源策略限制。同源策略（Sameoriginpolicy）是一种约定，它是浏览器最核心也最基本的安全功能，如果缺少了同源策略，则浏览器的正常功能可能都会受到影响。可以说Web是构建在同源策略基础之上的，浏览器只是针对同源策略的一种实现。同源策略会阻止一个域的javascript脚本和另外一个域的内容进行交互。所谓同源（即指在同一个域）就是两个页面具有相同的协议（protocol），主机（host）和端口号（port）

只要协议、域名、端口号有一个不一样就会被认为跨域

| 当前页面url               | 被请求页面url                   | 是否跨域 | 原因                           |
| :------------------------ | ------------------------------- | :------- | :----------------------------- |
| http://www.test.com/      | http://www.test.com/index.html  | 否       | 同源（协议、域名、端口号相同） |
| http://www.test.com/      | https://www.test.com/index.html | 跨域     | 协议不同（http/https）         |
| http://www.test.com/      | http://www.baidu.com/           | 跨域     | 主域名不同（test/baidu）       |
| http://www.test.com/      | http://blog.test.com/           | 跨域     | 子域名不同（www/blog）         |
| http://www.test.com:8080/ | http://www.test.com:7001/       | 跨域     | 端口号不同（8080/7001）        |



## 非同源限制

1. 无法读取非同源网页的 Cookie、LocalStorage 和 IndexedDB
2. 无法接触非同源网页的 DOM
3. 无法向非同源地址发送 AJAX 请求



## 解决方法

设置响应头

```javascript
app.all('*', function(req, res, next) { 
    res.header("Access-Control-Allow-Origin", "http://localhost:8080") //设置为*时，认为接受所有跨域
    res.header("Access-Control-Allow-Credentials",true)				   //是否携带cookies *时无法携带
    res.header("Access-Control-Allow-Headers", "X-Requested-With")
    res.header("Access-Control-Allow-Methods","POST,GET,PUT,DELETE,OPTIONS,HEAD") //允许的方式
    res.header("X-Powered-By",' 3.2.1') 
    res.header("Content-Type", "application/json;charset=utf-8")
    next()
  })
```



