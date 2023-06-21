export ZSH="/Users/ujon/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias zshrc="vim ~/.zshrc"

# Program
alias google="open -a 'Google Chrome'"
alias vscode="open -a 'Visual Studio Code'"

# Shortcut
alias ll="ls -l"
alias cc="clear"
alias nn="sudo lsof -PiTCP -sTCP:LISTEN"

function tt() {
    local maxdepth=2
    local directory=0
    local simple=0
    while getopts "m:d-:s-:" opt; do
        case $opt in
            m) maxdepth=$OPTARG ;;
            d) directory=1 ;;
            s) simple=1 ;;
            \?) echo "Invalid option: -$OPTARG" >&2 ;;
        esac
    done
    shift $((OPTIND-1))
    local findcmd="find . -maxdepth $maxdepth"
    if [[ $directory -eq 1 ]]; then findcmd="$findcmd -type d" fi
    if [[ $simple -eq 1 ]]; then findcmd="$findcmd -not -path '*/\.*'" fi
    eval "$findcmd" | sed -e "s/[^-][^\/]*\// │   /g" -e "s/│   \([^ ]\)/├── \1/"
}

function help() {
local macos_shortcuts="
\e]8;;https://support.apple.com/en-us/HT201236\aMacOS Shortcuts\e]8;;\a
Command + Shift + G                     Open a Go to Folder window
Command + Spacebar                      Show or hide the Spotlight search field
Command + Control + Spacebar            Show the Character Viewer
"

local chrome_shortcuts="
\e]8;;https://support.google.com/chrome/answer/157179\aChrome Shortcuts\e]8;;\a
Command + Shift + B                     Show or hide the Bookmarks Bar
"

echo "$macos_shortcuts"
echo "$chrome_shortcuts"
}

echo "$macos_shortcuts"
}

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
