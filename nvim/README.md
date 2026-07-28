# Neovim — atajos de teclado

`<leader>` = `<space>`. Convención: `n` = normal, `v` = visual, `i` = insert.

## General

| Atajo | Modo | Acción |
|---|---|---|
| `jk` | i | Salir a modo normal |
| `<leader>w` | n | Guardar archivo |
| `<leader>q` | n | Cerrar ventana |
| `<esc>` | n | Limpiar resaltado de búsqueda |
| `q` | n | Cerrar buffers especiales (help, quickfix, checkhealth, etc.) |

## Ventanas y buffers

| Atajo | Modo | Acción |
|---|---|---|
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | n | Moverse entre ventanas (izq/abajo/arriba/der) |
| `<C-Up>` / `<C-Down>` | n | Aumentar / reducir alto de la ventana |
| `<C-Left>` / `<C-Right>` | n | Reducir / aumentar ancho de la ventana |
| `<S-h>` / `<S-l>` | n | Buffer anterior / siguiente |
| `<S-Tab>` | n | Buffer anterior (bufferline) |
| `<leader>bp` | n | Elegir buffer (bufferline pick) |
| `<leader>bd` | n | Cerrar buffer |

## Edición

| Atajo | Modo | Acción |
|---|---|---|
| `J` / `K` | v | Mover la selección hacia abajo / arriba |
| `<` / `>` | v | Indentar sin perder la selección |
| `gcc` | n | Comentar/descomentar línea (Comment.nvim) |
| `gc` | v | Comentar/descomentar selección |
| `<leader>cf` | n | Formatear buffer (conform.nvim) |

## Buscador (Telescope)

| Atajo | Acción |
|---|---|
| `<leader>ff` | Buscar archivos |
| `<leader>fg` | Buscar texto en todo el proyecto (live grep) |
| `<leader>fs` | Buscar la palabra bajo el cursor |
| `<leader>fb` / `<leader><leader>` | Buscar entre buffers abiertos |
| `<leader>fr` | Archivos recientes |
| `<leader>fh` | Buscar en la ayuda de Neovim |
| `<leader>fd` | Buscar en diagnósticos |

## Explorador de archivos (neo-tree)

| Atajo | Acción |
|---|---|
| `<leader>ee` | Mostrar/ocultar explorador |
| `<leader>ef` | Revelar el archivo actual en el explorador |

## LSP (activo solo en buffers con servidor adjunto)

| Atajo | Acción |
|---|---|
| `gd` | Ir a la definición |
| `gD` | Ir a la declaración |
| `gr` | Ver referencias |
| `gI` | Ir a la implementación |
| `K` | Mostrar documentación (hover) |
| `<leader>rn` | Renombrar símbolo |
| `<leader>ca` | Code action |
| `<leader>D` | Ir a la definición de tipo |
| `[d` / `]d` | Diagnóstico anterior / siguiente |
| `<leader>e` | Mostrar diagnóstico en un float |
| `<leader>xx` | Panel de diagnósticos del proyecto (Trouble) |
| `<leader>xX` | Panel de diagnósticos del buffer actual (Trouble) |
| `<leader>xq` | Quickfix list (Trouble) |

## Autocompletado (nvim-cmp, en insert mode)

| Atajo | Acción |
|---|---|
| `<Tab>` / `<S-Tab>` | Siguiente / anterior sugerencia (o expandir snippet) |
| `<C-n>` / `<C-p>` | Siguiente / anterior sugerencia |
| `<C-Space>` | Forzar autocompletado |
| `<CR>` | Confirmar selección |
| `<C-e>` | Cancelar autocompletado |
| `<C-d>` / `<C-f>` | Scroll de la documentación |

## Git (gitsigns)

| Atajo | Acción |
|---|---|
| `]h` / `[h` | Hunk siguiente / anterior |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame de la línea |

## Claude Code (claudecode.nvim)

| Atajo | Modo | Acción |
|---|---|---|
| `<leader>ac` | n | Abrir/cerrar Claude en un split |
| `<leader>af` | n | Enfocar la ventana de Claude |
| `<leader>ar` | n | Reanudar la última sesión (`--resume`) |
| `<leader>aC` | n | Continuar la sesión (`--continue`) |
| `<leader>am` | n | Elegir modelo de Claude |
| `<leader>ab` | n | Agregar el buffer actual al contexto |
| `<leader>as` | v | Enviar la selección a Claude |
| `<leader>as` | n (en neo-tree) | Agregar el archivo seleccionado al contexto |
| `<leader>aa` | n | Aceptar el diff propuesto |
| `<leader>ad` | n | Rechazar el diff propuesto |

## Notificaciones (snacks.nvim)

| Atajo | Acción |
|---|---|
| `<leader>un` | Descartar notificaciones |
