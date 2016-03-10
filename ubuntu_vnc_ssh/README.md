# Docker, Ubuntu, VNC + SSH

## What's in ?

Dockerfile with Ubuntu image, VNC and SSH.

## How to run it ?

Run docker container, mapping the ports:

```
docker run --rm -p 15022:22 -p 15901:5901 -it grzanka/ubuntu_vnc_ssh
```

You can use SSH to connect to docker (password: test):

```
ssh -X test@127.0.0.1 -p 15022
```

or VNC client to connect to 127.0.0.1:15901 (password: qwerty)
