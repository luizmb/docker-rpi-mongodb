FROM resin/rpi-raspbian:latest

RUN groupadd -r mongodb
RUN useradd -r -g mongodb mongodb
RUN sudo apt-get update
RUN sudo apt-get install -y mongodb

VOLUME /data/db

EXPOSE 27017

CMD mongod --dbpath /home/mongodb/data/mongodb/ --logpath /home/mongodb/data/mongodb-log/mongodb.log
