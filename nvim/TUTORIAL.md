# Tutorial: de Mac/VS Code a Neovim

Lo raro de Neovim al principio no son los plugins, es que es **modal**: el teclado no
sirve siempre para escribir. Hay distintos modos y cada uno hace algo distinto con las
mismas teclas. Una vez que entendés esto, el resto son atajos.

## Los modos

| Modo | Para qué | Cómo entrar |
|---|---|---|
| **Normal** | Moverte, borrar, copiar, ejecutar comandos. Es el modo por defecto. | `Esc` (o `jk`, ya mapeado) |
| **Insert** | Escribir texto, como en cualquier editor normal | `i` (antes del cursor) o `a` (después) |
| **Visual** | Seleccionar texto | `v` (por carácter), `V` (por línea), `Ctrl+v` (bloque) |
| **Command-line** | Comandos tipo `:w`, `:q`, búsqueda y reemplazo | `:` |

Regla de oro: si no sabés en qué modo estás, apretá `Esc` — eso siempre te devuelve a Normal.

## Tabla de equivalencias (Mac/VS Code → Neovim)

Todo lo de la columna derecha se hace en **modo Normal**, salvo que se aclare.

| Acción | Mac / VS Code | Neovim |
|---|---|---|
| Deshacer | `Cmd+Z` | `u` |
| Rehacer | `Cmd+Shift+Z` | `Ctrl+r` |
| Copiar (selección) | `Cmd+C` | `y` sobre una selección visual |
| Copiar línea | — | `yy` |
| Cortar | `Cmd+X` | `d` sobre selección visual, `dd` para la línea |
| Pegar | `Cmd+V` | `p` (después del cursor/línea) o `P` (antes) |
| Guardar | `Cmd+S` | `:w` o `<leader>w` |
| Guardar todo | `Cmd+Option+S` | `:wa` |
| Cerrar archivo/buffer | `Cmd+W` | `<leader>bd` |
| Buscar en el archivo | `Cmd+F` | `/texto` (`n`/`N` = siguiente/anterior resultado) |
| Buscar y reemplazar | `Cmd+Option+F` | `:%s/viejo/nuevo/g` |
| Buscar en todo el proyecto | `Cmd+Shift+F` | `<leader>fg` (Telescope) |
| Abrir archivo rápido (quick open) | `Cmd+P` | `<leader>ff` (Telescope) |
| Ir a una línea | `Cmd+G` | `:123<cr>` o `123G` |
| Seleccionar todo | `Cmd+A` | `ggVG` |
| Duplicar línea | `Shift+Option+↓` | `yyp` |
| Mover línea arriba/abajo | `Option+↑/↓` | En visual: `J` / `K` (ya mapeado) |
| Comentar línea/selección | `Cmd+/` | `gcc` (línea) / `gc` (selección, en visual) |
| Ir a definición | `Cmd+Click` / `F12` | `gd` |
| Ver referencias | `Shift+F12` | `gr` |
| Renombrar símbolo | `F2` | `<leader>rn` |
| Autocompletar | `Ctrl+Space` | Aparece solo al escribir; `Tab` navega las opciones |
| Mostrar/ocultar sidebar de archivos | `Cmd+B` | `<leader>ee` |
| Terminal integrada | `` Ctrl+` `` | `:terminal`, o `<leader>ac` para el panel de Claude |
| Dividir editor | `Cmd+\` | `:vsplit` (vertical) / `:split` (horizontal) |
| Cambiar entre paneles divididos | `Cmd+1`/`Cmd+2` | `Ctrl+h/j/k/l` (ya mapeado) |
| Multi-cursor (agregar en cada ocurrencia) | `Cmd+D` | No existe igual. Alternativas: `:s/patron/nuevo/g` en un rango, o grabar una macro (ver abajo) |

## Movimiento básico (lo primero que hay que automatizar)

```
h j k l     izquierda / abajo / arriba / derecha  (las flechas también andan)
w / b       salto de palabra: siguiente / anterior
0 / $       inicio / fin de la línea
gg / G      inicio / fin del archivo
{n}G        ir a la línea n (ej: 42G)
```

## Edición básica

```
i / a       insertar antes / después del cursor
x           borrar el carácter bajo el cursor
dd          borrar (cortar) la línea entera
yy          copiar la línea entera
p / P       pegar después / antes del cursor
u           deshacer
Ctrl+r      rehacer
.           repetir el último cambio  (MUY usado, ahorra un montón)
```

La lógica de Neovim combina **verbo + movimiento**: `d` (delete) + `w` (word) = `dw`
borra hasta la próxima palabra. `d$` borra hasta el fin de línea. `y}` copia hasta el
próximo párrafo. Una vez que entendés esto, es más rápido que seleccionar con el mouse.

## Macros (el reemplazo del multi-cursor)

Para repetir una edición en varias líneas:

```
qa          empieza a grabar una macro en el registro "a"
...         hacés la edición una vez, normal
q           termina de grabar
@a          repite la macro
5@a         repite la macro 5 veces más
```

## Flujo de trabajo típico en este setup

1. `nvim .` — abre el proyecto con el explorador de archivos disponible
2. `<leader>ff` — saltar a un archivo por nombre (como `Cmd+P`)
3. `Esc` para Normal, `i` para escribir — es lo único realmente distinto al principio
4. `<leader>w` — guardar (formatea automáticamente al guardar)
5. `gd`, `K`, `<leader>ca`, `<leader>rn` — navegar y arreglar código con el LSP
6. `<leader>ac` — abrir Claude Code y pedirle ayuda sobre lo que estás viendo

Cheatsheet completo de todos los atajos configurados: [`README.md`](README.md).

## Para practicar

Neovim trae un tutorial interactivo instalado. Corré en la terminal:

```bash
nvim +Tutor
```

Son ~30 minutos y cubre todo lo de arriba con ejercicios.
