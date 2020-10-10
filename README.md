## 学习项目

在线多人聊天室，每个人登录，即可直接发出消息，自动分配头像，3 秒轮寻信息实现  
**_koa2 框架、MySQL 数据库、node.js 编写_**

### 基础内容

**_名词_**

- json : js 的对象
- put 多用于修改一个东西
- post 多用于发表东西

**_渲染_**

**后端渲染**

- await ctx.render('index', ctx.state) // 通过 views 下的 index.njk 渲染
- 路由只支持 routes 下 index 的

**前端渲染**

- 在 public 文件下的文件可直接访问，它所加载页面里的 js,访问连接，传送 json 数据

### 项目部署

当前页面里 deploy.md 有详细解释

### 运行查看项目

- 项目入口  
  app.js
- 操作

1. git clone 项目
2. cnpm install 下载依赖
3. 修改 connection.js 文件  
   修改数据库连接的用户名和密码为你们本地的用户名和密码

```
let connection = mysql.createConnection({
  host: "localhost",
  user: "xxx",
  password: "xxxx",
  database: "chat",
});
```

4. 导入数据库配置
   注意运行下面这句话时的位置
   mysql -uroot -pxxxx < chat_room.sql
5. node app.js 运行项目
6. 访问 http://localhost:5000/login.html

### 新建项目

1. cnpm install koa2-generator  
   初始化搭建项目应用的框架
2. node_modules/koa2-generator/bin/koa2 firstServer  
   初始化项目,生成模板
3. cnpm install
   下载`package.json`依赖文件中的依赖
4. node app.js  
   运行初始项目
