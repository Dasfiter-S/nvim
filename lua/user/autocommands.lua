-- 🧩 General Settings
vim.api.nvim_create_augroup("_general_settings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "_general_settings",
  pattern = { "qf", "help", "man", "lspinfo" },
  callback = function()
    vim.keymap.set("n", "q", ":close<CR>", { buffer = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = "_general_settings",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "_general_settings",
  callback = function()
    local ft = vim.bo.filetype
    -- Avoid applying to special plugin UIs
    if ft ~= "alpha" and ft ~= "lazy" and ft ~= "" then
      vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "_general_settings",
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- 📝 Git commit messages
vim.api.nvim_create_augroup("_git", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "_git",
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- 📝 Markdown
vim.api.nvim_create_augroup("_markdown", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "_markdown",
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- 🔄 Auto Resize Splits When Vim Window Resizes
vim.api.nvim_create_augroup("_auto_resize", { clear = true })

vim.api.nvim_create_autocmd("VimResized", {
  group = "_auto_resize",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- 🖼️ Alpha Dashboard
vim.api.nvim_create_augroup("_alpha", { clear = true })

vim.api.nvim_create_autocmd("User", {
  group = "_alpha",
  pattern = "AlphaReady",
  callback = function(args)
    vim.o.showtabline = 0
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = args.buf,
      once = true,
      callback = function()
        vim.o.showtabline = 2
      end,
    })
  end,
})

-- 🚀 LazySyncPost → re-init Noice + UI redraw
vim.api.nvim_create_autocmd("User", {
  pattern = "LazySyncPost",
  callback = function()
    vim.defer_fn(function()
      local ok, noice = pcall(require, "noice")
      if ok then
        noice.setup()
        vim.cmd("doautocmd User NoiceRedraw")
      end
      vim.cmd("redraw!")
    end, 500)
  end,
})

-- 🛠️ Optional: Autoformat on save (modern way)
--[[
vim.api.nvim_create_augroup("_lsp_format", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "_lsp_format",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
]]
