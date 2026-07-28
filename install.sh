#!/usr/bin/env bash
# Bootstrap this dotfiles repo on a new Mac.
#
# Usage:
#   git clone https://github.com/andre-subia/dotfiles.git ~/dotfiles
#   ~/dotfiles/install.sh
#
# Safe to re-run: it skips anything already installed/linked, and backs up
# (never overwrites) any pre-existing file it would replace.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info()  { printf '\033[1;34m==>\033[0m %s\n' "$1"; }
ok()    { printf '  \033[1;32m✓\033[0m %s\n' "$1"; }
warn()  { printf '  \033[1;33m!\033[0m %s\n' "$1"; }

if ! command -v brew >/dev/null 2>&1; then
  warn "Homebrew is not installed."
  echo '    Install it first from https://brew.sh, then re-run this script:'
  echo '    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
fi

info "Installing dependencies with Homebrew"
brew install neovim git gh ripgrep fd tree-sitter-cli lazygit fileicon
brew install --cask font-jetbrains-mono-nerd-font wezterm

if ! command -v claude >/dev/null 2>&1; then
  info "Installing the Claude Code CLI"
  curl -fsSL claude.ai/install.sh | bash
else
  ok "Claude Code CLI already installed"
fi

# symlink $2 -> $1, moving anything already there aside (never clobbers)
link() {
  local target="$1" linkpath="$2"
  if [ -L "$linkpath" ] && [ "$(readlink "$linkpath")" = "$target" ]; then
    ok "$linkpath already points to $target"
    return
  fi
  if [ -e "$linkpath" ] || [ -L "$linkpath" ]; then
    local backup="${linkpath}.bak.$(date +%Y%m%d%H%M%S)"
    warn "$linkpath already existed, moving it to $backup"
    mv "$linkpath" "$backup"
  fi
  mkdir -p "$(dirname "$linkpath")"
  ln -s "$target" "$linkpath"
  ok "symlink created: $linkpath -> $target"
}

info "Creating symlinks"
link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
# Hyper is kept as a fallback, it's no longer the primary terminal
link "$DOTFILES_DIR/hyper/hyper.js" "$HOME/.hyper.js"

if [ -d "/Applications/WezTerm.app" ] && [ -f "$DOTFILES_DIR/wezterm/icon.png" ]; then
  info "Applying custom WezTerm icon"
  fileicon set /Applications/WezTerm.app "$DOTFILES_DIR/wezterm/icon.png" >/dev/null
  killall Dock >/dev/null 2>&1 || true
  ok "Icon applied"
fi

info "Done. Next steps:"
echo "    1. Open WezTerm (your primary terminal)."
echo "    2. Run 'nvim' once: lazy.nvim installs all the plugins on its own."
echo "    3. Run ':checkhealth claudecode' inside nvim to confirm the Claude integration."
