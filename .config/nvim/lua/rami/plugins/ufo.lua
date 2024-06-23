-- code folding
return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    local ufo = require("ufo")

    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end
    })
    vim.keymap.set('n', '<leader>oz', ufo.openAllFolds)
    vim.keymap.set('n', '<leader>cz', ufo.closeAllFolds)
    vim.keymap.set("n", "<leader>z", "za")
  end
}
