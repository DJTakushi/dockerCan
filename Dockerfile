FROM gcc:latest 
RUN apt-get -y update && apt-get install -y fortunes git cmake libev-dev iproute2 net-tools kmod 

# needed to build kernel
RUN apt-get install -y flex bison bc
#RUN apt install -y binutils flex bison util-linux kmod e2fsprogs jfsutils reiserfsprogs xfsprogs squashfs-tools btrfs-progs pcmciautils quota ppp nfs-kernel-server procps oprofile udev grub mcelog iptables openssl libcrypto bc
RUN apt install -y build-essential flex bison dwarves libssl-dev libelf-dev

COPY mys.sh ./

RUN git clone https://github.com/microsoft/WSL2-Linux-Kernel
