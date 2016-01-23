# Linux-conf

There are in this repository all important configurations and shell used on my debian machines.

## root/bin

Contains all root shells such as distribution / service update.

## home/joxit/bin

Contains all user usefull shells.

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
git-change-commit [Commit ID] [Commit Message]"
```
### git-change

Change the name and/or email for all commits. You can choose only one between
old name and old email.

```sh
git-change [--old-name=OLD_NAME] [--old-email=OLD_EMAIL] \
	[--name=NEW_NAME] [--email=NEW_EMAIL]"
```

## Gedit modules (GTKSourceView)

In usr/share/gtksourceview-3.0/language-specs folder, there are my modules for gedit highlight.
For now, only **Dockerfile** and **CartoCSS** highlight are available.
