<h1 align="center">
DK-HC
</h1>

Golang Hashcat wrapper made for containerized cracking. Accepts configuration
file and other customizations to make deploying to mutli-machine environments
easier. 

## Getting Started

- [Configuration](#Configuration)
- [Usage](#Usage)
- [Install](#Install)

## Configuration

- Customize the arguments in the `config.json` file to control defaults that
  are passed to `hashcat`.
- Copy all files into the `files` directory in the same folder as the
  `Dockerfile`. These will be saved to the container.
- Currently supported config directives:
    - `potfile-path`
    - `restorefile-path`
    - `workload-profile`
    - `bitmap-max`
    - `optimized-kernel`

## Usage

- The default working directory is `/data` which you can mount to `$PWD`.
- Files will be stored in `/files` and can be referenced as
  `/files/wordlist.txt` in commands.
- The Golang binary expects two arguments:
    - The hash mode 
    - The hashcat command
    - `dk-hc 100 -a0 hash.lst cwd-wordlist.txt -r /files/stored.rule
      --loopback`
- All other directives provided in the configuation file will be passed to the
  end of the command.
- By default potfiles and restore files are named by algorithm and placed in the `/data`
  directory.
- To restore a session you can use `dk-hc 100 --restore --session=100`

## Install

- `git clone`
- Install `nvidia-docker2` to allow the `gpu` docker flag. A script has been
  created in `install` but please refer to the offical documentation.
- Build and test image.
    - `docker build . -t dk-hc`
    - `docker run --network=host --rm -it --gpus all -v $PWD:/data dk-hc 0 -b`
- Create `/files` directory if one does not exist.