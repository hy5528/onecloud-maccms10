玩客云(armbian系统)一键安装苹果cms，其它设备没有测试过，理论上相关的系统都可以使用。运行前要确保安装了解压软件unzip。

一、一键安装苹果cms、数据库及运行环境。安装后网上有大把使用教程。默认：安装目录/www/cms；docker网络使用172.19.0.0网段。服务器地址为172.19.0.3，端口3306，数据库名为cms，用户root,密码123456。前台使用80端口，前台：http://你的IP/

一键安装命令

wget https://mirror.ghproxy.com/https://github.com/hy5528/onecloud-maccms10/blob/main/cms.sh && sudo bash cms.sh

二、影视分类还原：

1、上传影视分类备份文件--application--data--backup--database。
2、在管理后台的数据管理中还原。

三、所有资料均来自网络，自用，请不要商业应用。

