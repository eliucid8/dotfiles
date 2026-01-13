# dotfiles
files with a dot at the beginning for eric

This repo now uses the GNU stow naming scheme:
~/dotfiles/nvim/.config/nvim/ --`stow nvim`--> ~/.config/nvim/
All config files are now neatly symlinked without me having to google the `ln` syntax

## bashrc
would caution against drag-and-drop replacement of the default `.bashrc`
but you should be able to add the snippet that sources everything in `.bashrc.d`

## TODO
make the install scripts distro-agnostic?
nvim is downloaded into the dotfiles folder?
