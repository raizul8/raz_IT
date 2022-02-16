-- Diverse:
-- https://github.com/sosedoff/pgweb
-- try sql fiddle
-- diagrams prg: execute query

-- provide credentials like this
DATABASE_URL=postgres://localhost?dbname=mydb&user=postgres&password=postgres

-- start pgadmin4
./pgadmin4env/bin/pgadmin4&


-- <start stop database
Ubuntu or Debian can run multiple instances of PostgreSQL and provide a specific way to autostart/stop/start 
each cluster.

There should be a file named start.conf inside /etc/postgresql/9.2/main 
(or more generally /etc/postgresql/<version>/<clustername>) with these self-explanatory contents:

# Automatic startup configuration
# auto: automatically start/stop the cluster in the init script
# manual: do not start/stop in init scripts, but allow manual startup with
#         pg_ctlcluster
# disabled: do not allow manual startup with pg_ctlcluster (this can be easily
#           circumvented and is only meant to be a small protection for
#           accidents).

auto
If you replace auto by manual, you could start this PostgreSQL instance only when desired with the command:

-- (this shows the state of the database)
tail -f /var/log/postgresql/postgresql-9.3-main.log
-- start stop database >

--< use text instead of varchar
CREATE DOMAIN dom_username TEXT CHECK (
    LENGTH(VALUE) > 3 AND
    LENGTH(VALUE) < 200 AND
    VALUE ~ '^[A-Za-z][A-Za-z0-9]+$'
);

CREATE TABLE user (
  name dom_username,
  email TEXT
);
--/>

-- try sql fiddle

-- connection url
postgresql://[user[:password]@][netloc][:port][/dbname][?param1=value1&...]

-- diagrams prg: execute query

-- reload start db
sudo service postgresql reload, stop, restart, start
-- Or login as superuser
SELECT pg_reload_conf();

-- local server connect to database as razvan
psql -d mydb2 -U razvan
psql -h localhost -U raz -d mydb

-- psql mode
sudo -u postgres psql
-- psql mode connected to postgres database
sudo -u postgres psql postgres 

-- connect to a server named myhost
psql -h myhost -d mydb -U myuser

-- if no password prompt
psql -d mydb -U myuser -W
psql -h myhost -d mydb -U myuser -W

-- list tables and databases
\l shorthand for \list lists all databases
\d or \dt lists all tables in the current database

-- clear screen
\! clear

-- connect database
\c or \connect DBNAME

-- exit psql
\q or Ctrl+D

--------
mysql: SHOW TABLES
postgresql: \d
postgresql: SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

mysql: SHOW DATABASES
postgresql: \l
postgresql: SELECT datname FROM pg_database;

mysql: SHOW COLUMNS
postgresql: \d table
postgresql: SELECT column_name FROM information_schema.columns WHERE table_name ='table';

mysql: DESCRIBE TABLE
postgresql: \d+ table
postgresql: SELECT column_name FROM information_schema.columns WHERE table_name ='table';

-- view creation sql
pg_dump --schema-only -h localhost -d mydb -t orders 

-- -E encoding -s schema-only -v verbose
pg_dump -h 127.0.0.1 -E UTF8 -s -v mydb > mydb.ddl -- this will create a file in curr dir


-- short way of creating user(role)
-- interactive login shell
sudo -u postgres -i
create database mydb2;
create user myuser with encrypted password 'mypass';
grant all privileges on database mydb2 to myuser;

-- nicer way to create roles/users
-- The command gets you the psql command line interface in full admin mode.
sudo -u postgres psql

-- Creating user
sudo -u postgres createuser <username>

-- Creating Database
sudo -u postgres createdb <dbname>

-- Giving the user a password
sudo -u postgres psql
psql=# alter user <username> with encrypted password '<password>';

-- Granting privileges on database
psql=# grant all privileges on database <dbname> to <username> ;

-- Doing purely via psql

-- Your OS might not have the createuser or createdb binaries, or you may, for some reason want to do it purely via psql, then these are the three magic commands 
CREATE DATABASE yourdbname;
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;

-- create role
CREATE ROLE leo LOGIN PASSWORD 'lion!king'
CREATEDB VALID UNTIL 'infinity';

-- create superuser role
CREATE ROLE regina LOGIN PASSWORD 'queen!penultimate'
SUPERUSER VALID UNTIL '2020-10-20 23:00';


-- drop role properly, for ex user raz
drop owned by raz;
drop user raz;
-- check you droped the user
select rolname from pg_roles;


-- view roles
SELECT rolname
FROM pg_roles;


-- Select column names, data_types from table
SELECT column_name, data_type
    FROM information_schema.columns
WHERE table_name = 'weather';

-- subquery
SELECT * FROM cities 
WHERE name = any (array(SELECT name FROM cities ORDER BY name LIMIT 2));
-- subquery2
SELECT * FROM cities 
WHERE name in (SELECT name FROM cities ORDER BY name LIMIT 2);


-- copy from one table to another
INSERT INTO TABLE1 (id, col_1, col_2, col_3)
SELECT id, 'data1', 'data2', 'data3'
FROM TABLE2
WHERE col_a = 'something';

CREATE DATABASE mydb;

--to describe (list) what tables are in the database
\d

-- more detailed description
\d+

--to describe attributes of a table
\d table

-- view users
\du

-- view tables 
\dt

-- list database
\l 

-- connect to db 
\c my_database_name

-- connect to container db 
-- docker run --name postgres-0 -e POSTGRES_PASSWORD=password -d -p 5432:5432 postgres:alpine
-- -h host
psql -h localhost -p 5432 -U postgres

-E
--echo-hidden
-- Echo the actual queries generated by \d and other backslash commands. You can use this to study psql's internal operations. This is equivalent to setting the variable ECHO_HIDDEN to on


















