# Neovim — keymap cheatsheet

[Español](README.es.md)

`<leader>` = `<space>`. Convention: `n` = normal, `v` = visual, `i` = insert.

New to Neovim? Start with [`TUTORIAL.md`](TUTORIAL.md).

## General

| Key | Mode | Action |
|---|---|---|
| `jk` | i | Exit to normal mode |
| `<leader>w` | n | Save file |
| `<leader>q` | n | Close window |
| `<esc>` | n | Clear search highlight |
| `q` | n | Close special buffers (help, quickfix, checkhealth, etc.) |

## Windows and buffers

| Key | Mode | Action |
|---|---|---|
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | n | Move between windows (left/down/up/right) |
| `<C-Up>` / `<C-Down>` | n | Increase / decrease window height |
| `<C-Left>` / `<C-Right>` | n | Decrease / increase window width |
| `<S-h>` / `<S-l>` | n | Previous / next buffer |
| `<S-Tab>` | n | Previous buffer (bufferline) |
| `<leader>bp` | n | Pick buffer (bufferline pick) |
| `<leader>bd` | n | Close buffer |

## Editing

| Key | Mode | Action |
|---|---|---|
| `J` / `K` | v | Move selection down / up |
| `<` / `>` | v | Indent without losing the selection |
| `gcc` | n | Toggle comment on line (Comment.nvim) |
| `gc` | v | Toggle comment on selection |
| `<leader>cf` | n | Format buffer (conform.nvim) |

## Finder (Telescope)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Search text across the project (live grep) |
| `<leader>fs` | Search the word under the cursor |
| `<leader>fb` / `<leader><leader>` | Search open buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Search Neovim help |
| `<leader>fd` | Search diagnostics |

## File explorer (neo-tree)

| Key | Action |
|---|---|
| `<leader>ee` | Toggle explorer |
| `<leader>ef` | Reveal current file in the explorer |

## LSP (active only in buffers with an attached server)

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references |
| `gI` | Go to implementation |
| `K` | Show hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>D` | Go to type definition |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>e` | Show diagnostic in a float |
| `<leader>xx` | Project diagnostics panel (Trouble) |
| `<leader>xX` | Current buffer diagnostics panel (Trouble) |
| `<leader>xq` | Quickfix list (Trouble) |

## Completion (nvim-cmp, in insert mode)

| Key | Action |
|---|---|
| `<Tab>` / `<S-Tab>` | Next / previous suggestion (or expand snippet) |
| `<C-n>` / `<C-p>` | Next / previous suggestion |
| `<C-Space>` | Force completion |
| `<CR>` | Confirm selection |
| `<C-e>` | Cancel completion |
| `<C-d>` / `<C-f>` | Scroll documentation |

## Git (gitsigns)

| Key | Action |
|---|---|
| `]h` / `[h` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |

## Claude Code (claudecode.nvim)

| Key | Mode | Action |
|---|---|---|
| `<leader>ac` | n | Open/close Claude in a split |
| `<leader>af` | n | Focus the Claude window |
| `<leader>ar` | n | Resume the last session (`--resume`) |
| `<leader>aC` | n | Continue the session (`--continue`) |
| `<leader>am` | n | Select Claude model |
| `<leader>ab` | n | Add the current buffer to context |
| `<leader>as` | v | Send selection to Claude |
| `<leader>as` | n (in neo-tree) | Add the selected file to context |
| `<leader>aa` | n | Accept the proposed diff |
| `<leader>ad` | n | Reject the proposed diff |

## Notifications (snacks.nvim)

| Key | Action |
|---|---|
| `<leader>un` | Dismiss notifications |

## UI

| Key | Action |
|---|---|
| `<leader>uc` | Pick a colorscheme (Telescope, with live preview) |
| `<leader>um` | Toggle minimap (mini.map) |

## Terminal (toggleterm) — Metro, Expo, git, etc.

| Key | Mode | Action |
|---|---|---|
| `<C-\>` | n, t | Toggle floating terminal |
| `<leader>tt` | n | Floating terminal |
| `<leader>th` | n | Horizontal terminal |

## npm (package-info.nvim, inside `package.json`)

| Key | Action |
|---|---|
| `<leader>ns` | Show each package's installed/latest version |
| `<leader>nc` | Hide |
| `<leader>nt` | Toggle |
| `<leader>nu` | Update package under cursor |
| `<leader>nd` | Delete package under cursor |
| `<leader>ni` | Install a new package |
| `<leader>np` | Change version |

## Surrounding text (nvim-surround)

| Key | Action |
|---|---|
| `ys{motion}{char}` | Add — e.g. `ysiw"` wraps the word in quotes |
| `cs{old}{new}` | Change — e.g. `cs"'` changes double quotes to single |
| `ds{char}` | Delete — e.g. `ds"` removes the quotes |
| `cst{tag}<CR>` | Change an HTML/JSX tag (e.g. `<div>` → `<h1>`) |

`nvim-ts-autotag` also auto-updates the closing tag when you edit an opening
one in JSX/TSX.
