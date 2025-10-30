-- [[ Basic Keymaps ]]
--  See `:help key()`

local key = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
key('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- refactor(7958e16): obsolete keymaps to replace/delete
-- key('n', 'H', '<cmd>cprev<CR>zz', { desc = 'Jumpt to previous loclist item' })
-- key('n', 'L', '<cmd>cnext<CR>zz', { desc = 'Jumpt to next loclist item' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- key('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- key('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- key('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- key('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- key('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
key('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
key('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
key('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
key('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- key("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- key("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- key("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- key("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Don't save deleted text on clipboard
key({ 'n', 'v' }, 'c', '"_c', { noremap = true, silent = true })
key({ 'n', 'v' }, 'd', '"_d', { noremap = true, silent = true })
key({ 'n', 'v' }, 'D', '"_D', { noremap = true, silent = true })
key('n', 'x', '"_x', { noremap = true, silent = true })

-- NOTE: Keymaps from lazyvim

-- better up/down
key({ 'n', 'x' }, 'j', 'gj', { desc = 'Down', noremap = true, silent = true })
key({ 'n', 'x' }, '<Down>', 'gj', { desc = 'Down', noremap = true, silent = true })
key({ 'n', 'x' }, 'k', 'gk', { desc = 'Up', noremap = true, silent = true })
key({ 'n', 'x' }, '<Up>', 'gk', { desc = 'Up', noremap = true, silent = true })

-- Move Lines
key('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
key('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
key('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
key('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
key('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
key('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- save file
-- key({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
key({ 'i', 'x', 'n', 's' }, '<C-s>', function()
  vim.cmd 'write'

  local path = vim.fn.getcwd() .. '/.sot'
  if vim.fn.filereadable(path) == 1 then
    require('custom.modules.sot').populate_qflist()
  end
end, { desc = 'Save File' })

-- Keep the selection while indenting
key('v', '<', '<gv')
key('v', '>', '>gv')

-- Fix keymap conflict
vim.keymap.del('n', 'gc')

-- commenting
key('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
key('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- UI config
-- EXPERIMENT:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
key('n', '<leader>ud', '<cmd>lua vim.diagnostic.config({virtual_text=false})<CR>', { desc = 'Disable text diagnostics' })
key('n', '<leader>ue', '<cmd>lua vim.diagnostic.config({virtual_text=true})<CR>', { desc = 'Enable text diagnostics' })
key('n', '<leader>ut', function()
  require('tiny-inline-diagnostic').toggle()
end, { desc = 'Toggle tiny inline diagnostics' })
-- experiment://///////////////////////////////////////////////////

-- Resize window using <ctrl> arrow keys
key('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
key('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
key('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
key('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Grug-far keymaps
key({ 'n', 'x' }, '<leader>gg', function()
  require('grug-far').open { prefills = { paths = vim.fn.expand '%' } }
end, { desc = 'grug-far: Search current file' })

key({ 'n', 'x' }, '<leader>gG', function()
  require('grug-far').open()
end, { desc = 'grug-far: Search all files' })

key({ 'n', 'x' }, '<leader>gw', function()
  require('grug-far').open { prefills = { search = vim.fn.expand '<cword>', paths = vim.fn.expand '%' } }
end, { desc = 'grug-far: Search the current word under cursor' })

key({ 'n', 'x' }, '<leader>gW', function()
  require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } }
end, { desc = 'grug-far: Search the current word under cursor' })

key({ 'n', 'x' }, '<leader>gv', function()
  require('grug-far').open { visualSelectionUsage = 'operate-within-range' }
end, { desc = 'grug-far: Search within range' })

-- USER KEYMAPS

key('n', 'vv', 'viw', { noremap = true, silent = true })

-- TEST:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- Duplicate a line and comment out the first line
key('n', 'yc', 'yygccp', { remap = true })

key('v', '<leader>yc', 'ygvgc`>p', { remap = true, desc = '[C]opy to a comment above' })

-- key('n', '<C-c>', 'ciw')
key('n', '<C-c>', '"_ciw', { noremap = true, silent = true })
key('n', '<C-n>', vim.lsp.buf.rename)

-- TEST://///////////////////////////////////////////////////

-- Code runner
key('n', '<leader>or', '<cmd>ReactiveRunner<CR>', { desc = 'Open reactive runner for current file' })

-- .sot
key({ 'n', 'x' }, '<leader>k', require('custom.modules.sot').open_sot, { desc = 'Toggle .sot file' })

-- vim: ts=2 sts=2 sw=2 et
