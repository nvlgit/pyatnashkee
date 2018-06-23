# ![icon](data/icons/hicolor/64x64/apps/com.gitlab.nvlgit.pyatnashkee.svg) 15-puzzle
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)

A classic 15-puzzle game

![Alt text](https://user-images.githubusercontent.com/29505119/28335203-4a434180-6c06-11e7-8c10-7ffa4047b3be.png)

### Building and Installation

```bash
git clone https://gitlab.com/nvlgit/pyatnashkee.git && cd pyatnashkee
meson builddir --prefix=/usr && cd builddir
ninja
sudo ninja install
```
For rpmbuild: <a href="https://gitlab.com/nvlgit/fedora-specs/blob/master/pyatnashkee.spec">pyatnashkee.spec</a> 
