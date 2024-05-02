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
            commands = {
                history = {
                    view = "popup",
                },
            },
        })
        vim.keymap.set("n", "<leader>nl", function()
            require("noice").cmd("last")
        end)
        vim.keymap.set("n", "<leader>nh", function()
            require("noice").cmd("history")
        end)
        vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>")
    end,
}
