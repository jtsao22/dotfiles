-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open external docs for LSP (useful for rust in particular)
local map = vim.keymap.set
map("n", "<leader>k", function()
  vim.cmd("RustLsp externalDocs")
end, { desc = "Show Rust LSP external docs" })
