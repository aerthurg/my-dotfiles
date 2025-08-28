# My Dotfiles

In this repository I'm managing the dotfiles I use to setup my entire development workflow using three main applications, namely: a) Alacritty; b) Zellij; and c) Neovim. I use this setup to code mainly in WebAssembly, Python, and Rust, so expect LSPs cofigured for liting, formatting, and completion for these languages. Additionally, I use this entire setup on Pop!_OS, which is a Ubuntu-based linux distribution, so for porting it to MacOS or Windows, do your own research (it should be quite easy).

# Table of Contents
+ Alacritty Installation and Setup
+ Zellij Installation and Setup
+ Neovim Installation and Setup (with LazyVim)

## Alacritty Installation and Setup
Alacritty is a cross-platform terminal emulator. You should follow the instructions from the official Alacritty <a href="https://github.com/alacritty/alacritty" target="blank">GitHub repository</a>. After the installation process, you should create a directory called *alacritty* under the *~/.config/* directory in order to customize your alacritty installation.

Now you can copy my *alacritty.toml* file to your *~/.config/alacritty* directory in order to use my customizations in your Alacritty installation. The only customizations I made to my Alacritty installation were the following:
+ Modified window's padding, opacity, and startup mode.
+ Modified font to JetBrainsMonoNerdFont with size of 12 (download and install this font!).
+ Changed the colorscheme to Solarized-Osaka.

The screenshot below shows how my Alacritty installation looks like:

<center>
  <img src="https://i.ibb.co/Hfysf0W1/image.png" width="630" />
</center>

## Zellij Installation and Setup
Zellij is a powerful rust-based terminal workspace manager that is really useful for managing multiple panels and tabs in a same terminal session. You should follow the installation instructions present in the official <a href="https://zellij.dev">Zellij website</a> (I recommend doing it using Rust's cargo package manager).

After installing Zellij using your prefered method, create the *~/.config/zellij* directory in your system, and then populate it with a *config.kdl* file. This file hosts the entire configuration of your Zellij installation and is provided in the official website (as well as in this repository)the installation.

The only change I made in this configuration file was to change the color theme for "solarized-dark", which mathces pretty well with Solarized-Osaka, which is my favorite colorscheme for everything. You can do this by uncommenting the "theme" line and then setting it to "solarized-dark":

```kdl
theme "solarized-dark"
```

The screenshot below shows how my Zellij installation looks like in my Alacritty:

<center>
  <img src="https://i.ibb.co/xtgFXyD0/image.png" width="630" />
</center>

## Neovim Installation and Setup (with LazyVim)

I use Neovim as my text editor of choice. To put it in pair with modern IDEs, I also use LazyVim as my distribution of choice. It is fast, minimal, and uses Lazy, which is my favorite package manager for Neovim.

Personally I use PPAs for installing Neovim, since it is a more straightforward installation process than building it from source or using Snapcraft (which I do not like). You can either install it's stable or unstable versions. I prefer using the unstable version since most of the Neovim's packages and distributions only supports recent versions of the editor.

You can use one of the options below:

```bash
sudo add-apt-repository ppa:neovim-ppa/stable -y

# OR

sudo add-apt-repository ppa:neovim-ppa/unstable -y

# THEN

sudo apt update && sudo apt install neovim
```

After installing Neovim, create the *~/.config/nvim* directory and then install LazyVim following the installation instructions in their <a href="https://www.lazyvim.org/">official website</a>. The copy my */nvim/lua* files and then replace the same folder in your installation.

The main customizations I did are:
+ Installed the Solarized-Osaka colorscheme.
+ Installed *telescope.lua* for fuzzy finding files.
+ Installed *neo-tree.lua* for exploring project files.
+ Installed *transparent.lua* for making *neo-tree.nvim* transparent.
+ Configured *mason-lspconfig*.lua and *mason.lua* to ensure the following language servers are installed and properly configured:
  + uv (Python)
  + lua_ls (Lua)
  + pylsp (Python)
  + rust_analyzer (Rust)
  + tailwindcss (TailwindCSS)
  + wasm-language-tools (WebAssembly)
  + docker-language-server (Dockerfile and Compose)
+ Configured *nvim-lint* for the following linters:
  + pylsp (Python)
  + wasm-language-tools (WebAssembly)
+ Configured *conform.nvim* for the following opinionated formatters:
  + pylsp (Python)
  + rust_analyzer (Rust)
  + wasm-language-tools (WebAssembly)

There are some additional configurations I made, such as some new keymaps and autocmds, all of them for executing and/or modifying some of the packages listed above. Feel free to check them in the *~/.config/nvim/lua/config/* directory and modify them based on your needs.

The screenshot below shows my LazyVim setup after it's initialization in my Alacritty terminal emulator:

<center>
  <img src="https://i.ibb.co/0RdKrxHQ/image.png" width="630" />
</center>
