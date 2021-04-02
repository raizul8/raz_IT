# become root
sudo -i
# exit root
exit CTRL+D

# refresh terminal
. ~/.profile or .bashrc

# select what editor visudo uses
sudo select-editor

# start nautilus
nautilus --browser 

# run shell script sudo without password
As root, prevent write (and maybe other) access to your script:

chown root /absolute/path/to/your/script.sh
chmod 700 /absolute/path/to/your/script.sh

Verify that none except root can replace the script, e.g. by modifying the access rights of the parent folder:

chown root /absolute/path/to/your/
chmod 755 /absolute/path/to/your/

# EDIT SUDOERS FILE safely
sudo visudo -f /etc/sudoers

Modify sudo access rights in /etc/sudoers with sudo visudo -f /etc/sudoers

ALL    ALL = (root) NOPASSWD: /absolute/path/to/your/script.sh
ALL    ALL = (root) NOPASSWD: /home/raizul2/razIT/scriptsExtensions/ShellScripts/timer/timer.sh

Afterwards, all users can run the script as root without password:

# repair sudoers
# mount to be able to rw
mount -o rw,remount /

sudo cp /etc/sudoers /etc/sudoers.backup
sudo nano /etc/sudoers
# --


# send password to command
echo mypassword | sudo -S command

# make script executable with: chmod +x suspend.sh chmod 755 suspend.sh
sudo /home/razvan/IT/ShellScripts/suspend.sh

# run shell script with ./ to say run from this directory

# fix dependencies
sudo apt-get install -f

# find directory
find  / -type d -name "tutorial"

# To create a symbolic link in Unix or Linux, at the shell prompt, enter the following command:
ln -s {target-filename} {symbolic-filename}

For example create softlink for /webroot/home/httpd/test.com/index.php as /home/vivek/index.php, enter the following command:

ln -s /webroot/home/httpd/test.com/index.php /home/vivek/index.php
ls -l

# link to folder
ln -s /media/raizul/D/raz_1/razIT razIT

# find all files in folder razIT
find razIT -name '*.sql'

# find mouse location
xdotool getmouselocation --shell

# xfce task manager
xfce4-taskmanager

# view manual installed packages
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

# change ssh port
nano /etc/ssh/sshd_config

# update-rc.d
service --status-all
service apache2 start, stop
service apache2 status
update-rc.d -f  apache2 remove
