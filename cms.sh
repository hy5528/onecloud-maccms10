#!/bin/bash
rm -rf cms.sh
sudo mkdir -p /www 
sudo mkdir -p /www/mysql
sudo mkdir -p /www/cms && cd /www/cms
sudo chmod -R 777 /www/cms
wget https://mirror.ghproxy.com/https://raw.githubusercontent.com/magicblack/maccms_down/master/maccms10.zip
sudo chmod  777 maccms10.zip
sudo unzip maccms10.zip
sudo chmod -R 777 /www/cms
sudo docker stop cms >/dev/null 2>&1
sudo docker rm cms >/dev/null 2>&1
sudo docker network create --subnet 172.19.0.0/16 --gateway 172.19.0.1 --driver bridge film_network
sudo docker run -d --name film  --restart=always --user $(id -u):$(id -g) -v /www/cms:/var/www/html  -p 80:80 -e ND_LOGLEVEL=info --network=film_network --ip=172.19.0.2 shinsenter/phpfpm-apache:dev-php7.4 
sudo docker run -d --name cms --restart=always -p 3306:3306 -v /www/mysql:/var/lib/mysql -e MYSQL_DATABASE=cms -e MYSQL_USER=cms -e MYSQL_PASSWORD=123456 -e MYSQL_ROOT_PASSWORD=123456 --network=film_network --ip=172.19.0.3 yobasystems/alpine-mariadb:10.11
sudo chmod -R 777 /www

cd ~
echo "Everything is ok!"
echo "Open the website: http://`hostname -I|awk '{print $1}'`"
