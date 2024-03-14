# fieldkit
raspberry pi imager, advanced, set wifi, user/sudo 
git pull this
git clone https://github.com/infragilis/fieldkit
./install.sh

gives you:

http server for downloading your bits to equipment
http://<yourip>/data  (symlink to /home/fieldkit/data)

http://<yourip>/usb  all data listed from usb thumbdrive thats inserted in correct port (sda)

SCP for pulls:

scp  fieldkit@192.168.200.136:/home/fieldkit/data/somefile.tgz .
