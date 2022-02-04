## Build image

```
$ sudo docker build -t suricata:v5 .
```

## Run container
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

```
$ sudo docker-compose up -d
```

docker-compose.yaml
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
