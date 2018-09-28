# typical rsync options
# looks for filter options in .rsync_filter
rs () {
    if [ -e ".rsync_filter" ] ; then
        rsync -avh --no-p --no-g --no-o -e ssh \
            --filter='merge .rsync_filter' "$@"
    else
        rsync -avh --no-p --no-g --no-o -e ssh "$@"
    fi
}

# restore terminal theme after ssh
ssh () {
    command ssh "$@";
    $terminal_theme;
}

lsless () { ls -la --color $@ | less -R; }

# fuzzy cd
function cdf() {
    cd *$1*/
}

# less /w colors
less() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;38m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;0m\E[48;5;10m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;0;10m' \
    less "$@"
}

# man /w colors
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;38m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;0m\E[48;5;10m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;0;10m' \
    man "$@"
}

# start or kill ssh agent
agent() {
    if [ -z "$1" ]; then
        if [ -z "$SSH_AGENT_PID" ]; then
            echo "Opening agent."
            eval $(ssh-agent -t 2h)
            ssh-add
        else
            echo "Agent already open."
        fi
    elif [ "$1" = "k" ]; then
        echo "Killing agent."
        # Remove identities from agent
        ssh-add -D

        # Kill the current agent
        eval $(ssh-agent -k)
    fi
}

# terminal matlab options
function ml() {
    local matlab_command="addpath('$matlab_path');"
    matlab_command+="startup;"
    env DISPLAY="" matlab -nodesktop -nosplash -r "$matlab_command"
}

# set window title
function settitle() {
    echo -ne "\e]0;$1\a"
}

# mount ISO
function isomount() {
    sudo mount -t iso9660 -o loop "$@" # last two args: src_iso dst_dir
}
