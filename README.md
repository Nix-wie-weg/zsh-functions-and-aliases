Nix-wie-weg.de Zsh functions and aliases
==========

Feel free to clone this repo and source this files in your dotfiles:

* [Git workflow helpers](git_workflow.zsh)
* [Bitbucket aliases](bitbucket.zsh)
* [Redmine URL](redmine.zsh)

Additionally you may define the following aliases:

Open URL from the terminal expanding aliases
---------

Open standard browser from prompt:

```bash
browse() { open $(eval ${1}) }
```

This allows for evaluation of aliases given as arguments to `browse`.

Shortcuts
---------
Feel free to bind personal aliases in whatever style you prefer (examples for prezto):

```bash
alias bbb='browse bitbucket_repo_url'
alias bbbr='browse bitbucket_review_url'
alias bred='browse redmine_url'
```
