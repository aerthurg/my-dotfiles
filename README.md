# My Dotfiles
In this repository I'm tracking my dotfiles, mainly my customized Kickstart Neovim setup, with IDE features for HTML, CSS, JS/TypeScript, Python and GoLang.

I used this approach for setting up my Neovim configuration to work well on Windows 11, but it can easily be replicated on Linux/OSx maybe even without any modification.


## Contents

- [Installation](#installation)
- [Neovim Configuration](#neovim-configuration)
- [Updating the Repository](#updating-the-repository)
- [License](#license)

## Installation

To use these dotfiles on your machine, follow the steps below:

1. Clone the repository to your local machine:

   ```shell
   git clone https://github.com/vazryag/my-dotfiles.git
   ```

2. Change into the dotfiles directory:

   ```shell
   cd my-dotfiles
   ```

3. Copy the custom `init.lua` file from this repository directory to your OS' Neovim config directory.

* For Linux/OSx: `~/.config/nvim`
* For Windows: `~\AppData\Local\nvim`

Note: Make sure to backup your existing `init.nvim` file in case of any failure.

4. Install any additional packeg in the new `init.lua` file. `Kickstart` sets up `Packer` to manage all the plugins.

I've customized this script to install the following language servers by default:
* HTML
* CSS/SCSS
* JavaScript & TypeScript
* Python
* GoLang.

To modify which language servers to install by default, you'll need to edit the following part of the script:
```lua
local servers = {
  html = {},
  cssls ={},
  tsserver = {},
  pyright = {},
  gopls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  docker_compose_language_service ={},
  dockerls = {}
}
```
As you can see, besides HTML, CSS, JavaScript, TypeScript, Python and Go, also Dockerfile/Compose language servers are being installed by default!

Note: *To begin the installation process you just need to open `nvim` after replacing your `init.nvim` file by my customized `init.lua` file*.

## Pyriht Environment Configuration

To setup a custom virual environment as the interpreter for a python project on Kickstart Neovim, to avoide problems when importing third-party packages, you can create a `pyrightconfig.json` file in your project directory. Let's say you've created a virtualenv called `venv` at your project main directory.

```json
{
   "venvPath": ".",
   "venv": "venv"
}

```

This file will make sure that `pyright` will look for an interpreted and it's packages at a folder called `venv/` in our project dir `.`, and all your imports and code completion will work perfectly.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code as you see fit.
