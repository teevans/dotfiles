-- Testing helper

return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>t', ':silent TestNearest<CR>' },
    { '<Leader>T', ':silent TestFile<CR>' },
    { '<Leader>S', ':silent TestSuite<CR>' },
    { '<Leader>l', ':silent TestLast<CR>' },
    -- { '<Leader>tv', ':silent TestVisit<CR>' },
  },
  dependencies = { 'voldikss/vim-floaterm' },
  config = function()
    vim.cmd([[
      let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '--colors=always'

      function! FloatermStrategy(cmd)
        execute 'silent FloatermSend q'
        execute 'silent FloatermKill'
        execute 'FloatermNew! '.a:cmd.' |less -X'
      endfunction

      let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
      let g:test#strategy = 'floaterm'
    ]])
  end
}
