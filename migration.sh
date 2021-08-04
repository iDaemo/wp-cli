Live Site:

wp db export
zip -r my_export_file_name.zip *
rm (name of sql file you exported)

Creating a dev site from backup
Dev Site:

(keep a copy of your dev site’s wp-config.php and .htaccess for use later)
wp db clean
rm -rf *
wget https://mysite.com/my_export_file_name.zip
Now I use “wp” to clean the database on the dev site so it’s completely empty.  I use “rm” to remove all files on the file system (-rf recursively removes all files AND folders), with the wildcard * to indicate we want to wipe everything. Then “wget” gets the zip file from my live site.  This leaves you with an empty WP database and a completely empty file system, so remember that you need to keep a local/offsite copy of your dev site’s wp-config.php file.

Live Site:

rm my_export_file_name.zip
IMPORTANT: Now I go back to the live site to remove the zip file.  This is the same as when we removed the sql file in the first step.  Don’t forget this part and leave it sitting around on your server.  That’s a security risk.

Dev Site:

unzip my_export_file_name.zip
(upload/copy original wp-config.php and .htaccess for dev)
wp db import (name of sql file)
wp search-replace https://mysite.com https://mydevsite.com
rm my_export_file_name.zip
rm (name of sql file)
(OPTIONAL) wp plugin install disable-emails –activate
