return {
  {
    'folke/trouble.nvim',
    opts = {
      focus = true, -- Focus the window when opened
      auto_preview = true, -- automatically open preview when on an item
      auto_refresh = false, -- auto refresh when open
      auto_jump = true, -- auto jump to the item when there's only one
      indent_guides = false, -- show indent guides
      icons = {
        indent = { middle = '', last = '', top = '', ws = '', fold_open = '', fold_closed = '' }, -- no fold icons
        folder_closed = '',
        folder_open = '',
        kinds = {}, -- remove all LSP symbol icons
      },
      follow = false, -- Follow the current item
      win = {
        padding = { top = 0, left = 0 },
        wo = {
          wrap = true,
        },
      },
      modes = {
        qflist = { -- Configure symbols mode
          -- win = {
          --   type = 'split', -- split window
          --   relative = 'win', -- relative to current window
          --   -- position = 'right', -- right side
          --   -- size = 0.3, -- 30% of the window
          --   position = 'right', -- right side
          --   size = 0.50, -- 30% of the window
          -- },
          groups = {
            { 'filename', format = '{file_icon}{filename}{pointer_l}{count}{pointer_r}' },
          },
        },
        diagnostics = {
          -- win = {
          --   type = 'split', -- split window
          --   relative = 'win', -- relative to current window
          --   -- position = 'right', -- right side
          --   -- size = 0.3, -- 30% of the window
          --   -- position = 'bottom', -- right side
          --   position = 'right', -- right side
          --   size = 0.50, -- 30% of the window
          -- },
          groups = {
            {
              'filename',
              format = '{space}{basename:TroubleFilename}{space}{pointer_l}{count}{pointer_r}',
            },
          },
        },
      },
      warn_no_results = false, -- show a warning when there are no results
      max_items = 100, -- limit number of items that can be displayed per section
      keys = {
        -- go down to next item (accepts count)
        l = 'next',
        -- go up to prev item (accepts count)
        h = 'prev',
        ['<esc>'] = 'close',
        ['<c-s>'] = 'jump_split_close',
        ['<c-v>'] = 'jump_vsplit_close',
      },
      throttle = {
        refresh = 20, -- fetches new data when needed
        update = 10, -- updates the window
        render = 10, -- renders the window
        follow = 100, -- follows the current item
        preview = { ms = 100, debounce = true }, -- shows the preview for the current item
      },
    }, -- for default options, refer to the configuration section for custom setup.
    -- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    config = function(_, opts)
      require('trouble').setup(opts)

      local format = require('trouble.format').formatters

      format.file_icon = function(ctx)
        local item = ctx.item
        local file = vim.fn.fnamemodify(item.filename, ':t')
        local ext = vim.fn.fnamemodify(item.filename, ':e')
        local icon, _ = require('trouble.format').get_icon(file, ext)
        return icon and { text = ' ' .. icon .. ' ', hl = 'TroubleFilename' } or ''
      end

      format.count = function(ctx)
        local n = ctx.node:count()
        if n > 1 then
          -- return { text = (' x%d '):format(n) }
          return { text = (' ×%d '):format(n) }
        else
          return ''
        end
      end

      format.filename = function(ctx)
        return {
          text = ('%s '):format(vim.fn.fnamemodify(ctx.item.filename, ':p:~:.')),
        }
      end

      format.dirname = function(ctx)
        return {
          text = ('%s'):format(vim.fn.fnamemodify(ctx.item.dirname, ':p:~:.')),
          hl = 'TrackHL',
        }
      end

      format.space = function()
        return {
          { text = ' ', hl = 'TroubleFilename' },
        }
      end

      format.pointer_l = function(ctx)
        local n = ctx.node:count()
        local color
        if n > 1 then
          color = 'TroublePointerL'
        else
          color = 'TroublePointerLNoBG'
        end
        return { text = ('%s'):format '', hl = color }
      end

      format.pointer_r = function(ctx)
        local n = ctx.node:count()
        if n > 1 then
          return {
            { text = ('%s'):format '', hl = 'TroublePointerR' },
          }
        else
          return ''
        end
      end
    end,
    -- /////////////////////////////////////////////////////
    cmd = 'Trouble',

    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>l',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xq',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
      {
        '<leader>q',
        function()
          -- require('custom.modules.sot').populate_qflist()
          require('trouble').toggle 'qflist'
        end,
        desc = 'Quickfix List from .sot (Trouble)',
      },
      {
        'H',
        function()
          require('trouble').prev { mode = 'qflist' }
        end,
        desc = 'Jump to previous quickfix list item',
      },
      {
        'L',
        function()
          require('trouble').next { mode = 'qflist' }
        end,
        desc = 'Jump to next quickfix list item',
      },
    },
  },
}
