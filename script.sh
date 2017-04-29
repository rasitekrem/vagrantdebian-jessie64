sudo apt-get update

#Githubdan phpappyi almak için git'i yükledik
sudo apt-get install git-core -y
sudo git clone https://github.com/sdemircan/phpapp.git
# Apache2 kurulum
sudo apt-get install -y apache2

# Mysql password otomatik ayarı
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password pass'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password pass'

# Mysql kurulumu
sudo apt-get install -y mysql-server mysql-client

# Php kurulumu 
sudo apt-get -y install php5 libapache2-mod-php5


sudo mv /var/www/html/index.html /var/www/html/apache.html

# Clone ettiğimiz phpapp dizinindekileri kopyalıyoruz.
sudo cp -R phpapp/* /var/www/html/
sudo sed -i "s/'';/'pass';/g" /var/www/html/conn.php

#Veritabanını oluşturuyoruz ve schema.sql i import ediyoruz

mysql -u root -ppass -e 'CREATE DATABASE IF NOT EXISTS schema;'
mysql -u root -ppass schema < /var/www/html/schema.sql

#Sistemdeki değişikliklerin uygulanması için serveri yeniden başlatıyoruz
sudo systemctl restart apache2
