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
