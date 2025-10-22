# Terminal Prompt configuration

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Add git status to terminal prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

GREEN='\[\033[92;40m\]'
BLACK_GREEN='\[\033[30;102m\]'
BLUE_GREEN='\[\033[94;102m\]'
BLUE='\[\033[94;40m\]'
GREEN_BLUE='\[\033[92;104m\]'
BLACK_BLUE='\[\033[30;104m\]'
GREEN_YELLOW='\[\033[92;103m\]'
BLUE_YELLOW='\[\033[94;103m\]'
BLACK_YELLOW='\[\033[30;103m\]'
YELLOW='\[\033[93;40m\]'
RED='\[\033[91;40m\]'
BLACK_RED='\[\033[30;101m\]'
BLUE_RED='\[\033[94;101m\]'
RESET='\[\033[00m\]'

# Nerd font powerline symbols
LEFT_CIRCLE='\356\202\266'
RIGHT_CIRCLE='\356\202\264'
RIGHT_TRIANGLE='\356\202\260'
TRAPEZOIDS='\356\203\224'
PIXELATED='\356\203\206'
BRANCH_SYMBOL='\356\202\240'
LOWER_RIGHT_TRI='\356\202\272'
UPPER_LEFT_TRI='\356\202\274'
HONEYCOMB='\356\203\214'

# Box drawing symbols:
DOWN_RIGHT='\342\225\255'
UP_RIGHT='\342\225\260'
LIGHT_HORIZ='\342\224\200'

# Misc
ERROR_SYMBOL='\356\231\224'
FANCY_DOLLAR='\357\205\225'

build_prompt () {
    if [ "$color_prompt" = yes ]; then
        BASE_PS1="${debian_chroot:+($debian_chroot)}${BLACK_BLUE}\u@\h${BLUE_GREEN}${RIGHT_CIRCLE}${BLACK_GREEN}[\w]${RESET}"
    
        if [[ $1 -ne 0 ]]; then
            ERROR_STATUS="${RED}${LEFT_CIRCLE}${BLACK_RED}${ERROR_SYMBOL} $1${BLUE_RED}${LEFT_CIRCLE}${RESET}"
        else
            ERROR_STATUS="${BLUE}${LEFT_CIRCLE}"
        fi

        if [[ $(__git_ps1) ]]; then
            GIT_BRANCH="${GREEN_YELLOW}${RIGHT_TRIANGLE}${BLACK_YELLOW}${BRANCH_SYMBOL}\$(__git_ps1 '(%s)')${YELLOW}${UPPER_LEFT_TRI}${RESET}"
        else
            GIT_BRANCH="${GREEN}${RIGHT_TRIANGLE}${RESET}"
        fi

        ARROW_TOP="${BLUE}${DOWN_RIGHT}${LIGHT_HORIZ}${LIGHT_HORIZ}"
        ARROW_BOT="${BLUE}${UP_RIGHT}${LIGHT_HORIZ}${RESET}"
        echo $"${ARROW_TOP}${ERROR_STATUS}${BASE_PS1}${GIT_BRANCH}\n${ARROW_BOT}$ "
    else
        echo '${debian_chroot:+($debian_chroot)}\u@\h:\w $(parse_git_branch)$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        echo "\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
    esac

    return $1
}

function prompt_command {
    RET=$?
    export PS1=$(build_prompt $RET)
}
PROMPT_DIRTRIM=3
export PROMPT_COMMAND=prompt_command
