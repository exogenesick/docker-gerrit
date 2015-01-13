# Gerrit with LDAP auth as Docker container

## Build

After clone this repo simply run:

```bash
docker build -t 'yourname/docker-gerrit' .
```

After a while You should see new image on Your docker images list:

```bash
docker images
```

## Run prerequirements

This Gerrit image works with LDAP auth server. Cou can download LDAP docker image from here: https://registry.hub.docker.com/u/araszzz/sldap/

## Run

After that start Your image by:

```bash
docker run -d -p 127.0.0.1:80:8080 -p 127.0.0.1:29418:29418 -e "GERRIT_CANONICAL_WEB_URL=http://127.0.0.1" --link name_of_ldap_docker_container:ldap -v /path/to/git/repos:/gerrit_home/git exogenesick/gerrit:latest
```

## Conclusion

It will automatically start Gerrit instance with port expose to host machine.
To check this port simply check docker processes by:

```bash
docker ps
```

Then You should get something like this:

```bash
CONTAINER ID        IMAGE                   COMMAND                CREATED             STATUS              PORTS                                               NAMES
89e354e62567        yourname/docker-gerrit:latest   "/home/gerrit2/boot.   2 seconds ago       Up 1 seconds        0.0.0.0:49171->29418/tcp, 0.0.0.0:49172->8080/tcp   boring_morse
```

To access gerrit admin simply type into browser http://0.0.0.0:49172
