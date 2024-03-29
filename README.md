# dotfiles

## Contents
- .editorconfig
- Neovim config (located in .config/nvim)

## Neovim Configuration

### Requirements
- Neovim 0.9+
- Terminal with true color support
- Nerd Fonts patched font
- Clipboard tool (see `:help clipboard`)
- C compiler in PATH (`gcc`, `clang`)
- `ripgrep` - Telescope live grep
- `fd` - Telescope finder
- `git`, `curl`, `unzip`, `tar`, `gzip`, `npm` - Mason required dependencies

## Setup
- Install GNU Stow (`pacman -S stow`)
- Create `~/dotfiles` directory
- `git clone` this repository in the root of home directory, `~`
- Run `stow .` in `dotfiles` to symlink contents of dotfiles to parent directory, `~`
