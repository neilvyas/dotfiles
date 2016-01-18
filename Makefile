all:
	vim
	music
	ranger
	zsh
	tmux

music:
	#mpd configuration
	if [ -d "$$HOME/.mpd" ]; then \
		ln -f mpd.conf ~/.mpd/mpd.conf; \
	else \
	  echo "mpd is not installed! install and make ~/.mpd."; \
	fi; 
	#vimus configuration
	ln -f .vimusrc ~/.vimusrc

ranger:
	if [ -d "$$HOME/.config/ranger" ]; then \
		ln -f rifle.conf ~/.config/ranger/rifle.conf; \
		ln -f rc.conf ~/.config/ranger/rc.conf; \
	else \
		echo "No ~/.config/ranger! is ranger installed?"; \
	fi

vim:
	ln -s .vim ~/.vim

zsh:
	ln -s .zshrc ~/.zshrc
	ln -s .zshenv ~/.zshenv
	#for holding machine-level environment variables.
	ln -s paths.sh ~/paths.sh

tmux:
	ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/dotfiles/.gruvbox_dark_tmux.conf ~/.gruvbox_dark_tmux.conf
	ln -s ~/dotfiles/.solarized_light_tmux.conf ~/.solarized_light_tmux.conf
