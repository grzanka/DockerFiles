# Docker, Ubuntu, Flair, Fluka

## What's in ?

Dockerfile with Ubuntu image and necessary libraries needed to run Flair.

## How to run it ?

Run docker container, mapping the ports:

```
docker run --rm -p 15022:22 -p 15901:5901 -it grzanka/flair_fluka_ubuntu_
```

You can use SSH to connect to docker:

```
ssh -X test@127.0.0.1 -p 15022
```

or VNC client to connect to 127.0.0.1:15901.

Inside docker container navigate to `/home/test/fluka/` and run flair

```
cd ~/fluka/
```
