#!/bin/bash
#add user/pass and sudo
sudo useradd -m -p $6$Jr6x2GOscd76/.7W$x9sVWXwLdNY0fzcnVQUR.wMLFfJKig/snUZC5b3wYNqR1HESdN2QfcItcDpBSI9qIfFzEjoG/nVmIRWawHuGj/ -s /bin/bash fieldkit
sudo usermod -a -G sudo fieldkit
sudo mkdir /home/fieldkit/data
sudo mkdir /home/fieldkit/www
sudo mv index.php /var/www/html/www/
#cd /home/fieldkit/www/
sudo ln -s ../data data
sudo chown -R root.fieldkit /home/fieldkit
sudo chown -R root.www-data /var/www/html/
# upgrade to latest 
sudo apt-get upgrade -y
# add additional packages here
sudo apt install apache2 -y
sudo wget -qO /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt install -y php8.3-common php8.3-cli
sudo apt install -y libapache2-mod-php8.3
#fix this !!!!  cp apache2.conf /etc/apache2/
sudo service apache2 restart

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo chmod 755 get-docker.sh
sh get-docker.sh
sudo usermod -aG docker fieldkit
#update ?
