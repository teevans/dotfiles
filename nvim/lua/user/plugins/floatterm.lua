--- Floating terminal

return {
  'voldikss/vim-floaterm',
  keys = {
    { '<leader><tab>', ':FloatermToggle<CR>' },
    { '<leader><tab>', '<Esc>:FloatermToggle<CR>', mode = 'i' },
    { '<leader><tab>', '<C-\\><C-n>:FloatermToggle<CR>', mode = 't' },
  },
  cmd = { 'FloatermToggle' },
  init = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
  end,
}
