export ZSH="/home/ujon/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias zshrc="vim ~/.zshrc"

# Program
alias google="google-chrome & disown"

# Shortcut
alias lll="ls -al"
alias ll="ls -l"
alias cc="clear"
alias nn="netstat -nlpt" #required: net-tools

# Site
# required: ssh, sshpass
function ujon() {
        internal_network_name=$1
        
	sshpw=""
        user=""
        ip=""
        
	case $internal_network_name in
                dev)
                        sshpw="___"
                        user="___"
                        ip="127.0.0.1"
                        ;;
        esac
        sshpass -p $sshpw ssh -o StrictHostKeyChecking=no $user@$ip
}


