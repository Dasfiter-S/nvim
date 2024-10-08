local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

ibl.setup({
  indent = {
    char = "▏",
  },
  exclude = {
    filetypes = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
    },
    buftypes = { "terminal", "nofile" },
  },
  scope = {
    enabled = true, -- This was the equivalent of `show_current_context`
  },
})
