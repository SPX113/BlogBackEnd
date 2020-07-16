## 前言

想了一晚上，想不明白怎么在不影响文章自由度的情况下，储存在数据库中，并导出渲染。后来发现了这一种方法，通过解析md语法生成html.







## 本地导入方法

### 安装的依赖

`npm i html-loader markdown-loader --save-dev`







### vue.config.js 配置

```javascript
module.exports = {
    chainWebpack: config => {
        config.module
            .rule('md')
            .test(/\.md$/)
            .use('html-loader')
            .loader('html-loader')
            .end()
            .use('markdown-loader')
            .loader('markdown-loader')
            .end()
    }
}
```









#### 模板使用例子

```javascript
<template>
  <div>
    <div v-html="md">
             
    </div>
  </div>
</template>
 
<script>
import demo from "../../assets/demo.md";
 
console.log(demo)
 
export default {
  data() {
    return {
      md:demo
    };
  }
};
</script>
 
<style lang="less" scoped>
// 这里可以约束解析出来后的 markdown 标签样式，如设置 h3{...}
    //引用样式
    @import "~github-markdown-css/github-markdown.css"
</style>
```



## 字符串转换方法

### 安装插件

`npm install marked -S`



### 使用方法

`marked(mdstr)`



### 例子

```javascript
<template>
  <div>
    <div v-html="article" class="markdown-body"></div>
  </div>
</template>

<script>
  import {getDetail} from 'network/detail.js'
  import marked from 'marked'
  export default {
    name: "Detail",
    data(){
      return{
        article : ''
      }
    },
    created() {
      getDetail().then(res => {
       this.article = marked(res.data)
      })
    }
  }
</script>

<style scoped>
  @import "~github-markdown-css/github-markdown.css";

</style>
```



## github-markdown 样式下载

` npm install github-markdown-css`



# 附加代码高亮

1. `highlight`依赖下载

    `npm install highlight.js --save`

2. 在`main.js`引用与自定义高亮引用

   ```javascript
   import hljs from 'highlight.js' //导入代码高亮文件
   import 'highlight.js/styles/monokai-sublime.css'  //导入代码高亮样式
   
   //自定义一个代码高亮指令
   Vue.directive('highlight',function (el) {
     let highlight = el.querySelectorAll('pre code');
     highlight.forEach((block)=>{
         hljs.highlightBlock(block)
     })
   })
   ```

   

3. 在文件中使用指令

   ```javascript
   <template>
     <div>
       <div v-html="article" class="markdown-body" v-highlight></div>
     </div>
   </template>
   
   <script>
     import {getDetail} from 'network/detail.js'
     import marked from 'marked'
     export default {
       name: "Detail",
       data(){
         return{
           article : ''
         }
       },
       created() {
         getDetail().then(res => {
          this.article = marked(res.data)
         })
       }
     }
   </script>
   
   <style scoped>
     @import "~github-markdown-css/github-markdown.css";
   
   </style>
   ```

   

4. 样式可以自行修改

### 总结

路漫漫其修远兮，吾将上下而求索。