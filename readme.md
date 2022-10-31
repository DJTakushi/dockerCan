# About

# 1.0 Getting Started
### 1.1 Build Docker container
```
docker build . -t dc
```

### 1.2 Run docker container
```
docker run -it -v C:\Users\okina\dockerCan:/mnt/c/Users/okina dc /bin/bash
```

### 1.3 Install dependencies
Run `/kbi.sh` (kernel-build-installs)

### 1.4 Build the latest kernel with can support
See https://github.com/microsoft/WSL/issues/5533 
```
git clone https://github.com/microsoft/WSL2-Linux-Kernel
cd WSL2-Linux-Kernel
git checkout `uname -r` # I'm just using the latest release of the `microsoct/WSL2-Linux-Kernel`
cat /proc/config.gz | gunzip > .config
make prepare modules_prepare
make menuconfig  # select vcan and can here
make modules
make modules_install

# Per ak-aptiv
make -j $(nproc)
sudo make install

# Then copy the kernel to Windows:
cp vmlinux /mnt/c/Users/<yourwindowsloginname>/

# Create .wslconfig file:
vim /mnt/c/Users/<yourwindowsloginname>/.wslconfig
# with the content:
[wsl2] kernel=C:\\Users\\<yourwindowsloginname>\\vmlinux

# and finally restart your WSL:
exit
wsl --shutdown
wsl

modprobe vcan
ip link add dev vcan0 type vcan
ip link set up vcan0
apt install can-utils
```

# Notes
- building kernel inside docker may be futile
  - look at https://blog.dan.drown.org/replacing-the-wsl-kernel/ for updating kernel on Windows
- Update to latest WSL2 with this procedure: https://superuser.com/questions/1709437/how-can-i-update-the-kernel-in-wsl2-kernel-to-latest-release
- had dsuccess running `modprobe vcan` after I installed it inside the docker container
  - requried changing name from `[...]WSL2+` to  `[...]WSL2`  


### TODO 
[ ] Get notes on running with the correct flags
[ ] Get notes on potential leads
[ ] build all of the necessary stepsinto the dockerfile
    [ ] alternatively, install this version of WSL2 per per *jeremitu* and *ak-aptiv* 