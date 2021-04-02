# network ingo on docker container, it shows with who is linked on last line, ip and name
in /etc/hosts

# Remove temporary built images
docker images -notrunc| grep none | awk '{print $3}' | xargs -r docker rmi

# Remove Docker containers with Exit status
docker ps -a -notrunc | grep 'Exit' | awk '{print $1}' | xargs -r docker rm

# Now since we use those commands here very frequently, it’s best to simply add those as 
# aliases to your ~/.bashrc. ( Or – even better! – to your dotfiles; so you have them handy 
# 	on any server you’re working on )
alias dockercleancontainers="docker ps -a -notrunc| grep 'Exit' | awk '{print \$1}' | xargs -L 1 -r docker rm"
alias dockercleanimages="docker images -a -notrunc | grep none | awk '{print \$3}' | xargs -L 1 -r docker rmi"
alias dockerclean="dockercleancontainers && dockercleanimages"

# interactive shell -t allocate a pseudo tty(tele type/ aka terminal)
docker run -i -t --name="u1" ubuntu /bin/bash

#start container
docker start -i u1

# pull image
docker pull ubuntu:14.04

# create container
docker run --name ubt_14 ubuntu:14.04

# remove working container
docker rm --force ubt_14

# attach to running container
docker run -d --name dart2oct -p 8081:8080 -i -t -v /redstone2:/webapp google/dart /bin/bash
docker attach dart2oct

# By doing this, even if your main command runs in the background, your container doesn’t stop because tail is keep running in the foreground.
docker run -d apache-server apachectl start && tail -f /dev/null

# By default, the docker ps command only shows information about running containers. 
# If you want to see stopped containers too use the -a flag.

# -d daemon 
# -P map any required network ports inside our container to our host
# -P flag to automatically map any network ports inside that container to a random high port 
# from the range 49000 to 49900 on our Docker host. When we subsequently ran docker ps we saw 
# that port 5000 was bound to port 49155.
sudo docker run -d -P training/webapp python app.py


# -P flag is a shortcut for -p 5000 that makes port 5000 inside the container to a high port 
# (from the range 49000 to 49900) on the local Docker host. We can also bind Docker container's 
# to specific ports using the -p flag, for example:
sudo docker run -d -p 5000:5000 training/webapp python app.py

# maps app.py(default 5000 port) to 8080 local machine 
docker run -d -p 8080:5000 training/webapp python app.py

# bind to local host
sudo docker run -d -p 127.0.0.1:5000:5000 training/webapp python app.py
# Or to bind port 5000 of the container to a dynamic port but only on the localhost we could:
sudo docker run -d -p 127.0.0.1::5000 training/webapp python app.py

# name container on creation
docker run --name landalo -d -p 8081:5000 training/webapp python app.py

# docker port command
docker port nostalgic_morse 5000
127.0.0.1:49155
# Note: The -p flag can be used multiple times to configure multiple ports.

# stop container in 1s default 10s
docker stop -t 1 jolly_fermi 

# stop remove all containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# act like tail -f prints last 10 lines of file even as it grows
sudo docker logs -f nostalgic_morse

# view running container
docker inspect compassionate_colden 

# view only specific values from inspect
docker inspect -f '{{ .NetworkSettings.IPAddress }}'  compassionate_colden 

# remove containers
docker rm `docker ps --no-trunc -aq`

# copy file from container to host
docker cp `dl`:/etc/passwd .

# copy file from host to container(you have to bee root and docker must have the container running)
cp -r ~/dartProj/Pr4/ca1 /var/lib/docker/aufs/mnt/(id nr)/name_of_dir_dest

# commit container changes to image
docker commit clever_albattani(or id) lala/one:ver2(name of image)

# change tag of image
docker tag 5db5f8471261 ouruser/sinatra:devel

# docker push image
docker push ouruser/sinatra

# linking containers
docker run -d --name db training/postgres
docker run -d -P --name web --link db:db training/webapp python app.py
# check linked container --rm removes container after closing
docker run --rm --name web2 --link db:db training/webapp env

# backup data from container
docker run --volumes-from dbdata -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata

# then untar in new container
docker run --volumes-from dbdata2 -v $(pwd):/backup busybox tar xvf /backup/backup.tar

# mount single file
docker run --rm -it -v ~/.bash_history:/.bash_history ubuntu /bin/bash

# remove old containers, instead of weeks ago you coud use days ago
docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm

# remove images
docker images | grep 'dart_2' | awk '{print $1}' | xargs docker rmi
# change directory with xargs bash -c 'cd "$0"'
echo '/home/raz2/ca1/c1' | xargs bash -c 'cd "$0"'

# rename image
docker tag 1cf76 myUserName/imageName:0.1.0

# mysql image
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql

docker run --name some-app --link some-mysql:mysql -d application-that-uses-mysql
#or
docker run -it --link some-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

# Detach from a container
To detach yourself from the container, use the escape sequence CTRL+P followed by CTRL+Q.

# build image from Dockerfile
docker build -t	(name of image) (location of Dockerfile)
docker build -t dart_25_iulie .

docker run -p 8080:3000 -d dartchat

# Docker ADD command is relative to the files being added

# Pipework – More Networks for your Containers

Docker creates a special Linux bridge called docker0 on startup. All containers are automatically connected to this bridge and the IP subnet for all containers is randomly set by Docker. Currently, it is not possible to directly influence the particular IP address of a Docker container. Luckily, there is a shell script pipework which you can use to add another interface to a container with a specified IP address. I contributed to the script, so as to allow adding arbitrary numbers of interfaces. For example
> sudo ./pipework docker0 -i eth1 $(docker ps -q -l) 10.2.0.11/16

#when you make a web app make it available at ip address 0.0.0.0 or else it wont't work

# export container
sudo docker export <CONTAINER ID> > /home/export.tar
# import container
cat /home/export.tar | sudo docker import - busybox-1-export:latest

# save image
sudo docker save busybox-1 > /home/save.tar
# load image
docker load < /home/save.tar

# flatten docker image by running a container then export it and import it if you save it again to an image it take less size. The image has lost it's history and layers that's why.
docker export <CONTAINER ID> | docker import - some-image-name:latest
# also clean the cache
apt-get clean

# view history of image
docker history <image>

# User / Group Identifiers
# Sometimes when using data volumes (-v flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user PUID and group PGID. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" 