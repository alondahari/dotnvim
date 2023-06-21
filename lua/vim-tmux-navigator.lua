vim.g.tmux_navigator_no_mappings = '1'

vim.keymap.set("n", "<C-Left>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-Up>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<C-/>", "<cmd>TmuxNavigatePrevious<cr>")
