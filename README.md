# Lxde-vnc

This image contains a vnc server and some useful program. It can be used to have a distant graphical environment.


# Contained programs

  - curl
  - firefox
  - gedit
  - git
  - meld
  - pgp
  - terminator
  - transmission
  - vim
  - vlc
  - wget


# Usage

To create a container, you have only to map the TCP port `5901` (vnc protocol) :
```bash
$ docker run -d -p 5901:5901 --name lxdevnc overware/lxde-vnc
```

The default password is `rootpwd` it's contain into `src/pwd.txt` file.


# Build

To build this image use make :
```bash
$ make
```

To try to run this container use :
```bash
$ make run
```

And to clean all (container and image), use :
```bash
$ make clean
```
