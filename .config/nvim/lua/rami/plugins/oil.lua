-- default file explorer / editor
return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        is_always_hidden = function(name, bufnr)
          if name == ".DS_Store" then
            return true
          end
          return false
        end,
      },
      keymaps = {
        ["<C-h>"] = "<cmd>TmuxNavigateLeft<cr>",
        ["<C-l>"] = "<cmd>TmuxNavigateRight<cr>",
        ["<leader>n"] = function()
          local file_name = vim.fn.input("File Name > ")
          local curr_dir = require('oil').get_current_dir()
          print("e " .. curr_dir .. file_name)
          vim.cmd("e " .. curr_dir .. file_name)
          vim.cmd("w")
        end,
      }
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>")
  end
}
