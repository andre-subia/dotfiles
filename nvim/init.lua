-- entrypoint: carga opciones/keymaps/autocmds y luego bootstrapea lazy.nvim
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
