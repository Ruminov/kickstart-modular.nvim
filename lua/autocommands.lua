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
    -- require('auto-session').AutoRestoreSession()
    require('auto-session').auto_restore_session()
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

-- Open reactive runner to current buffer
vim.api.nvim_create_user_command('ReactiveRunner', function()
  local file = vim.api.nvim_buf_get_name(0)
  local cmd = string.format('st -c floatSt -g 51x17 -e bash -c \'/home/rumi/.local/bin/reactive-runner-file.sh "%s"\'', file)

  -- Spawn the command asynchronously
  vim.loop.spawn('bash', {
    args = { '-c', cmd },
    detached = true,
  }, function(code, signal)
    -- Optional: handle exit status
    if code ~= 0 then
      vim.schedule(function()
        vim.notify('ReactiveRunner exited with code ' .. code, vim.log.levels.WARN)
      end)
    end
  end)
end, {})

-- EXPERIMENT:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
vim.api.nvim_create_user_command('GrappleQuickfix', function()
  local grapple = require 'grapple'
  grapple.reset {}

  local qflist = vim.fn.getqflist()

  for i, item in ipairs(qflist) do
    local path = item.filename
    if path and path ~= '' then
      vim.defer_fn(function()
        grapple.tag {
          path = path,
          cursor = { i, 0 },
        }
      end, i * 10) -- stagger calls by 10ms per item
    end
  end
end, {
  desc = 'Reset Grapple and tag files from quickfix list',
})
-- EXPERIMENT://///////////////////////////////////////////////////

-- FEAT:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- Floating window for .sot files
vim.api.nvim_create_user_command('SotFloat', require('custom.modules.sot').open_sot, {})
-- FEAT://///////////////////////////////////////////////////
