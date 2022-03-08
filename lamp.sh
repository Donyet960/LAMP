#!/bin/bash
if [ `whoami` == "root" ]
    then
        sudo apt-get update
        sudo apt-get upgrade
        sudo apt-get install apache2
        sudo ufw disable
        sudo apt-get install mysql-server
        clear
        echo "Poner lo siguiente: no - contraseña - repetir-contraseña - y - n - n - y"
        sudo mysql_secure_installation
        sudo apt install php libapache2-mod-php php-mysql
        sudo systemctl restart apache2
        sudo touch /var/www/html/info.php
        echo "<?php phpinfo();" >> /var/www/html/info.php
        echo "Apache funcionando -> http://localhost"
        echo "PHP funcionando -> http://localhost/info.php"
        read -p "Contraseña para phpmyadmin: " paswphpmyadmin
        sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
        sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$paswphpmyadmin'"
        echo "Entrar aqui -> http://localhost/phpmyadmin"
else 
    echo "Necesitas ser root"
fi

#politicas de privacidad
#UNINSTALL COMPONENT "file://component_validate_password";

#Si no funciona root
#CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
#GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
#FLUSH PRIVILEGES;
