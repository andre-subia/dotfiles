# dotfiles

Configuración personal, pensada para levantar el mismo entorno en cualquier Mac nueva.

## Contenido

- `nvim/` — Neovim configurado como IDE: LSP (TypeScript/JS, Python, Lua, JSON, HTML, CSS, Bash, Markdown), autocompletado, treesitter, explorador de archivos, fuzzy finder, git signs, formateo automático al guardar, y [claudecode.nvim](https://github.com/coder/claudecode.nvim) para usar Claude Code directamente dentro del editor.
- `hyper/` — Configuración de [Hyper](https://hyper.is) con el tema [Catppuccin Mocha](https://github.com/catppuccin/hyper).

Tema de color en todo el setup: [Catppuccin](https://github.com/catppuccin) (flavour `mocha`).

## Instalación en una Mac nueva

```bash
# dependencias
brew install neovim git gh ripgrep fd lazygit
brew install --cask font-jetbrains-mono-nerd-font

# clonar el repo
git clone https://github.com/<tu-usuario>/dotfiles.git ~/dotfiles

# symlinks
mkdir -p ~/.config
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/hyper/hyper.js ~/.hyper.js

# Claude Code CLI (si no lo tenés instalado)
# ver https://docs.anthropic.com/en/docs/claude-code

# abrir nvim: lazy.nvim instala todos los plugins solo en el primer arranque
nvim
```

En Hyper, seleccioná la fuente `JetBrainsMono Nerd Font` si no quedó aplicada automáticamente (Preferencias > reiniciar Hyper).

## Neovim: atajos clave

Leader = `<space>`.

| Atajo | Acción |
|---|---|
| `<leader>ff` / `<leader>fg` | Buscar archivos / buscar texto (Telescope) |
| `<leader>ee` | Toggle explorador de archivos (neo-tree) |
| `gd` / `gr` / `K` | Ir a definición / referencias / hover (LSP) |
| `<leader>rn` / `<leader>ca` | Rename / code action (LSP) |
| `<leader>cf` | Formatear buffer |
| `<leader>xx` | Panel de diagnósticos (Trouble) |
| `<leader>ac` | Abrir/cerrar Claude Code en un split |
| `<leader>as` (visual) | Enviar selección a Claude |
| `<leader>ab` | Agregar buffer actual al contexto de Claude |
| `<leader>aa` / `<leader>ad` | Aceptar / rechazar diff propuesto por Claude |

## Claude Code dentro de Neovim

Usa [claudecode.nvim](https://github.com/coder/claudecode.nvim), que implementa el mismo protocolo (WebSocket MCP) que la extensión oficial de VS Code: Claude ve el buffer activo, la selección y los diagnósticos en tiempo real, y puede proponer diffs que se revisan nativamente en Neovim.

Requiere tener el [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) instalado y accesible como `claude` en el `PATH`. Corré `:checkhealth claudecode` dentro de Neovim para verificar la instalación.
