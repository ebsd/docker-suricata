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
