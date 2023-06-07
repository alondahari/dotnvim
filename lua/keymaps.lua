-- I like to use Ctrl-C for esc when in insert mode
vim.keymap.set('i', '<c-c>', '<esc>')

-- ----------------------------------------------
-- Fuzzy Finder Configuration
-- ----------------------------------------------
vim.keymap.set('n', '<leader>f', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
vim.keymap.set('n', '<leader>w', '<cmd>lua require(\'telescope.builtin\').find_files{hidden=true, no_ignore=true}<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
vim.keymap.set('n', '<leader>g', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')

-- ----------------------------------------------
-- Alt
-- ----------------------------------------------

-- ----------------------------------------------
-- Rename Current File
-- ----------------------------------------------
vim.keymap.set('n', '<leader>n', function()
  local old_name = vim.fn.expand('%')
  local new_name = vim.fn.input('New file name: ', vim.fn.expand('%'), 'file')
  rename(old_name, new_name)
end)

-- Open current buffer in Marked 2 for previewing
vim.keymap.set('n', '<leader>mp', '<cmd>!open -a \'Marked\' "%"<CR>')

-- Closing buffers
vim.keymap.set('n', '<leader>xx', '<cmd>%bd|e#|bd#<cr>') -- close all other buffers
vim.keymap.set('n', '<leader>xt', '<cmd>bd<cr>') -- close this buffer
vim.keymap.set('n', '<leader>xa', '<cmd>%bd<cr>') -- close all buffers

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>tn", function()
  require("trouble").next({skip_groups = true, jump = true})
end)

-- Add new lines
vim.keymap.set('n', '<Enter>', 'o<ESC>', {silent = true})
vim.keymap.set('n', '<S-Enter>', 'O<ESC>', {silent = true})
