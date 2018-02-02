FROM ubuntu:16.04

# Update OS
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

LABEL version="1.0"
LABEL description="Apache 2 / PHP"

# Create app directory
ADD . /webapp

#DEBUG postion 
RUN ls -l 
RUN pwd

RUN apt-get install -y git apache2
RUN git clone https://github.com/MourIdri/front-end-mou-cust.git /webappTEMP
RUN ls -l -h /webappTEMP && cp -rf /webappTEMP/* /var/www/html/
RUN pwd
RUN ls -l -h /var/www/html/
RUN mkdir /var/www/html/cgi-bin/sessions_log && chown -R www-data:www-data /var/www/html/ && mv /var/www/html/index.html /var/www/html/oldindex.htmlbkp && chmod -R 755 /var/www/html/ && chmod a+rwx /var/www/html/cgi-bin/sessions_log && chmod a+rwx /var/www/html/cgi-bin
#TEST number 2


#DEBUG postion 
RUN ls -l /webapp
RUN pwd

RUN apt-get install -y \
php libapache2-mod-php php-gd php-json php7.0-sqlite php-mysql php-mcrypt mcrypt ifstat inetutils-traceroute traceroute \
telnet curl python python-pip python3 python3-pip libapache2-mod-python libapache2-mod-php php-mysql mysql-client php php-fpm php-mysql \
php-curl php-gd php-pear php-imagick php-imap php-mcrypt php-recode php-tidy php-xmlrpc php-curl php-gd php-intl php-json php-mbstring \
php-mcrypt php-xml \
php-zip

RUN a2enmod cgi
RUN pip install requests flask ConfigParser mysql-connector-python flask-restful ast 

# on veut une machine de dev qui affiche toutes les erreurs PHP
RUN rm /etc/apache2/apache2.conf && curl -L -O https://rgcloudmouradgeneralpurp.blob.core.windows.net/exchangecontainermourad/etcapache2apache2.conf && mv etcapache2apache2.conf /etc/apache2/apache2.conf

RUN rm /etc/apache2/conf-enabled/serve-cgi-bin.conf && curl -L -O https://rgcloudmouradgeneralpurp.blob.core.windows.net/exchangecontainermourad/etcapache2conf-enabledserve-cgi-bin.conf && mv etcapache2conf-enabledserve-cgi-bin.conf /etc/apache2/conf-enabled/serve-cgi-bin.conf

# Set the default directory for our environment
ENV HOME /var/www/html
WORKDIR /var/www/html

EXPOSE 8000
EXPOSE 80
EXPOSE 8080

RUN service apache2 restart 
 
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]