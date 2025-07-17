-- Disable illuminate's on_cursor_moved entirely to stop null-ls crashing
local ok, illuminate = pcall(require, "illuminate")
if not ok then return end

-- Override the cursor movement handler to do nothing
illuminate.on_cursor_moved = function()
  -- vim.notify("[ILLUMINATE] on_cursor_moved blocked (patched)", vim.log.levels.DEBUG)
end
