# Flo's dotfiles

These are just my Linux dotfiles which I am using at work with focus on Administration / DevOps / NodeJS / Javascript. Managed with [GNU Stow](https://www.gnu.org/software/stow/). Feel free to use or get inspired, but as always take care of the dragon! (Just be carefull and know what the fuck you do ;-) ).

## Install

```bash
sudo apt install git stow && \
git clone git@github.com:flokoe/dotfiles.git ~/.dotfiles && \
cd  ~/.dotfiles && stow -t ~ stow
```

## Usage

tbd

<!-- After the cloning is finished you can install the files you want. For example you only want to install the configuration files for urxvt:
```
cd ~/dotfiles/
stow urxvt/
```
Stow now creates symlinks in your home directory to the neccessary files in `~/dotfiles/urxvt`.
### Uninstallation
If you don't want to use certain dotfiles/configuration anymore you can simply uninstall them with stow:
```
cd ~/dotfiles/
stow -D urxvt/
```
The option `-D` is equivalent to `--delete` and removes every symlink from your home directory pointing in the specified directory.
### Reinstallation
If the repository gets updated and the files/directories change you can simply reinstall the changed files:
```
cd ~/dotfiles/
stow -R urxvt/
```
The `-R` option automatically deletes all old symlinks and creates new ones so that all files have proper and working links. -->

## Inspiration

tbd

<!-- andschwa's dotfiles https://github.com/andschwa/dotfiles  
xero's dotfiles https://github.com/xero/dotfiles  
ashishb's dotfiles https://github.com/ashishb/dotfiles/  
square's dotfiles https://github.com/square/maximum-awesome -->

## License

This repository is available under the [MIT license](LICENSE).
