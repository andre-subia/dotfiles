-- nvim-treesitter's `main` branch is a full rewrite: no more
-- `nvim-treesitter.configs`/`ensure_installed` opts. Highlighting, folding
-- and indent are enabled per-buffer via autocmd, as Neovim core intends.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ensure_installed = {
      "bash",
      "css",
      "html",
      "javascript",
      "tsx",
      "typescript",
      "json",
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
    }
    require("nvim-treesitter").install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
      callback = function(event)
        local ok = pcall(vim.treesitter.start)
        if not ok then
          return
        end
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
