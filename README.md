Nix-wie-weg.de Zsh functions and aliases
==========

Open standard browser from prompt:

```bash
browse() { open $(eval ${1}) }
```

This allows for evaluation of aliases given as arguments to `browse`.

Working with git
----------------
Get the name of the currently checked out branch:
```bash
alias branch_current='git rev-parse --abbrev-ref HEAD'
```

Get the base commit for the current branch (the commit after which your branch divides from master):
```bash
alias branch_oldest_ancestor='/usr/bin/diff -u <(git rev-list --first-parent master) <(git rev-list --first-parent HEAD) | sed -ne "s/^ //p" | head -1'
```

Get all commits in your current branch:
```bash
alias branch_log='git log $(branch_oldest_ancestor)..HEAD'
```

Get all changes in your current branch:
```bash
alias branch_diff='git diff $(branch_oldest_ancestor)..HEAD'
```

Get all changed still existing files in your current branch:
```bash
alias branch_files='git diff $(branch_oldest_ancestor)..HEAD --diff-filter=ACMR --name-only --oneline'
```

Bitbucket
---------

Get an URL to your hosted repo:
```bash
alias bitbucket_repo_url='echo https://$(git remote -v | grep -oh "bitbucket.org[:/][^ ]\+.git" | head -1 | sed "s/:/\//" | sed "s/\.git$//")'
```

Get an URL to a full diff for your branch (like `branch_diff` but on the web):
```bash
alias bitbucket_review_url='echo $(bitbucket_repo_url)/branches/compare/$(branch_current)..$(branch_oldest_ancestor)'
```

Ticket system
-------------

Get the corresponding ticket URL for the current branch:
```bash
alias redmine_url='echo http://redmine.nwwo.de/issues/$(branch_current | grep -oh "^[0-9]\+")'
```

Rubocop
-------

Check all changed files in your current branch with rubocop:
```bash
alias branch_rubocop="branch_files | grep '\.rb$' | xargs rubocop"
```

Shortcuts
---------
Feel free to bind personal aliases in whatever style you prefer (examples for prezto):
```bash
alias bbb='browse bitbucket_repo_url'
alias bbbr='browse bitbucket_review_url'
alias bred='browse redmine_url'
```
