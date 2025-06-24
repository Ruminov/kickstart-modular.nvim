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
