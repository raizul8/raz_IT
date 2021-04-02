# Install a dart container for demonstration purposes.
# Your dart server app will be accessible via HTTP on container port 8080.
# You should adapt this Dockerfile to your needs.
# If you are new to Dockerfiles please read
# http://docs.docker.io/en/latest/reference/builder/
# to learn more about Dockerfiles.

FROM stackbrew/ubuntu:13.10
MAINTAINER Nane Kratzke <nane@nkode.io>

# Install Dart SDK. Do not touch this until you know what you are doing.
# We do not install darteditor nor dartium because this is a server container.
# See: http://askubuntu.com/questions/377233/how-to-install-google-dart-in-ubuntu
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-add-repository ppa:hachre/dart
RUN apt-get -y update
RUN apt-get install -y dartsdk

# Install the dart server app. Add additional directories if necessary for your app.
ADD pubspec.yaml /container/pubspec.yaml
ADD bin          /container/bin
ADD web          /container/web

# Build the app. Do not touch this.
WORKDIR /container
RUN pub build

# Expose port 8080. You should change it to the port(s) your app is serving on.
EXPOSE 8080

# Entrypoint.
# Whenever the container is started the following command is executed in your container.
# In most cases it simply starts your app.
WORKDIR /container/bin
ENTRYPOINT ["dart"]

# Change this to your starting dart.
CMD ["httpserver.dart"]