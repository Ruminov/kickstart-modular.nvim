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

local function create_comment(prefix)
  local key = require('custom.modules.sot').first_line[3]
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1

  local comment_line = (vim.bo.commentstring):format(prefix)
  if key and key ~= '' then
    comment_line = comment_line .. '(' .. key .. '):  '
  else
    comment_line = comment_line .. ':  '
  end
  local col = comment_line:find '%:'
  vim.api.nvim_buf_set_lines(0, row, row, true, { comment_line })
  vim.api.nvim_win_set_cursor(0, { row + 1, col })

  -- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  -- finally, drop into insert mode
  vim.api.nvim_feedkeys('a', 'n', false)
  -- /////////////////////////////////////////////////////
end

local key = vim.keymap.set

-- todo comment keymaps
for k, v in pairs(entry_type) do
  key({ 'n', 'x' }, k, function()
    create_comment(v)
  end, { desc = 'Create ' .. v .. ' comment' })
end

-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
key('n', '<leader>tl', function()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1

  local function comment_line(string)
    return (vim.bo.commentstring):format(string)
  end
  local lines = {
    comment_line(string.rep('\\', 53)),
    comment_line(string.rep('/', 53)),
  }

  vim.api.nvim_buf_set_lines(0, row, row, true, lines)
end, { desc = 'Add line delimiter' })
-- /////////////////////////////////////////////////////
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
key('x', '<leader>tl', function()
  -- Get current visual selection bounds (1-based)
  local start_row = vim.fn.line 'v'
  local end_row = vim.fn.line '.'

  if start_row > end_row then
    start_row, end_row = end_row, start_row
  end

  -- Convert to 0-based for nvim_buf_set_lines
  start_row, end_row = start_row - 1, end_row - 1

  -- Comment formatter
  local function comment_line(str)
    return vim.bo.commentstring:format(str)
  end

  local top_line = comment_line(string.rep('\\', 53))
  local bottom_line = comment_line(string.rep('/', 53))

  -- Insert bottom first (after selection)
  vim.api.nvim_buf_set_lines(0, end_row + 1, end_row + 1, true, { bottom_line })

  -- Insert top (before selection)
  vim.api.nvim_buf_set_lines(0, start_row, start_row, true, { top_line })
end, { desc = 'Add line delimiter to visual highlight' })
-- /////////////////////////////////////////////////////
-- feat(339cbb6): add warning keymap

-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
      gui_style = {
        fg = 'NONE', -- The gui style to use for the fg highlight group.
        bg = 'NONE', -- The gui style to use for the bg highlight group.
      },
      highlight = {
        multiline = false, -- enable multine todo comments
        -- TODO(202): change todo-comments highlight pattern
        keyword = 'fg', -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = 'fg', -- "fg" or "bg" or empty
        comments_only = true, -- uses treesitter to match keywords in comments only
        pattern = [[.*<(KEYWORDS)%(\(\w{7}\))?:]], -- pattern or table of patterns, used for highlighting (vim regex)
        exclude = {}, -- list of file types to exclude highlighting
      },
      colors = {
        fix = { 'SourceRed' },
        todo = { 'cyan-fg-100' },
        cc = { 'cyan-fg-100' },
        warning = { 'SourceOrange' },
        -- test = { 'cyan-fg-200' },
        test = { 'gray-fg-100' },
        default = { 'gray-fg-100' },
      },

      keywords = {
        -- Todocomments purpose: Repair, Improve, Create, Inform, Review
        -- Repair: FIX, DEBUG
        -- Improve: TODO, REFACTOR
        -- Create: TODO, FEAT
        -- Inform: WARNING, NOTE
        -- Review: TEST, EXPERIMENT

        CC = { color = 'cc', alt = { 'feat', 'fix', 'refactor', 'chore', 'test', 'perf', 'style', 'docs', 'ci' } },

        FIX = { color = 'fix', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
        DEBUG = { color = 'fix' },

        TODO = { color = 'todo' },
        FEAT = { color = 'todo' },

        REFACTOR = { color = 'todo' },

        WARNING = { color = 'warning', alt = { 'WARN' } },
        NOTE = { color = 'warning' },

        TEST = { color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
        EXPERIMENT = { color = 'test' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
