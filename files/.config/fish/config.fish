# Colors
set -g fish_color_command green
set -g fish_color_user magenta
set -g fish_color_host yellow

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

  echo -n ':'

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  printf "%s " (fish_git_prompt)

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

# Virtualenv integration
set -x VIRTUALFISH_COMPAT_ALIASES "true"
#eval (python3 -m virtualfish)

if test -f $HOME/.config/fish/local.fish
    . $HOME/.config/fish/local.fish
end

