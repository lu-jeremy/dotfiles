# dotfiles

Personal dev environment config — Neovim, tmux, zsh.

## What's in here

- **Neovim** — lazy.nvim, Telescope, Harpoon, LSP, Treesitter, Catppuccin Mocha
- **tmux** — vim-style copy mode, mouse support, clipboard over SSH (OSC 52)
- **zsh** — aliases, Brazil build system shortcuts
- **Vim** — fallback vimrc for machines without Neovim

## Setup

```bash
git clone git@github.com:lu-jeremy/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

## Key bindings

### Neovim

| Key | Action |
|-----|--------|
| `Space ff` | Find files |
| `Space fg` | Grep all files |
| `Space ee` | Toggle file explorer |
| `Space a` | Add file to Harpoon |
| `Space 1-4` | Jump to Harpoon file |
| `gd` | Go to definition |
| `gr` | Go to references |
| `Space ca` | Code action |
| `Space tt` | Open terminal split |

### tmux

| Key | Action |
|-----|--------|
| `C-Space` | Prefix |
| `prefix + h/j/k/l` | Navigate panes |
| `prefix + c` | New window |
| `prefix + [` | Enter copy mode |
| `v` (copy mode) | Begin selection |
| `y` (copy mode) | Yank (stays in copy mode) |
