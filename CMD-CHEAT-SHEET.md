# Cmd cheat sheet
=====

## Random

Getting a random number :

```sh
shuf -i MIN-MAX -n COUNT
```

Getting a random base64 string :

```sh
date +%s | sha256sum | base64 | head -c LENGTH
# or
< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c LENGTH
# or
openssl rand -base64 LENGTH
```

## Daemon

Managing services :

```sh
service NAME restart|start|stop|status
# or 
systemctl restart|start|stop|status NAME
```

Update start :
```sh
update-rc.d NAME defaults|disable|enable
# or
systemctl disable|enable|reenable NAME
```
Services conf directories :
`/etc/default/` and `/etc/systemd/` (see `system/multi-user.target.wants/`)

Reload conf files for a daemon :

```sh
systemctl daemon-reload NAME
```
