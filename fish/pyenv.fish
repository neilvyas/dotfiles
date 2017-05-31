set -x PATH "/Users/neilvyas/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

if not functions -q _old_fish_prompt
  functions -c fish_prompt _old_fish_prompt
end

function fish_prompt
  if set -q VIRTUAL_ENV
    echo -n -s (set_color cyan) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end
  _old_fish_prompt
end
