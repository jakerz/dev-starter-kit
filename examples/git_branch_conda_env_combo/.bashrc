SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval "$('/<path_to_miniconda>/miniconda3/Scripts/conda.exe' 'shell.bash' 'hook')"
eval "$('~/miniconda3/Scripts/conda.exe' 'shell.bash' 'hook')"
# <<< conda initialize <<<

# >>> Color Definitions >>>
GREEN="\[\033[38;5;155m\]"
DARK_GREEN="\[\033[00;32m\]"
GRAY="\[\033[38;5;8m\]"
ORANGE="\[\033[38;5;220m\]"
BLUE="\[\033[38;5;117m\]"
WHITE="\[\033[38;5;15m\]"
YELLOW="\[\033[01;33m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
VIOLET="\[\033[01;35m\]"
MAGENTA="\[\033[0;35m\]"
PINK="\[\033[38;5;13m\]"
LIGHT_BLUE="\[\033[38;5;87m\]"
YELLOW_GREEN="\[\033[38;5;118m\]"
GOLD="\[\033[38;5;3m\]"
RESET="\[$(tput sgr0)\]"
# <<< Color Definitions <<<

# >>> Git and Conda combined bash prompt >>>
function git_and_conda_prompt {
  local __git_branch_color="$DARK_GREEN"
  local __git_branch=$(__git_ps1 ' [%s]');
  # Pick color based on git branch state
  if [[ "${__git_branch}" =~ "*" ]]; then     # if repository is dirty
      __git_branch_color="$RED"
  elif [[ "${__git_branch}" =~ "$" ]]; then   # if there is something stashed
      __git_branch_color="$YELLOW"
  elif [[ "${__git_branch}" =~ "%" ]]; then   # if there are only untracked files
      __git_branch_color="$LIGHT_GRAY"
  elif [[ "${__git_branch}" =~ "+" ]]; then   # if there are staged files
      __git_branch_color="$CYAN"
  fi

# ${GOLD}${MSYSTEM}
  PS1="${ORANGE}${CONDA_PROMPT_MODIFIER}${YELLOW}\u${YELLOW}@${YELLOW_GREEN}\h:${CYAN}\w${RESET}$__git_branch_color$__git_branch${GRAY}\$${WHITE}${RESET} "
}
export PROMPT_COMMAND="git_and_conda_prompt"
# <<< Git and Conda bash prompt <<<

# >>> Aliases >>>
alias gs="git status"
alias gb="git branch"
alias gba="git branch --all"
alias gfa="git fetch --all"
alias gco="git checkout"
alias vlc="\c\Program Files\VideoLAN\VLC\vlc.exe"
alias ll='ls -l'
alias conda='conda.bat'
# <<< Aliases <<<

# Export path for Conda environments
export PATH=~/miniconda3/condabin:$PATH

# Customize the default git-bash directory on load
default_git_bash_open_path=/d/dev
if [[ $(pwd) = $HOME ]];
then cd $default_git_bash_open_path;
else cd "$(pwd)";
fi
