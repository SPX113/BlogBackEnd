# 序言

在使用 Vue 的 $refs 发现有些地方获取不到组件的DOM信息



# Vue.js中this.$nextTick()的使用

this.$nextTick()将回调延迟到下次 DOM 更新循环之后执行。在修改数据之后立即使用它，然后等待 DOM 更新。它跟全局方法 Vue.nextTick 一样，不同的是回调的 this 自动绑定到调用它的实例上。

------

 假设我们更改了某个dom元素内部的文本，而这时候我们想直接打印出这个被改变后的文本是需要dom更新之后才会实现的，也就好比我们将打印输出的代码放在setTimeout(fn, 0)中



### 先来第一个例子看一看

```javascript
<template>
  <section>
    <div ref="hello">
      <h1>Hello World ~</h1>
    </div>
    <el-button type="danger" @click="get">点击</el-button>
  </section>
</template>
<script>
  export default {
    methods: {
      get() {
      }
    },
    mounted() {
      console.log(333);
      console.log(this.$refs['hello']);
      this.$nextTick(() => {
        console.log(444);
        console.log(this.$refs['hello']);
      });
    },
    created() {
      console.log(111);
      console.log(this.$refs['hello']);
      this.$nextTick(() => {
        console.log(222);
        console.log(this.$refs['hello']);
      });
    }
  }
</script>
```

![1312098-20181119202620185-438749915](http://localhost:3000/mdsrc/1312098-20181119202620185-438749915.png)

可以根据打印的顺序看到，在created()钩子函数执行的时候DOM 其实并未进行任何渲染，而此时进行DOM操作并无作用，而在created()里使用this.$nextTick()可以等待dom生成以后再来获取dom对象

### 然后来看第二个例子

```javascript
<template>
  <section>
    <h1 ref="hello">{{ value }}</h1>
    <el-button type="danger" @click="get">点击</el-button>
  </section>
</template>
<script>
  export default {
    data() {
      return {
        value: 'Hello World ~'
      };
    },
    methods: {
      get() {
        this.value = '你好啊';
        console.log(this.$refs['hello'].innerText);
        this.$nextTick(() => {
          console.log(this.$refs['hello'].innerText);
        });
      }
    },
    mounted() {
    },
    created() {
    }
  }
</script>
```

![1312098-20181119203408968-402357693](http://localhost:3000/mdsrc/1312098-20181119203408968-402357693.png)

根据上面的例子可以看出，在方法里直接打印的话， 由于dom元素还没有更新， 因此打印出来的还是未改变之前的值，而通过this.$nextTick()获取到的值为dom更新之后的值



#### this.$nextTick()在页面交互，尤其是从后台获取数据后重新生成dom对象之后的操作有很大的优势，这里只是简单的例子，实际应用中更为好用~

