# Sample config

set -g fish_color_command green
set -g fish_color_user magenta
set -g fish_color_host yellow
set -g fish_prompt_git_status_git_dir '⚒'  
set -g fish_prompt_git_remote_space ' '

setenv EDITOR vim
set -U EDITOR vim

set PATH $PATH /opt/jdk/bin
set PATH $PATH /opt/gradle/bin
set PATH $PATH /opt/node/bin

set MAVEN_OPTS "-Xmx512m -XX:MaxPermSize=128m"

. $HOME/.config/fish/informative_git_prompt.fish

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

function fish_right_prompt -d "Write out the right prompt"

  # Time
  set_color -o black
  echo (date +%R)
  set_color $fish_color_normal

end

set -x VIRTUALFISH_COMPAT_ALIASES "true"
. ~/configs/fish/virtualfish/virtual.fish
. ~/configs/fish/virtualfish/global_requirements.fish
