
# Table of Contents

1.  [在服务器上部署Node.js项目](#org261c2ce)
    1.  [项目效果](#orgf629393)
    2.  [前置条件-创建Node.js app](#org007e960)
        1.  [示例项目介绍](#org2a39b21)
    3.  [获取云服务器](#org30cbb50)
        1.  [购买云服务器](#org13fecf5)
        2.  [登录云服务器](#org1d58219)
    4.  [安装node.js](#org7532d65)
    5.  [安装MySQL](#org3d8c18d)
    6.  [安装git(root模式)](#org2dd11b5)
    7.  [下载项目](#org915483b)
    8.  [npm install](#org9f596f9)
    9.  [导入数据库配置](#org865b779)
    10. [修改项目的数据库配置](#orga59146b)
    11. [启动服务和验证](#org1c1e7a2)


<a id="org261c2ce"></a>

# 在服务器上部署Node.js项目

如果我们的Node.js项目需要运行在公网上供其他人访问, 那么需要将项目部署在云服务器上.

本文介绍如何在云服务器上部署已经创建好的Node.js项目并提供服务.

<a id="orgf629393"></a>

<video width="100%" src="http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/video/%E6%9C%8D%E5%8A%A1%E5%99%A8%E9%A1%B9%E7%9B%AE%E8%AF%B4%E6%98%8E.mp4" controls="controls"></video>

## 项目效果

首先看一下服务器上项目部署的效果:

-   服务器上运行项目
    
        node app.js
        
        root@iZbp1hwnz2exdr8busn3zxZ:~/node-deploy# node app.js
        Server running on port: 80
        Connected to database

-   检查项目是否正常运行
    1.  本地浏览器打开远端服务器提供的服务:
        
        `http://云服务器公网IP地址`
        
        ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/verify-1.png)
    2.  可以进行添加球员的操作:
        
        ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/verify-2.png)
    3.  查看添加后的结果:
        
        ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/verify-3.png)


<a id="org007e960"></a>

## 前置条件-创建Node.js app

部署前应确认Node.js项目在本地可正常运行, 这里采用一个较为简单的球队管理项目作为示例, 可以通过Web页面对球队球员进行增删查改的操作.

<a id="org2a39b21"></a>

### 示例项目介绍

1.  项目地址

    <https://git.banyuan.club/projects/OP/repos/node-deploy/browse>

2.  项目结构

        ├── node-mqsql-crud-app (main directory)   
            ├── node_modules
            ├── public
        	├── assets 
        	    ├── img
            ├── routes
        	├── index.js
        	├── player.js
            ├── views
        	├── partials 
        	    ├── header.ejs
        	├── index.ejs
        	├── add-player.ejs
        	├── edit-player.ejs
            ├── app.js 
            ├── create_db.sql
            ├── package.json
            ├── README.md
    
    其中根目录下的 `app.js` 文件是启动文件, `create_db.sql` 文件是数据库的初始化配置文件.

<a id="org30cbb50"></a>

## 部署演示

<video width="100%" src="http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/video/%E9%83%A8%E7%BD%B2%E6%AD%A5%E9%AA%A4%E8%AF%B4%E6%98%8E.mp4" controls="controls"></video>

## 获取云服务器

云服务器就是远端的一台服务器, 可以提供公网服务, 通常是Linux操作系统.

国内各大运服务提供商都有提供云服务器的业务，例如阿里，百度，腾讯，七牛等，可根据自己情况选择一家合适的服务提供商。

本文后续云服务提供部分选择阿里云作为示例，其余提供商的流程也都类似。



### 购买云服务器

阿里云购买ECS服务器即可，流程为：

-   “阿里云控制台" -> "云服务器ECS” -> "创建实例“
    
    ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/aliyun-1.png)
    
    ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/aliyun-2.png)

-   基础配置
    
    -   付费模式分为包年包月, 按量付费, 抢占式实例, 官网有详细计费说明, 普通用户需要长期服务器在线一般选择包年包月方式
    
    -   选择所需的CPU和内存，规格不同价格不同
    
    -   镜像选择Debian的10.4 64版本
    
    ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/aliyun-3.png)
    
    ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/aliyun-4.jpg)

-   网络和安全组
    
    确保打开了22端口（用于ssh登录）以及80端口（提供http服务）
    
    ssh是本地链接远端使用的协议, 各操作系统都提供了ssh的客户端程序. MacOS下的终端自带ssh命令, Windows可以下载[putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)软件来作为其客户端.
    
    ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/aliyun-5.jpg)

-   系统配置
    
    本文登录凭证使用密码方式登录，也可使用秘钥对来登录云服务器.
    
    登录凭证是指你如何登录该服务器, 密码就是输入用户名和密码来登录.
    
    ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/aliyun-6.jpg)

-   确认订单
    
    完成缴费后即开通了云服务器服务，可以在”云服务器ECS" -> "示例列表" 中看到新购买的云服务器：
    
    ![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/aliyun-7.jpg)
    
    记录此处的公网IP地址，用于下一步的SSH登录


<a id="org1d58219"></a>

### 登录云服务器

在本地计算机上打开终端软件(Windows用户请使用ssh客户端,如putty), 使用ssh命令进行登录：

    ssh root@你刚才购买云服务器的公网地址

`ssh` 是ssh协议的客户端命令, `root@` 是指以 `root` 这个用户名来登录.

![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/aliyun-8.jpg)

输入在上一步中设置的root密码，登录成功后出现如下信息：

![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/aliyun-9.jpg)


<a id="org7532d65"></a>

## 安装node.js

安装指导: `https://github.com/nodesource/distributions/blob/master/README.md#debinstall`

1.  更新apt(root模式)
    
    `apt` 是 `Debian/Ubuntu` 下的软件管理软件, 详细的说明可以参考[这个链接](https://www.cnblogs.com/sparkdev/p/11357343.html).
    
    `root` 是 `Linux` 系统下的管理员帐号, 拥有最高权限, 详细的说明可以参考[这个链接](https://www.jianshu.com/p/56c422279168).
    
apt update

`apt update` 命令是指更新 `apt` 的 `source` 列表. 如果不更新, 我们则无法获得完整的软件仓库信息.
    
![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/install-0.png)

2.  配置依赖
    
    `curl` 是 `Linux` 下的一条命令, 其目的是获得远端的一个文件
    `|` 是管道操作符, 其作用是将左边的输出作为后边的输入
    `bash -` 是使用 `bash` 命令来执行脚本
    
        curl -sL https://deb.nodesource.com/setup_lts.x | bash -
    
![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/install-1.png)

3.  安装v12.x版本(root模式)
    
apt-get install -y nodejs

    这条命令的作用是使用 `apt-get` 安装 `node.js` 软件包, 中间的 `-y` 表示无需用户输入确认信息, 直接安装.
![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/install-2.png)

4.  检查安装结果
    
![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/install-3.png)




## 安装MySQL

-   `配置apt repository`
    

wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb

apt install ./mysql-apt-config_0.8.13-1_all.deb

`wget` 是 `Linux` 下的一条命令, 用来获取远端的一个文件
`apt install ./mysql-apt-config_0.8.13-1_all.deb` 是指使用 `apt` 加载这个 `deb` 文件来进行mysql的配置.

在出来的菜单中选择第一项确认选择是 `5.7` 版本:

![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/mysql-0.png)
    
如果不是5.7版本, 可以选择第一项调整为5.7版本:
    
![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/mysql-2.png)     
    
确定如下图所示后选择 `ok`
    
![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/mysql-1.png)

-   `apt install mysql`
    
    安装mysql-5.7版本, 我们选择5.7版本的原因是因为5.7版本和Node.js的 `mysql` package兼容性较好.
    
        apt update
        apt install mysql-server
    
    过程中会设置root的密码, 需要记住该密码
    
    命令运行结果如下所示

        root@iZbp1hwnz2exdr8busn3zxZ:~# apt update
        Hit:1 http://mirrors.cloud.aliyuncs.com/debian buster InRelease
        Hit:2 http://mirrors.cloud.aliyuncs.com/debian buster-updates InRelease
        Hit:3 http://mirrors.cloud.aliyuncs.com/debian buster-proposed-updates InRelease
        Hit:4 http://mirrors.cloud.aliyuncs.com/debian buster-backports InRelease
        Hit:5 http://mirrors.cloud.aliyuncs.com/debian-security buster/updates InRelease
        Hit:6 http://repo.mysql.com/apt/debian buster InRelease
        Hit:7 https://deb.nodesource.com/node_12.x buster InRelease
        Reading package lists... Done
        Building dependency tree
        Reading state information... Done
        19 packages can be upgraded. Run 'apt list --upgradable' to see them.
        root@iZbp1hwnz2exdr8busn3zxZ:~# apt install mysql-server
        Reading package lists... Done
        Building dependency tree
        Reading state information... Done
        The following additional packages will be installed:
          libmecab2 mysql-client mysql-common mysql-community-client
          mysql-community-server
        The following NEW packages will be installed:
          libmecab2 mysql-client mysql-common mysql-community-client
          mysql-community-server mysql-server
        0 upgraded, 6 newly installed, 0 to remove and 19 not upgraded.
        Need to get 50.9 MB of archives.
        After this operation, 311 MB of additional disk space will be used.
        Do you want to continue? [Y/n] Y
        Get:1 http://mirrors.cloud.aliyuncs.com/debian buster/main amd64 mysql-common all 5.8+1.0.5 [7324 B]
        Get:2 http://mirrors.cloud.aliyuncs.com/debian buster/main amd64 libmecab2 amd64 0.996-6 [258 kB]
        Get:3 http://repo.mysql.com/apt/debian buster/mysql-5.7 amd64 mysql-community-client amd64 5.7.31-1debian10 [14.4 MB]
        Get:4 http://repo.mysql.com/apt/debian buster/mysql-5.7 amd64 mysql-client amd64 5.7.31-1debian10 [72.5 kB]
        Get:5 http://repo.mysql.com/apt/debian buster/mysql-5.7 amd64 mysql-community-server amd64 5.7.31-1debian10 [36.2 MB]
        Get:6 http://repo.mysql.com/apt/debian buster/mysql-5.7 amd64 mysql-server amd64 5.7.31-1debian10 [72.5 kB]
        Fetched 50.9 MB in 5s (9559 kB/s)
        perl: warning: Setting locale failed.
        perl: warning: Please check that your locale settings:
        	LANGUAGE = (unset),
        	LC_ALL = (unset),
        	LC_TIME = "en_US.UTF-8",
        	LC_MONETARY = "en_US.UTF-8",
        	LC_CTYPE = "zh_CN.UTF-8",
        	LC_ADDRESS = "en_US.UTF-8",
        	LC_TELEPHONE = "en_US.UTF-8",
        	LC_NAME = "en_US.UTF-8",
        	LC_MEASUREMENT = "en_US.UTF-8",
        	LC_IDENTIFICATION = "en_US.UTF-8",
        	LC_NUMERIC = "en_US.UTF-8",
        	LC_PAPER = "en_US.UTF-8",
        	LANG = "en_US.UTF-8"
            are supported and installed on your system.
        perl: warning: Falling back to a fallback locale ("en_US.UTF-8").
        locale: Cannot set LC_CTYPE to default locale: No such file or directory
        locale: Cannot set LC_ALL to default locale: No such file or directory
        Preconfiguring packages ...
        /usr/bin/locale: Cannot set LC_CTYPE to default locale: No such file or directory
        /usr/bin/locale: Cannot set LC_ALL to default locale: No such file or directory
        Selecting previously unselected package mysql-common.
        (Reading database ... 44679 files and directories currently installed.)
        Preparing to unpack .../0-mysql-common_5.8+1.0.5_all.deb ...
        Unpacking mysql-common (5.8+1.0.5) ...
        Selecting previously unselected package mysql-community-client.
        Preparing to unpack .../1-mysql-community-client_5.7.31-1debian10_amd64.deb ...
        Unpacking mysql-community-client (5.7.31-1debian10) ...
        Selecting previously unselected package mysql-client.
        Preparing to unpack .../2-mysql-client_5.7.31-1debian10_amd64.deb ...
        Unpacking mysql-client (5.7.31-1debian10) ...
        Selecting previously unselected package libmecab2:amd64.
        Preparing to unpack .../3-libmecab2_0.996-6_amd64.deb ...
        Unpacking libmecab2:amd64 (0.996-6) ...
        Selecting previously unselected package mysql-community-server.
        Preparing to unpack .../4-mysql-community-server_5.7.31-1debian10_amd64.deb ...
        Unpacking mysql-community-server (5.7.31-1debian10) ...
        Selecting previously unselected package mysql-server.
        Preparing to unpack .../5-mysql-server_5.7.31-1debian10_amd64.deb ...
        Unpacking mysql-server (5.7.31-1debian10) ...
        Setting up libmecab2:amd64 (0.996-6) ...
        Setting up mysql-common (5.8+1.0.5) ...
        update-alternatives: using /etc/mysql/my.cnf.fallback to provide /etc/mysql/my.cnf (my.cnf) in auto mode
        Setting up mysql-community-client (5.7.31-1debian10) ...
        Setting up mysql-client (5.7.31-1debian10) ...
        Setting up mysql-community-server (5.7.31-1debian10) ...
        locale: Cannot set LC_CTYPE to default locale: No such file or directory
        locale: Cannot set LC_ALL to default locale: No such file or directory
        update-alternatives: using /etc/mysql/mysql.cnf to provide /etc/mysql/my.cnf (my.cnf) in auto mode
        Created symlink /etc/systemd/system/multi-user.target.wants/mysql.service → /lib/systemd/system/mysql.service.
        Setting up mysql-server (5.7.31-1debian10) ...
        Processing triggers for systemd (241-7~deb10u4) ...
        Processing triggers for man-db (2.8.5-2) ...
        Processing triggers for libc-bin (2.28-10) ...



## 安装git(root模式)

`git` 是现在通用的软件版本管理工具.

    apt install -y git

![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/git-1.png)


<a id="org915483b"></a>

## 下载项目

    git clone https://git.banyuan.club/scm/op/node-deploy.git

示例:

    root@iZbp1hwnz2exdr8busn3zxZ:~# git clone https://git.banyuan.club/scm/op/node-deploy.git
    Cloning into 'node-deploy'...
    Username for 'https://git.banyuan.club': ^C
    root@iZbp1hwnz2exdr8busn3zxZ:~# git clone https://git.banyuan.club/scm/op/node-deploy.git
    Cloning into 'node-deploy'...
    remote: Counting objects: 35, done.
    remote: Compressing objects: 100% (28/28), done.
    remote: Total 35 (delta 5), reused 0 (delta 0)
    Unpacking objects: 100% (35/35), done.


<a id="org9f596f9"></a>

## npm install

进入项目根目录后运行 `npm install`


    root@iZbp1hwnz2exdr8busn3zxZ:~# ls
    node-deploy
    root@iZbp1hwnz2exdr8busn3zxZ:~# cd node-deploy/
    root@iZbp1hwnz2exdr8busn3zxZ:~/node-deploy# npm install
    
    > ejs@2.7.4 postinstall /root/node-deploy/node_modules/ejs
    > node ./postinstall.js
    
    Thank you for installing EJS: built with the Jake JavaScript build tool (https://jakejs.com/)
    
    npm notice created a lockfile as package-lock.json. You should commit this file.
    npm WARN node-mqsql-crud-app@1.0.0 No repository field.
    
    added 77 packages from 58 contributors and audited 77 packages in 53.601s
    found 1 low severity vulnerability
      run `npm audit fix` to fix them, or `npm audit` for details


<a id="org865b779"></a>

## 导入数据库配置

-   导入:
    
    `mysql -uroot -p123 < create_db.sql`
    
    注意: `create_db.sql` 文件在项目根目录下, `-p123` 里面的 `123` 应替换为你之前设置的 MySQL `root` 密码.
    
        root@iZbp1hwnz2exdr8busn3zxZ:~/node-deploy# mysql -uroot -p123 < create_db.sql
        mysql: [Warning] Using a password on the command line interface can be insecure.

-   检查导入结果:
    
    上面的命令正常运行, 会在MySQL服务器中生成 `socka` 数据库及 `player` 表.
    
        root@iZbp1hwnz2exdr8busn3zxZ:~# mysql -uroot -p123
        mysql: [Warning] Using a password on the command line interface can be insecure.
        Welcome to the MySQL monitor.  Commands end with ; or \g.
        Your MySQL connection id is 7
        Server version: 5.7.31 MySQL Community Server (GPL)
        
        Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.
        
        Oracle is a registered trademark of Oracle Corporation and/or its
        affiliates. Other names may be trademarks of their respective
        owners.
        
        Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
        
        mysql> use socka
        Reading table information for completion of table and column names
        You can turn off this feature to get a quicker startup with -A
        
        Database changed
        mysql> show tables;
        +-----------------+
        | Tables_in_socka |
        +-----------------+
        | players         |
        +-----------------+
        1 row in set (0.00 sec)
        
        mysql> desc players;
        +------------+--------------+------+-----+---------+----------------+
        | Field      | Type         | Null | Key | Default | Extra          |
        +------------+--------------+------+-----+---------+----------------+
        | id         | int(5)       | NO   | PRI | NULL    | auto_increment |
        | first_name | varchar(255) | NO   |     | NULL    |                |
        | last_name  | varchar(255) | NO   |     | NULL    |                |
        | position   | varchar(255) | NO   |     | NULL    |                |
        | number     | int(11)      | NO   |     | NULL    |                |
        | image      | varchar(255) | NO   |     | NULL    |                |
        | user_name  | varchar(20)  | NO   |     | NULL    |                |
        +------------+--------------+------+-----+---------+----------------+
        7 rows in set (0.00 sec)


<a id="orga59146b"></a>

## 修改项目的数据库配置

数据库连接的配置在 `app.js` 文件中, 将 `root` 的密码修改为之前设置的密码即可

![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/config-1.png)


<a id="org1c1e7a2"></a>

## 启动服务和验证

-   启动Node.js服务
    
        node app.js
        
        root@iZbp1hwnz2exdr8busn3zxZ:~/node-deploy# node app.js
        Server running on port: 80
        Connected to database

-   验证
    1.  本地浏览器打开远端服务器提供的服务:
        
        `http://云服务器公网IP地址`
        
![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/verify-1.png)
    2.  可以进行添加球员的操作:
        
![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/verify-2.png)
    3.  查看添加后的结果:
        
![img](http://by-courses.oss-cn-hangzhou.aliyuncs.com/%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%85%A5%E9%97%A8/deploy/image/verify-3.png)

