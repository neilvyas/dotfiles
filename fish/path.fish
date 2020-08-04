# Path additions
# Do this in one expression; calling set multiple times in a loop can cause
# performance issues resulting in slow startup.
set -gx PATH \
"$HOME/.cargo/bin" "$HOME/nvimbin" \
  # for pyenv-init
"/Users/neilvyas/.pyenv/bin" \
  # for pyenv-virtualenv init
"/Users/neilvyas/.pyenv/plugins/pyenv-virtualenv/shims" \
 $PATH
