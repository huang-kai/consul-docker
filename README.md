# consul-docker

## Build

    sudo docker build -t kyne/consul:lastest .

## How to run
Run as a server:

    sudo docker run -d -h $HOSTNAME \
      -p 8300:8300 -p 8300:8300/udp \
      -p 8301:8301 -p 8301:8301/udp \
      -p 8302:8302 -p 8302:8302/udp \
      -p 8400:8400 -p 8500:8500 -p 53:53/udp \
      --name consul kyne/consul:lastest \
      -server -advertise 10.10.24.50 -bootstrap

Run as an agent

    sudo docker run -d -h $HOSTNAME \
      -p 8300:8300 -p 8300:8300/udp \
      -p 8301:8301 -p 8301:8301/udp \
      -p 8302:8302 -p 8302:8302/udp \
      -p 8400:8400 -p 8500:8500 -p 53:53/udp \
      --name consul kyne/consul:lastest \
      -advertise 10.10.55.188 -join 10.10.24.50
