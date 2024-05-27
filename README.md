# Collection-of-plugins-for-Neovim

I have gathered a lot of plugins for Neovim/Vim. You can customize them to suit you. It includes 2 configuration files, one for Neovim and other for lua. Some of configuration may be mistake to run. So I welcome you to edit them to make it better.

I use vim-plug to automated installation, so first you need to install vim-plug.

## Notes

make sure you installed these [Requirement]
- NodeJS
- Python
- Git


## Vim-plug

[Download plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)
and put it in the "autoload" directory.

<details>
<summary>Click to see the instructions</summary>

### Vim

#### Unix

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

You can automate the process by putting the command in your Vim configuration
file as suggested [here][auto].

[auto]: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation


#### Windows (PowerShell)

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

### Neovim

#### Unix, Linux

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://github.com/congnghe88/Collection-of-plugins-for-Neovim/blob/main/init.vim'
```

#### Linux (Flatpak)

```sh
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
    https://github.com/congnghe88/Collection-of-plugins-for-Neovim/blob/main/init.vim
```

#### Windows (PowerShell)

```powershell
iwr -useb https://github.com/congnghe88/Collection-of-plugins-for-Neovim/blob/main/init.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

it looks like this:

```
~/AppData/Local/nvim-data
│
├── site
│   │
│   ├── autoload
│   │   │
│   │   └── plug.vim   
│   │
│   └── ...
│            
└── ...

```
</details>

### Usage

Add a vim-plug section to your `~/.vimrc` (or `init.vim` for Neovim)

1. Begin the section with `call plug#begin()`
1. List the plugins with `Plug` commands
1. End the section with `call plug#end()`



Reload the file or restart Vim, then you can,

* `:PlugInstall` to install the plugins
* `:PlugUpdate` to install or update the plugins
* `:PlugDiff` to review the changes from the last update


## Lua file

<details>
<summary>Click to see the instructions</summary>

### Neovim

#### Unix, Linux

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim \
       https://github.com/congnghe88/Collection-of-plugins-for-Neovim/tree/main/init.lua'
```

#### Linux (Flatpak)

```sh
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim \
    https://github.com/congnghe88/Collection-of-plugins-for-Neovim/blob/main/init.lua'
```

#### Windows (PowerShell)

```powershell
iwr -useb https://github.com/congnghe88/Collection-of-plugins-for-Neovim/blob/main/init.lua |`
    ni "$(@($env:XDG_DATA_HOME, $env:.config)[$null -eq $env:XDG_DATA_HOME])/nvim/init.lua" -Force
```

it looks like this:
```
~/.config/nvim
|
├── lua
|   |
│   ├── config
|   |   |
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
|   |
│   └── plugins
|       |
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
|
└── init.lua

```

</details>

