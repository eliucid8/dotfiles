alias quit='exit'

alias rebash='source ~/.bashrc'
alias retmux='tmux source ~/.config/tmux/tmux.conf'

alias edit-aliases="nvim ~/.bashrc.d/aliases.sh"

# Navigation
alias ..='cd ..'

# some more ls aliases
alias ll='ls -alF'
alias lh='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# cdw: cd to a windows directory
cdw() { local d=`wslpath "$1"`; cd "$d"; }

cdc() {
    DIRECTORY="${1:-/Users/erict}"   # Default relative to C:\
    TARGET="/mnt/c${DIRECTORY}"
    echo "$TARGET"
    cd /mnt/c/"$DIRECTORY"
}

# git aliases
alias ga="git add . --all"  
alias gb="git branch"  
alias gci="git commit -a"  
alias gco="git checkout"  
alias gd="git diff ':!*lock'"  
alias gdf="git diff"  
alias gds="git diff --staged"  
alias gl="git log"  
alias gs="git status"  
alias glg="git log --graph"  
alias grb="git_rebase_all_in_branch"  
alias gpr="git pull --rebase"  
alias gca="git commit --amend --all --no-edit --date=now"  
alias gcm="git checkout main"  
alias gpo="git push origin"  
alias gpf="git push --force-with-lease"  
alias gpoo="git_push_upstream_origin"  
alias gprom='git pull --rebase origin main'

function gsw {  
    BRANCH="${1:--}"  
    git switch $BRANCH  
}

function git_push_upstream_origin() {  
    branch_name=`git rev-parse --abbrev-ref HEAD`  
        git push --set-upstream origin $branch_name  
}

function git_rebase_all_in_branch() {  
    branch_name=$(git branch --show-current)  
        trunk_name=$(git symbolic-ref --short refs/remotes/origin/HEAD)  
        base_hash=$(git merge-base $branch_name $trunk_name)  
        git rebase -i $base_hash $branch_name  
}

# other tool aliases
alias fd='fdfind'

# classes
alias cs310='cd ~/classes/cs310/xv6/  docker run -it --rm --user 0:0 -v $PWD:/home/student/labs mlentz/os-env:amd64'
alias cs371='cd ~/classes/cs371; conda activate compsci371; jupyter lab'
