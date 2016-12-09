# Get an URL to your hosted repo:
alias bitbucket_repo_url='echo https://$(git remote -v | grep -oh "bitbucket.org[:/][^ ]\+.git" | head -1 | sed "s/:/\//" | sed "s/\.git$//")'

# Get an URL to a full diff for your branch (like `branch_diff` but on the web):
alias bitbucket_review_url='echo $(bitbucket_repo_url)/branches/compare/$(branch_current)..$(branch_oldest_ancestor)'
