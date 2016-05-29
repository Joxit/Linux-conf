# Git Cheat Sheet

I will present you some cool command with git.
Some commands come from [git-extras](https://github.com/tj/git-extras)
(package on debian or on github).

## Remove file changes

Standard git command: `git checkout <commit|HEAD> -- <file>`.

Git-extras command: `git reset-file <file> [commit]`.
By default reset to HEAD.

## Archive your repository

Standard git command: `git archive -o <output> HEAD`.

Git-extras command: `git archive-file`.
File output is `<repo name>.<sha1>.zip`.

## Delete a remote branch

Standard git command: `git push <remote> --delete <branch name>` or `git push origin :<branch name>`.
You need next delete local branch.

Git-extras command: `git delete-branch <branch name>`.
This will delete local and remote branches.

## Undo latest commit

This will juste remove commits and not changes.
Your changes will be in index if you use --soft and deleted if --hard.

Standard git command: `git reset --soft [HEAD^|HEAD~number of commit to remove]`.

Git-extras command: `git undo [--hard|--soft] [number of commit to remove]`

## Basics

### Create a repository

1. `git init`
2. `git add <your file> && git commit -m 'Initial commit'`
3. `git remote add origin <your remote url>`
4. `git push -u origin master`

### Push a branch

Push a `l` local branch to a `r` remote branch: `git push origin l:r`

Push a `b` local branch to a `b` remote branch: `git push origin b`

### Rebase a branch

Your HEAD is not in fast-forward with your `b` remote branch. You got two choices :

1. `git pull --rebase origin b`
2. `git fetch && git rebase origin b`
