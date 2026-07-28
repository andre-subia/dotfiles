# dotfiles

Configuración personal, pensada para levantar el mismo entorno en cualquier Mac nueva.

## Contenido

- `nvim/` — Neovim configurado como IDE: LSP (TypeScript/JS, Python, Lua, JSON, HTML, CSS, Bash, Markdown), autocompletado, treesitter, explorador de archivos, fuzzy finder, git signs, formateo automático al guardar, y [claudecode.nvim](https://github.com/coder/claudecode.nvim) para usar Claude Code directamente dentro del editor.
- `hyper/` — Configuración de [Hyper](https://hyper.is) con el tema [Catppuccin Mocha](https://github.com/catppuccin/hyper).

Tema de color en todo el setup: [Catppuccin](https://github.com/catppuccin) (flavour `mocha`).

## Instalación en una Mac nueva

```bash
git clone https://github.com/andre-subia/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

Eso instala todas las dependencias (Homebrew), la fuente, el Claude Code CLI si
falta, y crea los symlinks. Se puede correr de nuevo sin problema — no reinstala
lo que ya está, y si encuentra un `~/.config/nvim` o `~/.hyper.js` previo que no
sea de este repo, lo mueve a un `.bak` en vez de pisarlo.

Después, abrí `nvim` una vez (lazy.nvim instala los plugins solo) y reiniciá Hyper.

## Neovim: atajos clave

Leader = `<space>`. Cheatsheet completo en [`nvim/README.md`](nvim/README.md).

¿Vas a usar Neovim por primera vez? [`nvim/TUTORIAL.md`](nvim/TUTORIAL.md) tiene la
tabla de equivalencias con Mac/VS Code (`Cmd+Z`, `Cmd+P`, etc.) y una intro a los modos.

## Claude Code dentro de Neovim

Usa [claudecode.nvim](https://github.com/coder/claudecode.nvim), que implementa el mismo protocolo (WebSocket MCP) que la extensión oficial de VS Code: Claude ve el buffer activo, la selección y los diagnósticos en tiempo real, y puede proponer diffs que se revisan nativamente en Neovim.

Requiere tener el [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) instalado y accesible como `claude` en el `PATH`. Corré `:checkhealth claudecode` dentro de Neovim para verificar la instalación.
