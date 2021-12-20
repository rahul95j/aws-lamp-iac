#! /bin/bash
ufw disable
sudo apt update -y
sudo apt upgrade -y
# sudo apt install python3-pip -y
# sudo pip3 install pymysql
# sudo ln -s /usr/bin/python3 /usr/bin/python
# sudo apt install -y apache2
systemctl start apache2
systemctl enable apache2
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork cgi
sudo service apache2 restart
# cat /dev/null > /etc/apache2/sites-enabled/000-default.conf

# sudo cat <<EOT >> /etc/apache2/sites-enabled/000-default.conf
# <VirtualHost *:80>
#     <Directory /var/www/test/>
#         Options +ExecCGI
#         DirectoryIndex index.py
#     </Directory>
#     AddHandler cgi-script .py

#     ServerAdmin webmaster@localhost
#     DocumentRoot /var/www/test

#     ErrorLog ${APACHE_LOG_DIR}/error.log
#     CustomLog ${APACHE_LOG_DIR}/access.log combined
# </VirtualHost>
# EOT


# cat /dev/null > /var/www/test/index.py
# sudo chmod 755 /var/www/test/index.py
# sudo cat <<EOT >> /var/www/test/index.py
# #!/usr/bin/env python

# import cgitb
# cgitb.enable()

# # Print necessary headers.
# print("Content-Type: text/html")
# print()

# # Connect to the database.
# import pymysql
# conn = pymysql.connect(
#         user='admin',
#         passwd='password',
#         host='mysqldb.cwcqnl6kkz7p.ap-south-1.rds.amazonaws.com')
# c = conn.cursor()

# # Create table and Insert some example data.
# c.execute("CREATE DATABASE IF NOT EXISTS mysqldb")
# c.execute("USE mysqldb")
# try:
#     c.execute("CREATE TABLE numbers (num INT, word VARCHAR(20))")
# except:
#     print("")
# c.execute("INSERT INTO numbers VALUES (1, 'One!')")
# c.execute("INSERT INTO numbers VALUES (2, 'Two!')")
# c.execute("INSERT INTO numbers VALUES (3, 'Three!')")
# conn.commit()

# # Print the contents of the database.
# c.execute("SELECT * FROM numbers")

# print([(r[0], r[1]) for r in c.fetchall()])
# EOT