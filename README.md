# ![icon](data/icons/hicolor/64x64/apps/com.gitlab.nvlgit.pyatnashkee.svg) 15-puzzle
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)

A classic 15-puzzle game

![Alt text](https://user-images.githubusercontent.com/29505119/45298211-80cfb400-b510-11e8-8da7-d00fcf112cc8.png)

### Building and Installation

```bash
git clone https://gitlab.com/nvlgit/pyatnashkee.git && cd pyatnashkee
meson builddir --prefix=/usr && cd builddir
ninja
sudo ninja install
```

### Build Dependencies
* gtk+-4.0 >= 4.2.0
* meson

For rpmbuild: <a href="https://gitlab.com/nvlgit/fedora-specs/blob/master/pyatnashkee.spec">pyatnashkee.spec</a> 

### Flatpak Building and Installation

Make temp dir
```bash
mkdir temp && cd temp
```
Build
```bash
wget https://gitlab.com/nvlgit/pyatnashkee/raw/master/com.gitlab.nvlgit.pyatnashkee.yml
flatpak-builder build-dir com.gitlab.nvlgit.pyatnashkee.yml
flatpak build-export my-repo build-dir
flatpak build-bundle my-repo pyatnashkee.flatpak com.gitlab.nvlgit.pyatnashkee
```
Install
```bash
flatpak install pyatnashkee.flatpak
```
Remove temp dir
```bash
cd .. && rm -R temp
```

