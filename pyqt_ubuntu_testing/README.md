# Docker, Ubuntu, PyQT, VNC + SSH

## What's in ?

Dockerfile with Ubuntu image and necessary libraries needed to run PyQT based software. Applications with GUI can be run by connection through VNC or SSH (with "-X" flag).

## How to run it ?

Run docker container, mapping the ports:

```
docker run --rm -p 15022:22 -p 15901:5901 -it grzanka/pyqt_ubuntu_testing
```

You can use SSH to connect to docker:

```
ssh -X test@127.0.0.1 -p 15022
```

or VNC client to connect to 127.0.0.1:15901.

Inside docker container navigate to `/home/test/git/` and run hello world PyQT app:

```
cd ~/git/
python3 pyqt5-tutorial/_examples/helloworld.py
```
