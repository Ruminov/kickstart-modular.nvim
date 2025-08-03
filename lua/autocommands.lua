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

-- vim.api.nvim_create_autocmd('ModeChanged', {
--   pattern = '*',
--   callback = function()
--     local mode = vim.fn.mode()
--     local color = mode_color[mode] or '#abb2bf' -- fallback color
--
--     vim.api.nvim_set_hl(0, 'StatusLine', { fg = color })
--     vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = color })
--   end,
-- })
