local M = { bufid = nil, winid = nil, first_line = nil }

function M.parse_first_line_data()
  local path = vim.fn.getcwd() .. '/.sot'
  local first_line = vim.fn.readfile(path, '', 1)[1]

  local description = first_line and first_line:match '^%s*(.-)%s*||.*||' or ''
  local pattern = first_line and first_line:match '||%s*(.-)%s*||' or ''
  local id = first_line and first_line:match '||.*||%s*(.-)%s*$' or ''
  M.first_line = { description, pattern, id }
end

function M.format_sot()
  -- enforce 1 whitespace per side for each || match; enforce 1 whitespace at the start and end of the line
  vim.cmd [[silent! keepp %s/\s*||\s*/ || /ge | silent! keepp %s/^\s*\(.\{-}\)\s*$/ \1 /ge]]

  -- append 2 || delimiters if there's a line without delimiters; append 1 || delimiter if there's a line with only 1 delimiter
  vim.cmd [[silent! keepp %s/^\%(.*||.*\)\@!.\+$/\0 || || /ge | silent! keepp  % s/\v^%((.*\|\|){2})@!.*\|\|.*$/\0 || /ge]]
end

function M.create_sot_entry(prefix)
  -- local key = (vim.fn.system 'uuidgen'):sub(1, 7)
  -- local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  -- vim.api.nvim_buf_set_lines(0, row, row, true, { ' ' .. prefix .. '(' .. key .. ')' .. ': ' })

  -- generate short key
  local key = (vim.fn.systemlist('uuidgen')[1]):sub(1, 7)

  -- current row (0‑indexed for API)
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1

  -- build the line
  local line = ' ' .. prefix .. '(): ' .. [[ || .+\(%s\): || ]] .. key .. ' '

  -- insert above current line
  vim.api.nvim_buf_set_lines(0, row, row, true, { line })

  -- find the position of the opening parenthesis
  local col = line:find '%(' -- Lua strings are 1‑based, nvim cursor cols are 0‑based
  vim.api.nvim_win_set_cursor(0, { row + 1, col - 1 })
end

function M.populate_qflist()
  local pattern = M.first_line[2]
  local id = M.first_line[3]

  if pattern == '' then
    return
  end

  if id and id ~= '' then
    pattern = pattern:format(id)
  end

  local cmd = { 'rg', '--vimgrep', '--sort=path', pattern, '.' }
  local output = vim.fn.systemlist(cmd)
  vim.fn.setqflist({}, 'r', { lines = output })
end

local function save_and_hide()
  -- save buffer if there are changes
  if vim.api.nvim_buf_is_valid(M.bufid) then
    if vim.bo[M.bufid].modified then
      vim.api.nvim_buf_call(M.bufid, function()
        M.format_sot()
        vim.cmd 'silent! write'
      end)
      M.parse_first_line_data()
      M.populate_qflist()
    end
  end

  -- hide buffer
  vim.api.nvim_win_hide(M.winid)
  M.winid = nil
end

function M.open_sot()
  local path = vim.fn.getcwd() .. '/.sot'

  -- ensure buffer exists and is listed
  if not M.bufid or not vim.api.nvim_buf_is_valid(M.bufid) then
    -- ensure .bat file exists
    if vim.fn.filereadable(path) == 0 then
      vim.fn.writefile({ ' description || pattern || id ', ' || || ' }, path)
      print('.sot has been created at ' .. path)
    end
    M.bufid = vim.fn.bufadd(path)
    vim.fn.bufload(M.bufid)
    vim.bo[M.bufid].buflisted = true
  end

  -- toggle window
  if M.winid and vim.api.nvim_win_is_valid(M.winid) then
    save_and_hide()
    return
  end

  -- create window
  M.winid = vim.api.nvim_open_win(M.bufid, true, {
    relative = 'editor',
    width = vim.o.columns,
    height = vim.o.lines - 2,
    row = 0,
    col = 0,
    style = 'minimal',
    border = 'none',
  })
  -- (experiment) Enable cursor line highlight
  -- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  vim.opt_local.cursorline = true
  -- /////////////////////////////////////////////////////

  -- save & hide (buffer-local) with q key
  vim.keymap.set({ 'n', 'x' }, 'q', function()
    save_and_hide()
  end, { buffer = M.bufid, nowait = true, silent = true, desc = 'Close .sot window' })

  -- test
  vim.keymap.set('n', '<leader>ñ', function()
    for _, value in ipairs(M.first_line) do
      print('a' .. value .. 'z')
    end
  end, { buffer = M.bufid, silent = true, desc = 'test get first line data' })

  -- save & hide (buffer-local) if focus leaves the window
  vim.api.nvim_create_autocmd('WinLeave', {
    buffer = M.bufid,
    once = true,
    callback = save_and_hide,
  })
end

return M
