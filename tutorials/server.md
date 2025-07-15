# Server
### Basics
Connect to the server:
```bash
ssh username@hostname
```

Connect to the server without a password:
```bash
# Copy your public key to the server
ssh-copy-id -i ~/.ssh/id_ed25519.pub username@hostname 
```

### NextCloud
1. Necessary server dependencies:
```bash
sudo apt install apache2 mariadb-server libapache2-mod-php
sudo apt install php-gd php-json php-mysql php-curl php-mbstring php-intl php-imagick php-xml php-zip
```

2. Restart Apache2 server:
```bash
sudo service apache2 restart
```

3. Navigate to the Apache Web folder
```bash
cd /var/www/html
```

4. Download NextCloud and set privileges

```bash
sudo wget https://download.nextcloud.com/server/releases/latest.zip
# Extract the file with unzip:
sudo unzip latest.zip
# As we used the root user to extract files, we need to change folder permissions to allow Apache to access it:
sudo chmod 750 nextcloud -R
sudo chown www-data:www-data nextcloud -R
```

5. Mariadb setup (replace 'password' with a strong password)
```bash
sudo apt install mariadb-server

sudo mysql

CREATE USER 'nextcloud' IDENTIFIED BY 'password';

CREATE DATABASE nextcloud;

GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@localhost IDENTIFIED BY 'password';

FLUSH PRIVILEGES;
quit
```

6. NextCloud Installation script
You can download NextCloud either from a gui:
```bash
# Browse
http://IP/nextcloud
```
Or through the commandline:
```bash
sudo -E -u www-data php occ maintenance:install \
    --database "mysql" \
    --database-name "nextcloud" \
    --database-user "nextcloud" \
    --database-pass "dbpw" \
    --admin-user "username" \
    --admin-pass "pw" \
    --data-dir "/var/www/html/nextcloud/data"
```
If it doesn't work try the following while inside the NextCloud folder:
```bash
sudo -u www-data php ./occ maintenance:install \
    --database "mysql" \
    --database-name "nextcloud" \
    --database-user "nextcloud" \
    --database-pass "dbpw" \
    --admin-user "username" \
    --admin-pass "pw" \
    --data-dir "/var/www/html/nextcloud/data"
```
Update the trusted domains array:
```
'trusted_domains' => 
  array (
    0 => 'localhost',
    1 => 'IP',
    2 => 'nextcloud.local',
    3 => 'hostname',
    4 => 'username@hostname',
  ),
```
,where id(array[1]), hostname(array[3]) and username(array[3], array[4]) refer to the server.

### Credentials
Login via the server's username and password.