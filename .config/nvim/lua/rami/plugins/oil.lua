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
                ["<leader>e"] = function()
                    local file_name = vim.fn.input("File Name > ")
                    vim.cmd("e " .. file_name)
                    vim.cmd("w")
                end,
                ["<leader>t"] = function()
                    local curr_dir = require('oil').get_current_dir()
                    require('neo-tree.command').execute({
                        action = "show",         -- OPTIONAL, this is the default value
                        source = "filesystem",    -- OPTIONAL, this is the default value
                        position = "left",        -- OPTIONAL, this is the default value
                        reveal_file = curr_dir,   -- path to file or folder to reveal
                        reveal_force_cwd = false, -- change cwd without asking if needed
                        toggle = true;
                    })
                end,
            }
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>")
    end
}
