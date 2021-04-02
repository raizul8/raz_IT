-- connect
mysql -h localhost -u root -p

-- start stop mysql server
sudo service mysql status
sudo service mysql stop
sudo service mysql start


update-rc.d mysql disable
update-rc.d -f mysql remove