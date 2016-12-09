# Get the name of the currently checked out branch:
alias branch_current='git rev-parse --abbrev-ref HEAD'

# Get the base commit for the current branch (the commit after which your branch divides from master):
alias branch_oldest_ancestor='/usr/bin/diff -u <(git rev-list --first-parent master) <(git rev-list --first-parent HEAD) | sed -ne "s/^ //p" | head -1'

# Get all commits in your current branch:
alias branch_log='git log $(branch_oldest_ancestor)..HEAD'

# Get all changes in your current branch:
alias branch_diff='git diff $(branch_oldest_ancestor)..HEAD'

# Get all changed still existing files in your current branch:
alias branch_files='git diff $(branch_oldest_ancestor)..HEAD --diff-filter=ACMR --name-only --oneline'

# Lint all changed files in your current branch with rubocop:
alias branch_rubocop='branch_files | grep  "\.\(rb\|gemspec\)$" | xargs rubocop'

# Get the last commit sha:
alias branch_last_sha = 'git show | head -n 1 | cut -d " " -f 2'
