# dubbo-demo
#环境
MySQL、zookeeper
#框架
Spring MVC、MyBatis、dubbo、Druid数据池

Idea下Maven构建多模块开发整合dubbo项目

以往的项目较小，所有的模块都放在已在项目之中，在新的微服务架构之下，构建多模块更好的协同分工开发。

项目集成了dubbo，在导入项目之前请先运行项目sql文件创建数据库，数据库创建了存储过程生成唯一订单，详情请看数据库文件。

下载zookeeper（http://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/） ，运行项目前请先启动zookeeper，解压进入bin文件下找到zkServer.cmd启动。

git clone  https://github.com/dubbo/dubbo-ops.git 下载dubbo控制台，这是一个spring boot项目，可使用maven创建启动jar包。

本项目中，关于dubbo的服务都在dubbo-service模块中。

项目可继续拓展其他模块，例如config配置模块，common公共模块，创建一个module即可，同时在需要使用这个模块的pom.xml文件中写入依赖即可。
