-- Set leader keys BEFORE Lazy.nvim loads
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Automatically install Lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Ensure `lua/user/` is recognized
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/lua")
-- Load Lazy.nvim Plugins
require("lazy").setup("user.plugins")

-- Load Other Configurations
local modules = {
  "options",
  "colorscheme",
  "keymaps",
  "cmp",
  "telescope",
  "treesitter",
  "autopairs",
  "comment",
  "nvim-tree",
  "bufferline",
  "lualine",
  "toggleterm",
  "project",
  "alpha",
  "autocommands",
  "indentline",
  "fixes.illuminate_override"
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, "user." .. module)
  if not ok then
    vim.api.nvim_err_writeln("Error loading user." .. module .. "\n\n" .. err)
  end
end
