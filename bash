#list
alias ll='ls -lhG'
alias la='ls -lhA'
alias ls='ls -G'
function filetree(){ ls -R $@  | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'; }

#git command
alias gc='git commit -am'
alias gp='git push origin master'
alias gl='git log --oneline --abbrev-commit --all --graph --decorate --color'

#restart utility
alias restart-menu='killall -KILL SystemUIServer'
alias restart-dock='killall -KILL Dock'
alias restart-finder='killall -KILL Finder'
alias restart-mac='sudo shutdown -r now'
function restart-program(){ pkill -9 $@ && open -a $@; }
