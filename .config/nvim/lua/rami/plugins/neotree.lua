-- plugin to enable tree view and navigation buffer
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                group_empty_dirs = true,
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    never_show = {
                        ".DS_Store",
                    },
                },
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                window = {
                    mappings = {
                        ["<bs>"] = "navigate_up",
                        ["."] = "set_root",
                        ["H"] = "toggle_hidden",
                        ["oc"] = { "order_by_created", nowait = false },
                        ["od"] = { "order_by_diagnostics", nowait = false },
                        ["og"] = { "order_by_git_status", nowait = false },
                        ["om"] = { "order_by_modified", nowait = false },
                        ["on"] = { "order_by_name", nowait = false },
                        ["os"] = { "order_by_size", nowait = false },
                        ["ot"] = { "order_by_type", nowait = false },
                    },
                },
            },
        })
    end,
    keys = {
        { "<leader>t", "<cmd>Neotree toggle reveal show<cr>"},
    }
}
