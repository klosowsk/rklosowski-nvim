local opt = vim.opt
local api = vim.api

opt.tabstop = 2        -- tab = 2 espaços
opt.shiftwidth = 2     -- indentação = 2 espaços
opt.expandtab = true   -- converte tab em espaços
opt.smartindent = true -- indenta automaticamente

opt.number = true          -- mostra número da linha
opt.relativenumber = true  -- mostra número relativo


opt.autoread = true
api.nvim_create_autocmd(
  { 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' },
  { command = 'checktime' }
)
opt.updatetime = 300
