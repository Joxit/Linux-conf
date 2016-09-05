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

## Reads and writes data across network connections

### Netcat as server

You can use this command for communicate over TCP with an host.

```sh
nc -l -p port
```

### Netcat as client

nc is similar to telnet.

```sh
nc host port
```

Create an HTTP request: `GET /index.html HTTP/1.0`

### Write to file over ssh

```sh
cat /file/to/read | ssh login@host 'tee /file/to/write' >/dev/null
```

### Write to file over nc

This can be an alternative to ssh/scp (without login/password).

On the remote server use :

```sh
nc -l p port > /file/to/write
```

On the current computer :

```sh
nc -c 'cat /file/to/read' host port
```

## Cheat-sheet on tr

### Remove newline of a file

```sh
cat file | tr '\n' ' '
```

### To lower/upper-case

To upper case example:

```sh
cat file | tr '[:lower:]' '[:upper:]'
```

To lower case example:

```sh
cat file | tr '[:upper:]' '[:lower:]'
```

## Set file capabilities

### Bind a socket to Internet domain privileged ports

```sh
setcap "cap_net_bind_service=+ep" /path/to/executable
```

### Use RAW and PACKET sockets

```sh
setcap "cap_net_raw+ep" /usr/bin/iftop
```

### Perform various network-related operations

```sh
 setcap "cap_net_admin+ep" /path/to/executable
```
