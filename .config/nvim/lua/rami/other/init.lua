require('rami.other.bps-storage')

vim.cmd [[ autocmd BufRead * :lua load_breakpoints() ]]
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    store_breakpoints(false)
  end,
})
