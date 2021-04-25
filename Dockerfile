FROM busybox:latest

LABEL maintainer="Seubpong Monsar"

ADD index.html /www/index.html
RUN echo "<h1>Hello World !!!!</h1>" >> /www/index.html

# Create a basic webserver and run it until the container is stopped
CMD trap "exit 0;" TERM INT; httpd -p ${PORT} -h /www -f & wait 
