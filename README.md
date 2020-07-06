###### DNMP（Docker + Nginx1.13.0 + PHP7.2.17 + Swoole4.2.9 + Phalcon3.2.4）

- 增加redis集群
- 增加rabbitmq
- 增加elasticsearch
- 增加kibana

###### 目录结构

```
web
├── README.md
├── build                           镜像构建目录
│   ├── nginx
│   │   └── Dockerfile
│   ├── php71
│   │   ├── Dockerfile
│   │   ├── GeoLiteCity.dat
│   │   ├── cphalcon-3.2.4.tgz
│   │   ├── geoip-1.1.1.tgz
│   │   ├── memcached-3.0.4.tgz
│   │   ├── mongodb-1.4.2.tgz
│   │   ├── psr-0.6.1.tgz
│   │   ├── redis-4.0.0.tgz
│   │   ├── sources.list
│   │   ├── swoole-4.2.9.tgz
│   │   └── xdebug-2.6.0.tgz
│   └── redis_cluster
│       └── node
│           ├── Dockerfile
│           └── redis.conf
├── components                          组件库
│   ├── nginx
│   │   ├── conf.d                      nginx项目配置文件目录
│   │   │   ├── localhost.conf
│   │   │   ├── shop.dev.cn.conf        fpm模式下shop项目
│   │   │   ├── sjxboss.dev.cn.conf
│   │   │   ├── sjxbusiness.dev.cn.conf
│   │   │   └── sjxshop.dev.cn.conf     swoole模式下shop项目
│   │   └── log
│   │    
│   └── php71
│       ├── conf.d
│       │   ├── fpm
│       │   │   └── www.conf
│       │   └── php.ini
│       └── log
│           ├── alternatives.log
│           ├── apt
│           │   ├── eipp.log.xz
│           │   ├── history.log
│           │   └── term.log
│           ├── dpkg.log
│           ├── fontconfig.log
│           ├── supervisor
│           │   ├── sjx-stderr---supervisor-IUcBEv.log
│           │   └── supervisord.log
│           ├── xdebug.log
│           └── zookeeper
├── docker-compose.yml                  docker compose 配置文件
├── php7.sh                         
├── start_php7.sh
├── .env                                环境变量配置
├──xdebug_alias_ip.sh                   mac设置ip别名
└── www                                 项目目录
    └── html
        └── index.php
```

###### 傻瓜式一键安装

```
git clone https://github.com/King-William/dockerfile.git

# 配置项目目录、端口
vim .env

# 构建镜像并启动容器
sudo docker-compose up --build -d

# 构建单个镜像    
sudo docker-compose build [php71|nginx|....]


# 设置hosts
vim /etc/hosts/
127.0.0.1       sjxboss.dev.cn  www.sjxboss.dev.cn
127.0.0.1       sjxbusiness.dev.cn  www.sjxbusiness.dev.cn
127.0.0.1       sjxshop.dev.cn  www.sjxshop.dev.cn
```

###### 启动成功访问 http://localhost/index.php
###### rabbitmq 访问地址 http://localhost:15672 , 账号 guess, 密码 guess

###### redis集群设置
- docker exec -it web_redis_node1_1 /bin/bash
- /usr/local/bin/redis-cli --cluster create xx:6379 xx:6379 xx:6379 xx:6379 xx:6379 xx:6379 -cluster-replicas 1
- 查看redis集群容器的ip地址
```
docker inspect --format='{{.Name}} - {{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq) | grep redis

```


