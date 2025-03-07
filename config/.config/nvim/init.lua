-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").clangd.setup({})

vim.cmd('let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"')
vim.cmd('let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"')
vim.cmd("set termguicolors")
