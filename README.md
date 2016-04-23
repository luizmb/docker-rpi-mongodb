MongoDb docker container for Raspberry Pi (tested on RPi 3 with Raspbian Jessie)

To create your image and a container

1) Log into RPi
```bash
ssh pi@raspberrypi.local
```

2) Create parent folder
```bash
mkdir /home/pi/docker
```

3) Open parent folder
```bash
cd /home/pi/docker
```

4) Clone repository
```bash
git clone git@github.com:luizmb/docker-rpi-mongodb.git mongodb
```

5) Open repository folder
```bash
cd /home/pi/docker/mongodb
```

6) Create data folder and set permissions
```bash
mkdir /home/pi/docker/mongodb/data
mkdir /home/pi/docker/mongodb/data/mongodb
mkdir /home/pi/docker/mongodb/data/mongodb-log
chmod 755 /home/pi/docker/mongodb/data/mongodb
chmod 755 /home/pi/docker/mongodb/data/mongodb-log
```

7) Build image
```bash
./build.sh
```

8) Create container
```bash
./create.sh
```

9) Check if container is running
```bash
docker ps
```

Now your container should be running! You can install mongo client on Raspberry or other computers and connect into the server
```bash
sudo apt-get install -y mongodb-clients
mongo
```

**IMPORTANT!!!**

Do not stop or kill the container, your mongodb will be interrupted and next time won't work unless you delete the lock file:
```bash
rm /home/pi/docker/mongodb/data/mongodb/mongod.lock 
```

To gently stop the process, use the provided script:
```bash
./stop.sh
```

To start the container again:
```bash
./start.sh
```
