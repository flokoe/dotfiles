# Florian's dotfiles
These are just my personal dotfiles which I am using at work and on my personal machines.  
The dotfiles are used on Linux especially Debian, but they should work on most other Operating Systems.  
Nevertheless be carefull.  
If you have any tips, tricks or suggestions I would appreciate them.  
Now feel free to explore, learn and/or use it for your own dotfiles. Enjoy :)
## Features
Every application has its own directory with its dotfiles/configuration. Do not hesitate to examine the files they are well documented.
* Configuration for the terminal-emulator terminator: [terminator/.config/terminator/config](terminator/.config/terminator/config)
* Custom configureation for the terminal-emulator urxvt: [urxvt/.Xresource-urxvt](urxvt/.Xresource-urxvt)

## Installation
**Warning:** If you want to use my dotfiles or part of them I reccomend you just copy what you need because sometimes I will brake some of the code. Furthermore you should always review and check the code you use. Do not blindly use my settings unless you know what you do. Use at your own risk and with caution!

If you want to use the repo anyway, that's how it works:

To link the repo files to the correct location I have decided to use [GNU Stow](https://www.gnu.org/software/stow/) because it is easy to use (It does not overwrite possible existing files) and install and has no big dependencies. So first you have to install stow. This is easily done with the package manager of your distro. For example in debian (you need to be root or use sudo):
```
apt-get install stow
```
Now you can clone this repository as your normal user **in your home directory**:  
```
cd ~
git clone https://github.com/flokoe/dotfiles.git
```
**Info:** It is possible to clone the repo to other locations, but to clone in your home directory is the easiest solution. For more information please consider the man page of stow.


After the cloning is finished you can install the files you want. For example you only want to install the configuration files for urxvt:
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
The `-R` option automatically deletes all old symlinks and creates new ones so that all files have proper and working links.
## Deprecations
At this moment there is nothing deprecated.
## Inspiration
No inspiration yet.
## License
Copyright (c) 2017 "flokoe" Florian Köhler  
The code is available under the [MIT license](LICENSE).
