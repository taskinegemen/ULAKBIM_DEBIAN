#!/bin/bash
echo RESET mysql-server/root_password|debconf-communicate zkitapeditoru;
echo RESET mysql-server/root_password_again|debconf-communicate zkitapeditoru;

. /usr/share/debconf/confmodule


if [ "$1" = "purge" -a -e /usr/share/debconf/confmodule ]; then
    db_purge
fi


echo "MYSQL konfigürasyonları yapılandırılıyor..."
#mysql root password
db_input high mysql-server/root_password||true
db_go||true
db_get mysql-server/root_password||true
first=$RET
echo "ilk şifre:$first"

#mysql root password again
db_input high mysql-server/root_password_again||true
db_go||true
db_get mysql-server/root_password_again||true
second=$RET
echo "ikinci şifre:$second"

if [ "$first" == "$second" ]; then
        mysql -u root -p"$first"</tmp/MYSQL/ulakbim_editor.sql;
	echo "<?php \$db_config_list=array('other'=>array( 'connectionString' => 'mysql:host=localhost;port=3306;dbname=ulakbim_editor','emulatePrepare' => true,'username' => 'root','password' => '$first','charset' => 'utf8'));">/var/www/zkitapeditoru/protected/config/db_configuration.php;
else
        echo "Girdiğiniz şifreler birbiri ile eşleşmiyor. Lütfen kurulumu tekrar başlatınız!"
fi

