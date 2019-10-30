### on authenticated button click, create $5 droplet for user and bill user $19.95 per month
### send user credentials
### allow them to select domain



sudo apt-get update
sudo apt-get -y upgrade
echo y | sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less
echo y | sudo apt-get install python-psycopg2
sudo apt-get install libpq-dev
pip3 install --upgrade setuptools
pip3 install babel 
pip3 install decorator 
pip3 install docutils 
pip3 install ebaysdk 
pip3 install feedparser 
pip3 install gevent 
pip3 install greenlet 
pip3 install html2text 
pip3 install Jinja2 
pip3 install lxml 
pip3 install Mako 
pip3 install MarkupSafe 
pip3 install mock 
pip3 install num2words 
pip3 install ofxparse 
pip3 install passlib 
pip3 install Pillow 
pip3 install psutil 
pip3 install psycogreen 
pip3 install psycopg2 
pip3 install pydot 
pip3 install pyparsing 
pip3 install PyPDF2 
pip3 install pyserial 
pip3 install python-dateutil 
pip3 install python-openid 
pip3 install pytz 
pip3 install pyusb 
pip3 install PyYAML 
pip3 install qrcode 
pip3 install reportlab 
pip3 install requests 
pip3 install six 
pip3 install suds-jurko 
pip3 install vatnumber 
pip3 install vobject 
pip3 install Werkzeug 
pip3 install XlsxWriter 
pip3 install xlwt 
pip3 install xlrd
pip3 install polib

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nInstalled Python Modules\nInstalled Python Modules\nInstalled Python Modules\n\n\n\n\n\n\n\n\n\n\n\n"

sudo apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less less-plugin-clean-css
sudo apt-get install node-less
sudo python3 -m pip install libsass

## install postgres
sudo apt-get install python3-software-properties
touch /etc/apt/sources.list.d/pgdg.list
echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' >> /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
echo y | sudo apt-get install postgresql-9.6


echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nInstalled Postgres\nInstalled Postgres\nInstalled Postgres\n\n\n\n\n\n\n\n\n\n\n\n"


## create database user for odoo
sudo su -c "cd
createuser -s odoo
createuser -s root
exit" postgres


## create odoo user and group
sudo adduser --system --home=/opt/odoo --group odoo

## install python packages
cd /opt/odoo
sudo wget https://pypi.python.org/packages/a8/70/bd554151443fe9e89d9a934a7891aaffc63b9cb5c7d608972919a002c03c/gdata-2.0.18.tar.gz
sudo tar zxvf gdata-2.0.18.tar.gz
sudo chown -R odoo: gdata-2.0.18
cd gdata-2.0.18 
python setup.py install

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nSetup python packages\n\n\n\n\n\n\n\n\n\n\n\n\n"


cd /opt/odoo
git clone https://www.github.com/odoo/odoo --depth 1 --branch 13.0 --single-branch

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nInstalled Odoo\nInstalled Odoo\nInstalled Odoo\n\n\n\n\n\n\n\n\n\n\n\n"

## odoo log file
sudo mkdir /var/log/odoo
sudo chown -R odoo:root /var/log/odoo


#Copy and paste below content in config file , write correct addons paths
echo -e '[options]\n; This is the password that allows database operations:\n; admin_passwd = admin\n; admin_passwd = admin\ndb_host = False\ndb_port = False\ndb_user = odoo\ndb_password = False\nlogfile = /var/log/odoo/odoo-server.log\naddons_path = /opt/odoo/addons,/opt/odoo/odoo/addons' > /etc/odoo.conf
sudo chown odoo: /etc/odoo.conf

## Edit odoo configuration file
sudo wget https://builds.wkhtmltopdf.org/0.12.1.3/wkhtmltox_0.12.1.3-1~bionic_amd64.deb
echo y | sudo apt install ./wkhtmltox_0.12.1.3-1~bionic_amd64.deb
sudo cp /usr/local/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
sudo cp /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf

# sudo ufw allow 8069
echo y | ufw enable
ufw allow 80
ufw allow 443
ufw allow 8069
ufw allow 22
echo y | sudo apt install apache2

# cd /etc/apache2/sites-available/
# rm 000-default.conf
# echo -e '<VirtualHost *:80>\nServerName' $1'\nRedirect / https://'$1'/\n</VirtualHost>' >> 000-default.conf
# rm default-ssl.conf
# echo -e '<VirtualHost *:443>\nServerName' $1'RewriteEngine On\nRewriteCond %{HTTP:Upgrade} =websocket [NC]\nRewriteRule /(.*)           ws://localhost:8069/$1 [P,L]\nRewriteCond %{HTTP:Upgrade} !=websocket [NC]\nRewriteRule /(.*)           http://localhost:8069/$1 [P,L]\nProxyPassReverse / http://localhost:8069/\n</VirtualHost>' >> default-ssl.conf

echo y | sudo apt install certbot


cd /opt/odoo/odoo
sudo su -c "./odoo-bin" -s /bin/bash odoo

