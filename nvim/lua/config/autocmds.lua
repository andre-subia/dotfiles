local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- restore cursor position when reopening a file
autocmd("BufReadPost", {
  group = augroup("restore_cursor", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- auto-create missing directories on save
autocmd("BufWritePre", {
  group = augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- close some filetypes with <q>
autocmd("FileType", {
  group = augroup("close_with_q", { clear = true }),
  pattern = { "qf", "help", "man", "lspinfo", "checkhealth", "notify" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- crosshair cursor (see config/options.lua): only in the focused window, and
-- not in sidebars/pickers/terminals where the vertical guide is just noise.
local crosshair_exclude = {
  "neo-tree",
  "toggleterm",
  "TelescopePrompt",
  "TelescopeResults",
  "help",
  "lazy",
  "mason",
  "trouble",
  "minimap",
  "octo",
  "NeogitStatus",
  "snacks_dashboard",
}

local function set_crosshair(on)
  if vim.bo.buftype == "terminal" or vim.tbl_contains(crosshair_exclude, vim.bo.filetype) then
    on = false
  end
  vim.wo.cursorline = on
  vim.wo.cursorcolumn = on
end

autocmd({ "WinEnter", "BufWinEnter", "FileType" }, {
  group = augroup("crosshair_on", { clear = true }),
  callback = function()
    set_crosshair(true)
  end,
})

autocmd("WinLeave", {
  group = augroup("crosshair_off", { clear = true }),
  callback = function()
    set_crosshair(false)
  end,
})

-- IDE-like startup: `nvim .` (or `nvim <dir>`) opens the project with the
-- file explorer visible, instead of a single empty buffer.
autocmd("VimEnter", {
  group = augroup("open_explorer_on_dir", { clear = true }),
  callback = function()
    if vim.fn.argc() ~= 1 then
      return
    end
    local arg = vim.fn.argv(0) --[[@as string]]
    if vim.fn.isdirectory(arg) == 1 then
      vim.cmd("Neotree show dir=" .. vim.fn.fnameescape(arg))
    end
  end,
})
