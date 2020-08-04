# This is the output from (pyenv init -) but
#  1. the path addition is made in path.fish
#  2. the "pyenv rehash" is omitted
# for performance reasons.
set -gx PYENV_SHELL fish
source '/Users/neilvyas/.pyenv/libexec/../completions/pyenv.fish'
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case activate deactivate rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end

# similarly for pyenv virtualenv-init -
set -gx PYENV_VIRTUALENV_INIT 1;
# This is v slow and doesn't seem particularly useful.
# function _pyenv_virtualenv_hook --on-event fish_prompt;
#   set -l ret $status
#   if [ -n "$VIRTUAL_ENV" ]
#     pyenv activate --quiet; or pyenv deactivate --quiet; or true
#   else
#     pyenv activate --quiet; or true
#   end
#   return $ret
# end

if not functions -q _old_fish_prompt
  functions -c fish_prompt _old_fish_prompt
end

function fish_prompt
  if set -q VIRTUAL_ENV
    echo -n -s (set_color cyan) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end
  _old_fish_prompt
end
