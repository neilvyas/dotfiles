dotfiles
========

Editor: `neovim`

I put a few hours into my neovim configuration. In particular, I started from scratch and configured:

- my autocomplete and snippet setup;  
  Now, I have  
  - autocomplete automatically on with a sane max-window-size
  - confirmation behavior that matches my expectations, i.e. tab-to-select, enter-to-insert

  And since I use deoplete, it's  
  - pretty quick
  - easy to add new sources, e.g. syntax files

  But I still want to figure out  
  - whether I want to re-introduce the default behavior of propagating <CR> on confirmation

- my unite/denite setup;  
  Now, I have  
  - a much better understanding of how to get the behavior I want
  - a much nicer version of a plugin I depend on (denite vs unite)

It's quite slow to startup, I assume because I initialize deoplete and stuff (not profiled), but that's
relatively acceptable, since I intend to use long-running editing sessions.


Workspace manager: `tmux`

My tmux is pretty bare and didn't change much. I still don't really use any tmux plugins.
I did resolve the `reattach-to-user-namespace` nonsense.


Shell: `fish`

Fish is so great! I moved over old aliases and some utility functions (there were surprisingly few).


Package manager: `nix`
This is a big one. I still don't understand `nix` that well so I'm working on making this whole thing
a `nix` package. I also still need `brew` around for some packages that are not available on `nix` yet.
I think this is fine because I want to use `nix` more for development than system configuration on a
mac.


This represents about a day and a half of work, and it was totally worth it.

Still to do:
- nix packaging!
- fix/deprecate `install.fish`
- figure out the tmux shell-startup issues
