local hl = vim.api.nvim_set_hl

-- Background transparent for the float windows
hl(0, 'NormalFloat', { fg = 'none', bg = 'none' })
hl(0, 'FloatBorder', { fg = 'none', bg = 'none' })
hl(0, 'FloatTitle', { fg = 'none', bg = 'none' })

-- No highlight references for the current word
hl(0, 'LspReferenceText', { link = 'NONE' })
hl(0, 'LspReferenceRead', { link = 'NONE' })
hl(0, 'LspReferenceWrite', { link = 'NONE' })

-- Background transparent for the blink suggestions
hl(0, 'Pmenu', { fg = 'none', bg = 'none' })
-- hl(0, "PmenuSel", { fg = "none", bg = "none" })

-- Neovim layout color redraw
hl(0, 'LineNr', { fg = '#676767', bg = 'none' })

-- Test to fix the neovim background color bleeding
-- hl(0, 'NormalNC', { bg = '#1C1C1C' }) -- Optional: inactive windows
-- hl(0, 'Normal', { bg = '#1C1C1C' }) -- Global default bg

-- Lazy.nvim plugin
hl(0, 'LazySpecial', { fg = '#48CBFF' })
hl(0, 'LazyProgressDone', { fg = '#80EE6A' })
hl(0, 'LazyReasonKeys', { fg = '#FF6BA8' })
hl(0, 'LazyReasonPlugin', { fg = '#FFD059' })
hl(0, 'LazyReasonSource', { fg = '#FFD059' })
hl(0, 'LazyReasonEvent', { fg = '#FFD059' })
hl(0, 'LazyReasonStart', { fg = '#FFD059' })

-- fzf-lua
hl(0, 'FzfLuaBorder', { fg = '#505050' })
hl(0, 'FzfLuaTitle', { fg = '#828282' })
hl(0, 'FzfLuaFzfPrompt', { link = 'Normal' })
hl(0, 'FzfLuaLivePrompt', { link = 'Normal' })

-- grapple.nvim
-- hl(0, 'GrappleNormal', { link = 'Normal' })
hl(0, 'GrappleTitle', { link = 'Normal' })
hl(0, 'GrappleBorder', { link = 'Normal' })

-- Custom highlight groups
hl(0, 'TrackHL', { fg = '#FF0000', bg = '#00FF00' })
hl(0, 'SourcePrompt', { fg = '#00AFFF' })
