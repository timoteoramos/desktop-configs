if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]
then
  export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
fi

EDITOR=$EDITOR
HISTFILE=~/.zsh_history
HISTSIZE=1024
PATH=$HOME/.local/bin:$PATH
SAVEHIST=1024
VISUAL=$EDITOR
