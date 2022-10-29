FROM gcc:latest 
RUN apt-get -y update && apt-get install -y fortunes git cmake libev-dev iproute2 net-tools kmod
COPY mys.sh ./