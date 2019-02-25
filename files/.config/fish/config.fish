# Colors
set -g fish_color_command green
set -g fish_color_user magenta
set -g fish_color_host yellow

# Master password
set -x MPW_FULLNAME "Piotr Betkier"

# Golang stuff
set -x GOPATH /Users/piotr.betkier/workspace/go
set -x PATH $PATH $GOPATH/bin

# Git prompt integration
set -g fish_prompt_git_status_git_dir '⚒'  
set -g fish_prompt_git_remote_space ' '
. $HOME/.config/fish/functions/__informative_git_prompt.fish

# Main prompt
function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  if set -q VIRTUAL_ENV
    echo -n -s (set_color blue) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end

  # User
  set_color $fish_color_user
  echo -n (whoami)
  set_color normal

  echo -n '@'

  # Host
  set_color $fish_color_host
  echo -n (hostname -s)
  set_color normal

  echo -n ':'

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  printf '%s ' (__informative_git_prompt)

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n '$ '
  
  set_color $fish_color_normal
end

# Time prompt
function fish_right_prompt -d "Write out the right prompt"
  set_color -o black
  echo (date +%R)
  set_color $fish_color_normal
end

# z and fzf integration under zz alias
function zz
    cd (z -l | fzf --height 40% --nth 2.. --reverse --inline-info --tac | awk '{print $2}')
end

# Virtualenv integration
set -x VIRTUALFISH_COMPAT_ALIASES "true"
eval (python3 -m virtualfish)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/opt/google-cloud-sdk/path.fish.inc'; else; . '/opt/google-cloud-sdk/path.fish.inc'; end; end

