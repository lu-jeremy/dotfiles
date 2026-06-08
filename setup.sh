#!/bin/bash
set -e

echo "=== Dotfiles Setup ==="

# --- Symlinks ---
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.config
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

# --- Neovim ---
if ! command -v nvim &> /dev/null; then
  echo "Installing Neovim..."
  mkdir -p ~/bin
  curl -Lo /tmp/nvim.tar.gz -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
  tar -xzf /tmp/nvim.tar.gz -C ~/bin/
  ln -sf ~/bin/nvim-linux64/bin/nvim ~/bin/nvim
  rm /tmp/nvim.tar.gz
fi

# --- Node.js (needed for pyright, ts_ls) ---
if ! command -v node &> /dev/null; then
  echo "Installing Node.js via nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm install --lts
fi

# --- Ensure ~/bin is in PATH ---
if ! echo "$PATH" | grep -q "$HOME/bin"; then
  export PATH="$HOME/bin:$PATH"
fi

# --- Install nvim plugins ---
echo "Installing nvim plugins..."
nvim --headless -c 'lua require("lazy").sync({wait=true})' -c 'qa' 2>/dev/null

# --- Build telescope-fzf-native ---
if [ -d ~/.local/share/nvim/lazy/telescope-fzf-native.nvim ]; then
  echo "Building fzf-native..."
  make -C ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
fi

# --- Install LSPs via Mason ---
echo "Installing LSPs..."
nvim --headless -c 'MasonInstall pyright typescript-language-server lua-language-server' -c 'qa' 2>/dev/null

echo "=== Done! Restart your shell. ==="
