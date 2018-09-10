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
* gtk+-4.0 (tested on 3.94)
* meson

For rpmbuild: <a href="https://gitlab.com/nvlgit/fedora-specs/blob/master/pyatnashkee.spec">pyatnashkee.spec</a> 
