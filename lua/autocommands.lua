-- Disable new line comment
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

-- test to fix the bleeding background color after closing neovim
vim.api.nvim_create_autocmd('VimLeave', {
  callback = function()
    io.write '\27[0m' -- ANSI reset: clears formatting and colors
  end,
})

-- Disable line numbers for markdown buffers
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
  pattern = '*.md',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
