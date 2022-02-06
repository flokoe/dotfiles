# Flo's dotfiles

These are just my Linux dotfiles which I am using at work with focus on Administration / DevOps / NodeJS / Javascript. Managed with [GNU Stow](https://www.gnu.org/software/stow/). Feel free to use or get inspired, but as always take care of the dragon! (Just be carefull and know what the fuck you do ;-) ).

https://tinyurl.com/ybp8juhs

## Features

- **`stow` and `git` powered:** symlink dotfiles and thus keep them always up-to-date in your repository
- **topical organization:** organize dotfiles by application facilitating reuse across different machines
- **clever naming scheme:** the repository architecture is easy to browse while staying compatible with stow symlinking mechanism
- **KISS:** there is deliberately none build script involved at all, the repository consist of dotfiles all installable using same modus operandi (`stow <directory>`)

## Install

```bash
sudo apt install git stow && \
git clone git@github.com:flokoe/dotfiles.git ~/.dotfiles && \
cd  ~/.dotfiles && stow -t ~ stow
```

## Usage

### Install packages

```bash
stow $PACKAGE_NAME
```

### Reinstall / Update packages

```bash
stow -R $PACKAGE_NAME
```

### Uninstall packages

```bash
stow -D $PACKAGE_NAME
```

## Rules

### Documentation

Each package has a `README.md` which gives a short overview of the package itself and provides notes and requirements.

### Naming of directories

- *lowercase* for packages to install in $HOME (the default)
- titlecase for packages to install as root in `/` (e.g. `@Daemon-osx`)
- leading `@` for environment packages and subpackages (e.g. `@mac`)
- leading `_` for non packages meaning that these directories must not be stowed (e.g. `_homebrew`)

Having a convention for subpackage naming enable us to write a .stow-global-ignore file so that subpackages are not symlinked when stowing parent package.

<!-- ### Ignore

### Secret files

local includes etc. -->

## Inspiration

There are many awesome dotfile repositories, but here are those which inspired me or where I stole ideas and functionality from.

- https://github.com/Kraymer/F-dotfiles

## License

This repository is available under the [MIT license](LICENSE).
