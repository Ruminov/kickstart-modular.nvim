-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- REFACTOR:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- Basic
vim.o.number = true
vim.o.relativenumber = false
vim.o.cursorline = false
vim.o.wrap = true
-- TODO: 298
-- vim.o.scrolloff = 6 -- 10
vim.o.scrolloff = 10
-- vim.o.sidescrolloff = 8

-- EXPERIMENT:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- Indentation
-- Test if 2 is too cramped
-- I personally prefer 4
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
-- EXPERIMENT://///////////////////////////////////////////////////

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- Visual
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
-- WARNING: It could potentially break the UI
vim.o.cmdheight = 1 -- 1
-- WARNING: I don't know what this does
-- vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.showmode = false

-- File handling
-- EXPERIMENT:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- vim.o.backup = false
-- vim.o.writebackup = false
-- vim.o.swapfile = false
-- vim.o.autowrite = false
vim.o.undofile = true
vim.o.autoread = true
-- EXPERIMENT://///////////////////////////////////////////////////
-- REFACTOR://///////////////////////////////////////////////////

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Decrease update time
vim.o.updatetime = 250

-- EXPERIMENT:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- yazi.nvim floating window has a delay to trigger esc key
-- Decrease mapped sequence wait time to reduce delay
-- WARNING: Less wait time could break keymaps
-- vim.o.timeoutlen = 50 -- 300
-- vim.o.timeoutlen = 1000 -- 300
vim.o.timeoutlen = 1000 -- 300
-- EXPERIMENT://///////////////////////////////////////////////////

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.o.showcmd = false

-- Turn status bar global
vim.o.laststatus = 3

-- vim.filetype.add {
--   extension = {
--     sot = 'text',
--   },
-- }

-- vim: ts=2 sts=2 sw=2 et
