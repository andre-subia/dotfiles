-- Remembers whichever colorscheme you last picked with <leader>uc (Telescope)
-- and re-applies it on the next startup. State lives outside the repo
-- (stdpath("state")), it's a local runtime preference, not shared config.
local state_file = vim.fn.stdpath("state") .. "/last_colorscheme"

local function read_saved()
  local f = io.open(state_file, "r")
  if not f then
    return nil
  end
  local name = f:read("*l")
  f:close()
  return name and #name > 0 and name or nil
end

local function save(name)
  local f = io.open(state_file, "w")
  if f then
    f:write(name)
    f:close()
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("restore_colorscheme", { clear = true }),
  callback = function()
    local saved = read_saved()
    if saved and saved ~= vim.g.colors_name then
      pcall(vim.cmd.colorscheme, saved)
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("persist_colorscheme", { clear = true }),
  callback = function(event)
    save(event.match)
  end,
})
