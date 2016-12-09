# Get the corresponding ticket URL for the current branch:
alias redmine_url='echo http://redmine.nwwo.de/issues/$(branch_current | grep -oh "^[0-9]\+")'
