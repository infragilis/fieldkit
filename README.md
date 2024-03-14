#FAIR WARNING, this is not designed with security in mind, certificates are the devils .... simple base_64 encoded passwords in a public github ? 
#Surprised i didn't get banned ..... 
#purpose build, for the field .. no sec, no certs, just functionality


# fieldkit install
raspberry pi imager, advanced, set wifi, user/sudo 
git pull this
git clone https://github.com/infragilis/fieldkit
./install.sh

# gives you:
## config advisor  (64 bit issue needs fixed)

## http/scp/ downloads from either local or inserted usb stick

http server for downloading your bits to equipment
http://<yourip>/data  (symlink to /home/fieldkit/data)

http://<yourip>/usb  all data listed from usb thumbdrive thats inserted in correct port (sda)

SCP for pulls:

scp  fieldkit@192.168.200.136:/home/fieldkit/data/somefile.tgz .

## ansible through docker (needs install docker and templates example)
