local op = require('op')

op.setup({
  signin_on_start = true
})

vim.keymap.set("n", "<space>ld", function ()
  local dev_db = op.get_secret('FanInc dev database connection', 'url')
  local stage_db = op.get_secret('FanInc stage database connection', 'url')
  local prod_db = op.get_secret('FanInc prod database connection', 'url')
  vim.g.dbs = {
    dev = dev_db,
    stage = stage_db,
    prod = prod_db
  }
  print('dbs loaded successfully')
  vim.cmd('DBUI')
end)
