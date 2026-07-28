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
  warn "Homebrew no está instalado."
  echo '    Instalalo primero desde https://brew.sh y volvé a correr este script:'
  echo '    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
fi

info "Instalando dependencias con Homebrew"
brew install neovim git gh ripgrep fd tree-sitter-cli lazygit
brew install --cask font-jetbrains-mono-nerd-font wezterm

if ! command -v claude >/dev/null 2>&1; then
  info "Instalando Claude Code CLI"
  curl -fsSL claude.ai/install.sh | bash
else
  ok "Claude Code CLI ya está instalado"
fi

# symlink $2 -> $1, moving anything already there aside (never clobbers)
link() {
  local target="$1" linkpath="$2"
  if [ -L "$linkpath" ] && [ "$(readlink "$linkpath")" = "$target" ]; then
    ok "$linkpath ya apunta a $target"
    return
  fi
  if [ -e "$linkpath" ] || [ -L "$linkpath" ]; then
    local backup="${linkpath}.bak.$(date +%Y%m%d%H%M%S)"
    warn "$linkpath ya existía, lo muevo a $backup"
    mv "$linkpath" "$backup"
  fi
  mkdir -p "$(dirname "$linkpath")"
  ln -s "$target" "$linkpath"
  ok "symlink creado: $linkpath -> $target"
}

info "Creando symlinks"
link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
# Hyper queda de respaldo, ya no es la terminal principal (ver README)
link "$DOTFILES_DIR/hyper/hyper.js" "$HOME/.hyper.js"

info "Listo. Próximos pasos:"
echo "    1. Abrí WezTerm (tu terminal principal)."
echo "    2. Corré 'nvim' una vez: lazy.nvim instala todos los plugins solo."
echo "    3. Corré ':checkhealth claudecode' dentro de nvim para confirmar la integración con Claude."
