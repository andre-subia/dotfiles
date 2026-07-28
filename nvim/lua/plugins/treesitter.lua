-- Pinned to the `master` branch (classic, stable API) on purpose: the `main`
-- branch is an incompatible rewrite that dropped `nvim-treesitter.parsers`
-- (no more `ft_to_lang`), which broke Telescope's buffer previewer syntax
-- highlighting. `master` is still officially maintained for compatibility.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "html",
      "javascript",
      "tsx",
      "typescript",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "vim",
      "vimdoc",
      "yaml",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
