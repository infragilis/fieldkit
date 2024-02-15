#!/bin/bash
#add user/pass and sudo
useradd -m -p $6$Jr6x2GOscd76/.7W$x9sVWXwLdNY0fzcnVQUR.wMLFfJKig/snUZC5b3wYNqR1HESdN2QfcItcDpBSI9qIfFzEjoG/nVmIRWawHuGj/ -s /bin/bash fieldkit
sudo usermod -a -G sudo fieldkit
mkdir /home/fieldkit/data
mkdir /home/fieldkit/www
cp index.php /home/fieldkit/www/
chown -R fieldkit.fieldkit /home/fieldkit
# upgrade to latest 
sudo apt-get upgrade -y
# add additional packages here
sudo apt install apache2 -y
sudo wget -qO /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt install -y php8.3-common php8.3-cli
sudo apt install -y libapache2-mod-php8.3
sudo service apache2 restart

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker fieldkit
