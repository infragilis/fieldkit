#!/bin/bash
# see below for additional docker containers
# 
sudo apt-get upgrade -y
# add additional packages here
#vuurmuur, add 8080
sudo install ufw
sudo ufw allow 8080
sudo apt install apache2 -y
sudo apt-get install ufw
#install gnome consoles
sudo apt install terminator -y
#add user/pass and sudo
sudo useradd -m -p $6$Jr6x2GOscd76/.7W$x9sVWXwLdNY0fzcnVQUR.wMLFfJKig/snUZC5b3wYNqR1HESdN2QfcItcDpBSI9qIfFzEjoG/nVmIRWawHuGj/ -s /bin/bash fieldkit
sudo usermod -a -G sudo fieldkit
#build some directories and stuff
sudo mkdir /home/fieldkit/data
sudo mkdir /home/fieldkit/www
sudo mkdir /home/fieldkit/usb
sudo ln -s /home/fieldkit/data/ /var/www/html/data
sudo ln -s /home/fieldkit/usb/ /var/www/html/usb
sudo chown -R root.fieldkit /home/fieldkit
sudo chown -R root.www-data /var/www/html 
sudo mount /dev/sda1 /var/www/html/usb
# upgrade to latest docker
sudo wget -qO /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt install -y php8.3-common php8.3-cli
sudo apt install -y libapache2-mod-php8.3
sudo cp apache2.conf /etc/apache2/
sudo mv index.php /var/www/html/
sudo service apache2 restart

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh

sudo chmod 755 get-docker.sh
sh get-docker.sh
sudo usermod -aG docker fieldkit
#update ?
# install config advisor, needs 64bit, or arm docker image, still errors seems it's not going to be easy, busted
# also needs a start button on www, dont want to run if not used
# its more broken than a 1000 piece shattered mirror
#docker pull netapp/config-advisor
#
docker run --privileged --rm tonistiigi/binfmt --install amd64
#docker run --platform=linux/amd64 -d -p 8080:8080  -e ACCEPT_EULA=true -v /opt/NetApp/ConfigAdvisorAIDE -v /opt/NetApp/ConfigAdvisorAIDE netapp/config-advisor /NetApp/launch
