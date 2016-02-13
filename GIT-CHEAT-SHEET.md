# Git Cheat Sheet
===========

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

Standard git command: `git push <remote> --delete <branch name>`.
You need next delete local branch.

Git-extras command: `git delete-branch <branch name>`.
This will delete local and remote branches.
