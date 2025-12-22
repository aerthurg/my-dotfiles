#!/bin/bash
set -e

# installing zen browser and removing firefox
flatpak install -y flathub app.zen_browser.zen
sudo apt purge firefox

# installing pipx for managing python global dependencies
sudo apt update && sudo apt install -y python3-venv python3-pip pipx
pipx ensurepath

pipx install python-lsp-server
curl -LsSf https://astral.sh/uv/install.sh | sh -s
source $HOME/.local/bin/env

# installing node.js via nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash -s -- --y
\. "$HOME/.nvm/nvm.sh"
nvm install 24

# installing rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# sourcing cargo env file
. "$HOME/.cargo/env"

# installing a nerd font for the terminal
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
FONT_DIR="$HOME/.local/share/fonts"

mkdir -p "$FONT_DIR"
TEMP_DIR=$(mktemp -d)

curl -L -o "$TEMP_DIR/JetBrainsMono.zip" "$FONT_URL"
unzip -q "$TEMP_DIR/JetBrainsMono.zip" -d "$TEMP_DIR"
find "$TEMP_DIR" -name "*JetBrainsMono*.tff" -exec mv {} "$FONT_DIR" \;
fc-cache -f -v > /dev/null

rm -rf "$TEMP_DIR"

# installing lsd, bat, and zellij using cargo
cargo install lsd
cargo install --locked bat
cargo install --locked zellij

# building alacritty from source
sudo apt install build-essential \
	cmake \
	g++ \
	pkg-config \
	libfontconfig1-dev \
	libxcb-xfixes0-dev \
	libxkbcommon-dev \
	-y

git clone https://github.com/alacritty/alacritty &&
	cd alacritty &&
	cargo build --release &&
	sudo cp target/release/alacritty /usr/local/bin &&
	sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg &&
	sudo desktop-file-install extra/linux/Alacritty.desktop &&
	sudo update-desktop-database &&
	echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc &&
	cd && 
	rm -rf alacritty &&
	mkdir .config/alacritty

# installing neovim as an appimage
NVIM_VERSION="v0.11.5"
NVIM_URL="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.appimage"
TEMP_NVIM_PATH = "/tmp/nvim.appimage"
NVIM_CONFIG_DIR="$HOME/.config/nvim"

curl -L -o "$TEMP_NVIM_PATH" "$NVIM_URL"
chmod +x "$TEMP_NVIM_PATH"
mkdir -p "$NVIM_CONFIG_DIR"
sudo mv "$TEMP_NVIM_PATH" /usr/local/bin/nvim

# downloading and setting up my dotfiles
REPO_URL="https://github.com/aerthurg/my-dotfiles.git"
TEMP_REPO_DIR=$(mktemp -d)
USER_CONFIG_DIR="$HOME/.config/"

git clone --depth 1 "$REPO_URL" "$TEMP_REPO_DIR"

apply_config() {
	APP_NAME=$1
	SOURCE="$TEMPO_REPO_DIR/$APP_NAME"
	DEST="$USER_CONFIG_DIR/$APP_NAME"
	cp -r "$SOURCE" "$USER_CONFIG_DIR"
}

apply_config "nvim"
apply_config "alacritty"
apply_config "zellij"

rm -rf "$TEMP_REPO_DIR"
