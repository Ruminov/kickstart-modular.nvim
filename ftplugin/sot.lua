-- Attach CsvView to every .sot file
vim.schedule(function()
  local csvview = require 'csvview'
  if not csvview.is_enabled(0) then
    csvview.enable(0, {})
  end
end)

-- Disable swap for .sot files
vim.opt_local.swapfile = false

-- Add support to commentstring
vim.bo.commentstring = '# %s'

local key = vim.keymap.set

-- moving line keymaps compatible with floating window
key('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>", { desc = 'Move Down', buffer = true })
key('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>", { desc = 'Move Up', buffer = true })
key('i', '<A-j>', '<esc><cmd>m .+1<cr>gi', { desc = 'Move Down', buffer = true })
key('i', '<A-k>', '<esc><cmd>m .-2<cr>gi', { desc = 'Move Up', buffer = true })
key('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gvgv", { desc = 'Move Down', buffer = true })
key('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gvgv", { desc = 'Move Up', buffer = true })

local sot = require 'custom.modules.sot'

-- todo-comments support for .sot buffer
local entry_type = {
  ['<leader>te'] = 'feat',
  ['<leader>tf'] = 'fix',
  ['<leader>tr'] = 'refactor',
  ['<leader>tc'] = 'chore',
  ['<leader>tt'] = 'test',
  ['<leader>tp'] = 'perf',
  ['<leader>ts'] = 'style',
  ['<leader>td'] = 'docs',
  ['<leader>ti'] = 'ci',
}

for k, v in pairs(entry_type) do
  key('n', k, function()
    sot.create_sot_entry(v)
  end, { desc = 'Create .sot ' .. v .. ' entry', buffer = true })
end

-- Disable todo-comments line delimiter
-- vim.keymap.del('n', '<leader>l', { buffer = true })
-- FEAT://///////////////////////////////////////////////////

key({ 'n', 'x' }, '<leader>f', sot.format_sot, { desc = 'Format .sot file', buffer = true })
key('n', '<A-g>', 'VxggP', { buffer = true, silent = true })

-- Disable add line delimiter global keymap for .sot files
key({ 'n', 'x' }, '<leader>tl', function() end, { desc = 'which_key_ignore', buffer = true })
