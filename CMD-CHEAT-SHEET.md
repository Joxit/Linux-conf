# Cmd cheat sheet

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

## File stat

Get some file stats :

```sh
stat -c %y FILE # time of last data modification, iso format

stat -f -c %s FILE # total size, in bytes
# or
du -sk FILE # total size, in kilo-bytes, calculate directories
```

## Weather

```sh
curl http://wttr.in/moon
```

## OS information

Os version : `cat /etc/os-release`

Debian version : `cat /etc/debian_version`

Kernel version : `uname -a`

## Markdown to pdf

```sh
pandoc -s input.md --latex-engine=xelatex -f markdown_github  -V geometry:margin=1in -o output.pdf
```

## SVG converter

```sh
rsvg-convert -a -w [size] -f svg input.svg -o output.svg
```

## Write to file over ssh

```sh
cat file | ssh login@host 'tee /path/to/write' >/dev/null
```
