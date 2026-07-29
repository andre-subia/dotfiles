# dotfiles

![macOS](https://img.shields.io/badge/macOS-1F1F28?style=for-the-badge&logo=apple&logoColor=DCD7BA)
![Neovim](https://img.shields.io/badge/Neovim-1F1F28?style=for-the-badge&logo=neovim&logoColor=98BB6C)
![WezTerm](https://img.shields.io/badge/WezTerm-1F1F28?style=for-the-badge&logo=wezterm&logoColor=7FB4CA)
![Lua](https://img.shields.io/badge/Lua-1F1F28?style=for-the-badge&logo=lua&logoColor=7E9CD8)
![Claude Code](https://img.shields.io/badge/Claude_Code-1F1F28?style=for-the-badge&logo=claude&logoColor=E46876)
![Kanagawa](https://img.shields.io/badge/theme-Kanagawa_Wave-1F1F28?style=for-the-badge&labelColor=1F1F28&color=7E9CD8)

[Español](README.es.md)

A portable macOS development environment, reproducible on any machine with a
single command: Neovim configured as a full IDE, WezTerm as the terminal, and
Claude Code wired in natively. Styled end to end with
[Kanagawa](https://github.com/rebelot/kanagawa.nvim) (Wave).

![Neovim as an IDE in WezTerm, with the file explorer on the left and Claude Code on the right](assets/nvim.png)

## Contents

- **`nvim/`** — Neovim as an IDE: LSP (TypeScript/JS, Python, Lua, JSON, HTML, CSS, Bash, Markdown), autocompletion, Treesitter, file explorer, fuzzy finder, git signs, format-on-save, Kanagawa theme with a crosshair cursor, and [claudecode.nvim](https://github.com/coder/claudecode.nvim) for using Claude Code directly inside the editor.
- **`wezterm/`** — Primary terminal. GPU-accelerated, configured in Lua, native Kanagawa theme with a highlighted active tab, real transparency with blur.
- **`hyper/`** — Config for [Hyper](https://hyper.is), used early on. Kept as a fallback but no longer the recommended terminal: being Electron-based, it shows its own native context menu, which conflicts with Neovim's (a double menu on right-click).

## Installation

```bash
git clone https://github.com/andre-subia/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

This installs every dependency (via Homebrew), the font, the Claude Code CLI
if missing, and creates the symlinks. Safe to re-run — it skips anything
already installed, and if it finds an existing `~/.config/nvim` or
`~/.hyper.js` that isn't from this repo, it moves it aside to a `.bak` file
instead of overwriting it.

Then open WezTerm and run `nvim` once (lazy.nvim installs the plugins on
first launch).

## Neovim keymaps

Leader = `<space>`. Full cheatsheet in [`nvim/README.md`](nvim/README.md).

New to Neovim? [`nvim/TUTORIAL.md`](nvim/TUTORIAL.md) has a Mac/VS Code
equivalence table (`Cmd+Z`, `Cmd+P`, etc.) and a short intro to modal editing.

## Claude Code inside Neovim

Uses [claudecode.nvim](https://github.com/coder/claudecode.nvim), which
implements the same protocol (WebSocket MCP) as the official VS Code
extension: Claude sees the active buffer, selection, and diagnostics in real
time, and can propose diffs reviewed natively inside Neovim.

Requires the [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code)
installed and available as `claude` on `PATH`. Run `:checkhealth claudecode`
inside Neovim to verify the setup.
