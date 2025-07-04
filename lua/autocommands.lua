-- Disable new line comment
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
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

-- To make sure that auto-session plugin only saves the currently visiblue buffers
-- TEST:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- vim.api.nvim_create_user_command('WipeNonVisibleBuffers', function()
--   -- 1. Gather the buffer numbers of all visible windows
--   local visible_bufs = {}
--   for _, win in ipairs(vim.api.nvim_list_wins()) do
--     local buf = vim.api.nvim_win_get_buf(win)
--     visible_bufs[buf] = true
--   end
--
--   -- 2. Delete every listed + loaded buffer not in the visible set
--   for _, buf in ipairs(vim.fn.getbufinfo { buflisted = 1 }) do
--     if not visible_bufs[buf.bufnr] then
--       vim.api.nvim_buf_delete(buf.bufnr, { force = true })
--     end
--   end
-- end, {
--   desc = 'Close all buffers except the ones currently visible in windows',
-- })
-- TEST://///////////////////////////////////////////////////

-- To make sure neovim loads LSP, treesitter, etc before autostarting the session
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('AutoSessionRestore', { clear = true }),
  callback = function()
    require('auto-session').AutoRestoreSession()
  end,
  nested = true, -- 🔑 this ensures plugin events like Treesitter are triggered first
})

-- Adjust HL fg color of statusbar items to the current status
local mode_color = {
  n = '#48CBFF', -- normal: blue
  i = '#80EE6A', -- insert: green
  v = '#D575D6', -- visual: purple
  V = '#D575D6',
  ['\22'] = '#0000FF', -- <C-v> block visual
  c = '#FFD059', -- command
  R = '#FF2727', -- replace
  t = '#56b6c2', -- terminal
}

vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    local mode = vim.fn.mode()
    local color = mode_color[mode] or '#abb2bf' -- fallback color

    vim.api.nvim_set_hl(0, 'StatusLine', { fg = color })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = color })
  end,
})
