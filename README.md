<h1 align="center">
Docker Hashcat
</h1>

Hashcat wrapper made for containerized cracking.

- Currently supported config directives (see `Dockerfile` and `launcher.sh`):
    - `potfile-path`
    - `restorefile-path`
    - `workload-profile`
    - `optimized-kernel`

## Install

- `git clone https://github.com/JakeWnuk/Docker-Hashcat && cd ./Docker-Hashcat`
- Install `nvidia-docker2` to allow the `gpu` Docker flag.
```
sudo apt update && sudo apt install -y nvidia-docker2
```
- Install `nvidia-container-toolkit`
    - [Please refer to the official documentation.](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
- Build and test image.
    - `docker build . -t dk-hc`
    - `docker run --network=host --rm -it --gpus all -v $PWD:/data dk-hc -m 0 -b`
