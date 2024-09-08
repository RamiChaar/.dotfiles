-- plugin for better nvim UI for commands, searching, and messages
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        format = {
          cmdline = { icon = "" },
          search_down = { icon = " " },
          search_up = { icon = " " },
        },
      },
      routes = {
        { filter = { event = "msg_show" }, view = "mini" },
        { filter = { event = "notify" }, view = "mini" },
        { filter = { event = "lsp" }, view = "mini" }
      },
      commands = {
        history = {
          view = "popup",
        },
      }
    })
    vim.keymap.set("n", "<leader>ml", function()
      require("noice").cmd("last")
    end)
    vim.keymap.set("n", "<leader>mh", function()
      require("noice").cmd("history")
    end)
    vim.keymap.set("n", "<leader>md", "<cmd>NoiceDismiss<CR>")
  end,
}
