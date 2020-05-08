FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y nginx nodejs
RUN apt-get install -y npm
ADD index.html /web/index.html
ADD website /website
ADD nginx.conf /etc/nginx/nginx.conf

CMD ["/bin/bash", "-c", "cd /website && npm install && npm run build && service nginx start && echo what && while true ; do sleep 3600; done"]