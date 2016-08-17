# Daemon configuration

## Docker Configuration

Default docker configuration file : `/etc/default/docker`

Usefull link : https://docs.docker.com/engine/admin/systemd/

### Add http_proxy to docker

Create a file called /etc/systemd/system/docker.service.d/http-proxy.conf that adds the HTTP_PROXY environment variable:
```
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:80/"
```

Flush changes, check and restart:

```
$ sudo systemctl daemon-reload
$ systemctl show --property=Environment docker
Environment=HTTP_PROXY=http://proxy.example.com:80/
$ sudo systemctl restart docker
```

