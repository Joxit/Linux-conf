# Linux-conf

There are in this repository all important configurations and shell used on my debian machines.

## /bin

Contains all useful scripts.

### Bash Completion

Update your `~/.bash_completion` file and add

```bash
_ssh()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(grep '^Host' ~/.ssh/config ~/.ssh/config.d/* 2>/dev/null | grep -v '[?*]' | cut -d ' ' -f 2-)

    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}

# Support completion for domains in /etc/host and ~/.ssh/config
complete -A hostname -F _ssh port-forward
```

### git-change-name

Change the name and email of committers and authors who have the provided name for a whole git repository project. 

```sh
git-change-name [Old_Name] [Correct_Name] [Correct_Email]
```

### git-change-mail

Change the name and email of committers and authors who have the provided mail for a whole git repository project. 

```sh
git-change-mail [Old_Email] [Correct_Name] [New_Email]
```

### git-change-commit

Change the message of the specified commit.

```sh
git-change-commit [Commit ID] [Commit Message]
```

### git-change

Change the name and/or email for all commits. You can choose only one between
old name and old email.

```sh
git-change [--old-name=OLD_NAME] [--old-email=OLD_EMAIL] \
	[--name=NEW_NAME] [--email=NEW_EMAIL]
```

### git-export

Export your HEAD into a tgz file. The file name will be the SHA1 of the commit.

### docker-clean

Clean your docker images and containers.

```sh
# Remove dangling images
docker-clean images
# Remove all tag for these images with their containers
docker-clean images -r image1 image2...
```

```sh
# Delete all containers for a list of images
docker-clean containers image1 image2
```

```sh
# Delete all images from a namespace
docker-clean repositories namespace
```

### port-forward

Forward your local port to remote destination, can support docker containers.

### sort-file

Sort your files by date (useful for images or documents).
Run the script in your folder :

    images
    ├── DSC_0000.JPG (created in 2016 08)
    ├── DSC_0001.JPG (created in 2016 08)
    ├── DSC_0002.JPG (created in 2016 08)
    ├── DSC_0003.JPG (created in 2016 08)
    ├── DSC_0004.JPG (created in 2016 09)
    ├── DSC_0005.JPG (created in 2016 09)
    └── DSC_0006.JPG (created in 2016 09)

The result will be :

    images
    ├── 2016.08
    │   ├── DSC_0000.JPG
    │   ├── DSC_0001.JPG
    │   ├── DSC_0002.JPG
    │   └── DSC_0003.JPG
    └── 2016.09
        ├── DSC_0004.JPG
        ├── DSC_0005.JPG
        └── DSC_0006.JPG
