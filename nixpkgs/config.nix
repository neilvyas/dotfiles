{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "system-env";
      paths = [
        nix-repl

        git
        tmux
        ranger
        tree
        fish
        neovim

        zip
        unzip

        jq

        python
        python3
      ];
    };
  };
}
	
