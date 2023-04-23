#install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

#source nix
 . ~/.nix-profile/etc/profile.d/nix.sh

#install nix packages

nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.neovim \
	nixpkgs.packer \
	nixpkgs.git \
	nixpkgs.bat \
	nixpkgs.fzf \
	nixpkgs.antibody \
	nixpkgs.mc \
    nixpkgs.python3Full \
	nixpkgs.stow \
    nixpkgs.spaceship-prompt \
	nixpkgs.ripgrep

#add zsh to valid shells
command -v zsh | sudo tee -a /etc/shells

#make zsh default shell for user
#if PAM problems, sudo nano /etc/pam.d/chsh and comment out "accounts with special shells from changing them. auth       sufficient   pam_shells.so
sudo chsh -s $(which zsh) $USER

#load antibody plugins
antibody bundle < ~/.zsh_plugins.txt

#stow .dotfiles
stow zsh
stow nvim
stow mc

source .zshrc

