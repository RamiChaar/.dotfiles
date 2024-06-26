return {
  "f-person/git-blame.nvim",
  config = function()
    require('gitblame').setup {
      enabled = true,
      date_format = "%r",
      delay = 200,
    }
  end,
  keys = {
    { "<leader>gb", ":GitBlameToggle<CR>" }
  }
}
