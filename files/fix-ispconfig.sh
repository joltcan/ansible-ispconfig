#!/bin/bash


find /var/www/clients -iname wp-config.php -exec sed -i.bak.php "s/define( 'AUTOMATIC_UPDATER_DISABLED', true )/define( 'AUTOMATIC_UPDATER_DISABLED', false )/g" {} \;

success=0
for path in $(find /var/www/clients/ -maxdepth 2 -iname web\* |grep -v [b]ak); do
	user=$(basename $path)
	path=$path/web
	if [ -f $path/wp-config.php ] ;then
		cd $path
		su -c "wp --path=$path plugin is-installed automatic-updater" -s /bin/bash $user 
		if [ "$?" -ne 0 ]; then
			site=$(ls -lah /var/www | grep $user | awk '{print $9 }')
			echo "Installing for $site - $user - $path"
			su -c "wp --path=$path plugin install automatic-updater --activate" -s /bin/bash $user 
			if [ "$?" -ne 0 ]; then
				echo "Failed to install automatic-updater for $user @ $path" 
				$success=1
			fi
		fi
	fi
done

if [ $success -ne 0 ]; then
	echo "Found errors running $0, please investigate!"  |mail -s "Errors with $0" tech@frrog.com
fi

