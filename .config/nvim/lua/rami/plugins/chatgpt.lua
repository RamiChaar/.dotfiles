-- plugin to integrate chatgpt
return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        require("chatgpt").setup({
            api_key_cmd = "pass show personal/api/openai/chatgpt",
            chat = {
                welcome_message = "How can I help you today?",
                answer_sign = "", -- 🤖
                sessions_window = {
                    active_sign = " 󰄯 ",
                    inactive_sign = " 󰄰 ",
                    current_line_sign = "",
                },
                keymaps = {
                    select_session = "<CR>",
                }
            },
            popup_layout = {
                right = {
                    width = "40%",
                }
            },
            popup_input = {
                submit = "<Enter>",
            },
        })
        vim.keymap.set('n', '<leader>gp', ":ChatGPT<CR>")
        vim.keymap.set('n', '<leader>gc', ":ChatGPTCompleteCode<CR>")
        vim.keymap.set('v', '<leader>ge', ":ChatGPTEditWithInstructions<CR>")
    end,
}
