FROM    ubuntu:14.04

RUN     apt-get update
RUN     apt-get install --yes curl
RUN     sudo apt-get install apache2 --yes
RUN     sudo apt-get install php5 --yes
RUN     sudo apt-get install libapache2-mod-php5 --yes
RUN     sudo /etc/init.d/apache2 restart

# Bundle app source
COPY . /var/www/html/

WORKDIR /var/www/html/

EXPOSE  80

CMD ["php", "core/builder.php", "-wr"]