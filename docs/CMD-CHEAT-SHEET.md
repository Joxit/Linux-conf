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

## Manage personal GPG keys

### Increase expiration date

List private keys first

```sh
gpg --list-secret-keys --keyid-format LONG
```
```
/home/user/.gnupg/pubring.kbx
------------------------------
sec   rsa4096/0123456789ABCDEF 2019-01-19 [SC] [expires: 2023-02-17]
      0123456789ABCDEF0123456789ABCDEF01234567
uid                [ expires ] User <user@example.com>
```

Now you can edit your key
```sh
gpg --edit-key 0123456789ABCDEF
```
```
gpg (GnuPG) 2.2.40; Copyright (C) 2022 g10 Code GmbH
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

sec  rsa4096/0123456789ABCDEF
     created : 2019-01-19  expires : 2023-02-17  utilisation : SC  
     confiance : ultime        validity : expires
ssb  rsa4096/FEDCBA9876543210
     created : 2019-01-19  expired : 2020-02-17  utilisation : E   
[ expires ] (1). User <user@example.com>

gpg>
```

This is a REPL, first edit the expiration date of the key
```text
gpg> expire
 
Changing expiration time for the primary key.
Please specify how long the key should be valid.
        0 = key does not expire
     <n>  = key expires in n days
     <n>w = key expires in n weeks
     <n>m = key expires in n months
     <n>y = key expires in n years
Key is valid for? (0) 2y
Key expires at Tue 17 Feb 2025 07:37:07 CET
Is this correct? (y/N) y

gpg>
```

Now you can edit the subkey expiration date
```
gpg> key 1
gpg> expire
 
Changing expiration time for the primary key.
Please specify how long the key should be valid.
        0 = key does not expire
     <n>  = key expires in n days
     <n>w = key expires in n weeks
     <n>m = key expires in n months
     <n>y = key expires in n years
Key is valid for? (0) 2y
Key expires at Tue 17 Feb 2025 07:38:09 CET
Is this correct? (y/N) y
```

Now you can save the new key

```
gpg> save
```