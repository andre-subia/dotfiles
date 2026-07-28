# Tutorial: from Mac/VS Code to Neovim

[Español](TUTORIAL.es.md)

The odd part of Neovim at first isn't the plugins — it's that it's **modal**:
the keyboard doesn't always type text. There are different modes, and each
one does something different with the same keys. Once that clicks, the rest
is just shortcuts.

## The modes

| Mode | For | How to enter |
|---|---|---|
| **Normal** | Moving around, deleting, copying, running commands. The default mode. | `Esc` (or `jk`, already mapped) |
| **Insert** | Typing text, like in any regular editor | `i` (before the cursor) or `a` (after) |
| **Visual** | Selecting text | `v` (char-wise), `V` (line-wise), `Ctrl+v` (block) |
| **Command-line** | Commands like `:w`, `:q`, search and replace | `:` |

Golden rule: if you're not sure what mode you're in, hit `Esc` — that always
gets you back to Normal.

## Equivalence table (Mac/VS Code → Neovim)

Everything in the right column happens in **Normal mode**, unless noted.

| Action | Mac / VS Code | Neovim |
|---|---|---|
| Undo | `Cmd+Z` | `u` |
| Redo | `Cmd+Shift+Z` | `Ctrl+r` |
| Copy (selection) | `Cmd+C` | `y` over a visual selection |
| Copy line | — | `yy` |
| Cut | `Cmd+X` | `d` over a visual selection, `dd` for the line |
| Paste | `Cmd+V` | `p` (after the cursor/line) or `P` (before) |
| Save | `Cmd+S` | `:w` or `<leader>w` |
| Save all | `Cmd+Option+S` | `:wa` |
| Close file/buffer | `Cmd+W` | `<leader>bd` |
| Find in file | `Cmd+F` | `/text` (`n`/`N` = next/previous match) |
| Find and replace | `Cmd+Option+F` | `:%s/old/new/g` |
| Search across the project | `Cmd+Shift+F` | `<leader>fg` (Telescope) |
| Quick open a file | `Cmd+P` | `<leader>ff` (Telescope) |
| Go to a line | `Cmd+G` | `:123<cr>` or `123G` |
| Select all | `Cmd+A` | `ggVG` |
| Duplicate line | `Shift+Option+↓` | `yyp` |
| Move line up/down | `Option+↑/↓` | In visual mode: `J` / `K` (already mapped) |
| Comment line/selection | `Cmd+/` | `gcc` (line) / `gc` (selection, in visual mode) |
| Go to definition | `Cmd+Click` / `F12` | `gd` |
| Find references | `Shift+F12` | `gr` |
| Rename symbol | `F2` | `<leader>rn` |
| Autocomplete | `Ctrl+Space` | Shows up as you type; `Tab` cycles suggestions |
| Toggle file sidebar | `Cmd+B` | `<leader>ee` |
| Integrated terminal | `` Ctrl+` `` | `:terminal`, or `<leader>ac` for the Claude panel |
| Split editor | `Cmd+\` | `:vsplit` (vertical) / `:split` (horizontal) |
| Switch between split panes | `Cmd+1`/`Cmd+2` | `Ctrl+h/j/k/l` (already mapped) |
| Multi-cursor (add on every occurrence) | `Cmd+D` | No direct equivalent. Alternatives: `:s/pattern/new/g` over a range, or record a macro (see below) |

## Basic movement (the first thing to build muscle memory for)

```
h j k l     left / down / up / right  (arrow keys also work)
w / b       word jump: next / previous
0 / $       start / end of line
gg / G      start / end of file
{n}G        go to line n (e.g. 42G)
```

## Basic editing

```
i / a       insert before / after the cursor
x           delete the character under the cursor
dd          delete (cut) the whole line
yy          copy the whole line
p / P       paste after / before the cursor
u           undo
Ctrl+r      redo
.           repeat the last change  (used A LOT, saves a ton of time)
```

Neovim's logic combines **verb + motion**: `d` (delete) + `w` (word) = `dw`
deletes to the next word. `d$` deletes to the end of the line. `y}` copies to
the next paragraph. Once this clicks, it's faster than selecting with the
mouse.

## Macros (the multi-cursor replacement)

To repeat an edit across several lines:

```
qa          start recording a macro into register "a"
...         make the edit once, normally
q           stop recording
@a          replay the macro
5@a         replay the macro 5 more times
```

## Typical workflow in this setup

1. `nvim .` — opens the project with the file explorer available
2. `<leader>ff` — jump to a file by name (like `Cmd+P`)
3. `Esc` for Normal, `i` to type — the only real adjustment at first
4. `<leader>w` — save (auto-formats on save)
5. `gd`, `K`, `<leader>ca`, `<leader>rn` — navigate and fix code with the LSP
6. `<leader>ac` — open Claude Code and ask for help with what you're looking at

Full cheatsheet of every configured keymap: [`README.md`](README.md).

## To practice

Neovim ships with an interactive tutorial. Run in the terminal:

```bash
nvim +Tutor
```

It takes about 30 minutes and covers everything above with exercises.
