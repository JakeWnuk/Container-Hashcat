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
- Install `Docker` and `git` through `apt`
```
sudo apt update && apt install -y docker.io git
```
- Clone the repo
```
git clone https://github.com/JakeWnuk/Docker-Hashcat && cd ./Docker-Hashcat
```
- Install `nvidia-docker2` and `nvidia-container-toolkit` to allow the `gpu` Docker flag.
```
sudo apt update && sudo apt install -y nvidia-docker2 nvidia-container-toolkit
```
>[!TIP]
> [Please refer to the official documentation.](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
- Download any drivers
```
sudo ubuntu-drivers install
```
>[!TIP]
> [Please refer to the official documentation.](https://ubuntu.com/server/docs/nvidia-drivers-installation)
- Build and test image.
    - `docker build . -t dk-hc`
    - `docker run --network=host --rm -it --gpus all -v $PWD:/data dk-hc -m 0 -b`
>![TIP]
> A restart may be needed to apply some changes. Another example is `sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi`.
