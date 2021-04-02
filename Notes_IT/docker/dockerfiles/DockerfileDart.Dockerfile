# my redstone1 container
FROM dart15:v15
MAINTAINER Raizul Razputin

# install dart server app
ADD /redstone1 /redstone1

WORKDIR /redstone1
RUN pub get

EXPOSE 8080

WORKDIR /redstone1/bin

# ENTRYPOINT ["dart"]

# Change this to your starting dart.
CMD ["dart","redstone1.dart"]



# FROM dart15:v15
# MAINTAINER Raizul Razputin

# # install dart server app
# # RUN mkdir redstone1
# ADD /ws1 /ws1

# WORKDIR /ws1
# RUN pub get

# EXPOSE 8080
# # CMD ["--port 8080"]

# # Entrypoint.
# WORKDIR /ws1

# ENTRYPOINT ["dart"]

# # Change this to your starting dart.
# CMD ["ws1.dart"]


