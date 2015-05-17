set -x
set -e
sudo apt-add-repository -y ppa:ondrej/mysql-5.6
sudo apt-get -q update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-5.6
echo '[mysqld]' | sudo sh -c 'cat >>  /etc/mysql/my.cnf'
echo 'innodb_ft_min_token_size = 1' | sudo sh -c 'cat >>  /etc/mysql/my.cnf'
sudo /etc/init.d/mysql restart
sleep 1
