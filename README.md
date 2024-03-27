## Build image

First, build image locally.

```
$ sudo docker build -t suricata:v5 .
```

## Run container

Then run a container.

```
$ sudo docker run -it --rm \
-v $(pwd)/logs:/var/log/suricata \
--cap-add=net_admin --cap-add=sys_nice --net=host \
-e CONFIG="-i wlan0" suricata:v5


$ sudo docker run -d \
-v $(pwd)/logs:/var/log/suricata \
--cap-add=net_admin --cap-add=sys_nice --net=host \
-e CONFIG="-i wlan0" --restart unless-stopped suricata:v5
```

## Or run with docker-compose

Configure interface on which suricata will listen to (same name as docker host).

```
$ sudo docker-compose up -d
```

docker-compose.yml, configure listening interfaces : -i eth1 -i ethn
```
version: "3"

services:
  suricata:
    container_name: suricata
    image: suricata:v3
    network_mode: host
    environment:
      CONFIG: '-i eth1'  
    cap_add:
      - NET_ADMIN
      - SYS_NICE
    restart: unless-stopped
    volumes:
      - './logs:/var/log/suricata'

```

## Tester l'IDS

From a lan machine :

```
$ curl http://testmynids.org/uid/index.html
```

And then check fast.log and / or eve.json file :

```
defender@dockerhost:~/docker-suricata/docker-compose/logs $ tail -f fast.log
defender@dockerhost:~/docker-suricata/docker-compose/logs $ grep \"event_type\":\"alert\" eve.json
```
