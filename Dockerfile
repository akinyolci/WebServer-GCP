# Dockerfile

# base image
FROM ubuntu:latest

# install necessary packages
RUN apt-get update && apt-get install -y apache2

# copy website files to container
COPY index.html /var/www/html/

# set container port
EXPOSE 80

# start apache in foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
