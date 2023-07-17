local api = vim.api

local fugitiveGroup = api.nvim_create_augroup("FugitiveCustom", { clear = true })
api.nvim_create_autocmd("User", {
  command = "nmap <buffer> dt :Gtabedit <Plug><cfile><Bar>Gdiffsplit!<CR>",
  pattern = "FugitiveIndex",
  group = fugitiveGroup,
})

vim.keymap.set('n', '<leader>tc', ':tabc<cr>')

vim.keymap.set('n', '<leader>gs', ':vert top Git|vert res 80<cr>')
vim.keymap.set('n', '<leader>grc', ':Git rebase --continue<cr>')
