# Florian's dotfiles
These are just my personal dotfiles which I am using at work and on my personal machines.  
The dotfiles are used on Linux especially Debian, but they should work on most other Operating Systems.  
Nevertheless be carefull.  
If you have any tips, tricks or suggestions I would appreciate them.  
Now feel free to explore, learn and/or use it for your own dotfiles. Enjoy :)
## Features
Every application has its own directory with its dotfiles/configuration. Do not hesitate to examine the files they are well documented.
* Custom configureation for the terminal-emulator urxvt: [urxvt/.Xresource](urxvt/.Xresource)

## Installation
**Warning:** If you want to use my dotfiles or part of them I reccomend you just copy what you need because sometimes I will brake some of the code. Furthermore you should always review and check the code you use. Do not blindly use my settings unless you know what you do. Use at your own risk and with caution!

If you want to use the repo anyway that's how it works:

To link the repo files to the correct location I have decided to use stow because it is easy to use and install and has no big dependencies. So first you have to install stow. This is easily done with the package manager of your distro. For Example in debian (you need to be root or use sudo):  

`apt-get install stow`

Now you can clone this repository **in your home directory**:  

`git clone https://github.com/flokoe/dotfiles.git`

After the cloning is finisched you can install the files you want. For example you only want to install the configuration files for urxvt:
```
cd ~/dotfiles/
stow urxvt
```
Stow now creates symlinks in your home directory to the neccessary files in `~/dotfiles/urxvt`.
## Deprecations
At this moment there is nothing deprecated.
## Inspiration
No inspiration yet.
## License
Copyright (c) 2017 "flokoe" Florian Köhler  
The code is available under the [MIT license](LICENSE).
