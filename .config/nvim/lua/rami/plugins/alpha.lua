-- Create welcome page and shortcuts
return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local theme = require("kanagawa.colors").setup().theme
        local cwd = "[" .. vim.fn.getcwd() .. "]"

        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = theme.syn.operator })
        vim.api.nvim_set_hl(0, "AlphaCWD", { fg = theme.syn.constant })

        -- Set header
        local header = {
            type = "text",
            val = {
                "  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         ",
                "   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      ",
                "         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    ",
                "          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄   ",
                "         ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ",
                "  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ ",
                " ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄  ",
                "⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ ",
                "⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄",
                "     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆    ",
                "      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    ",
            },
            opts = {
                position = "center",
                hl = "AlphaHeader",
            },
        }

        -- Set buttons
        local buttons = {
            type = "group",
            val = {
                { type = "text",    val = cwd, opts = { hl = "AlphaCWD", position = "center" } },
                { type = "padding", val = 2 },
                dashboard.button("-", " > Open CWD", "<CMD>Oil<CR>"),
                { type = "padding", val = 1 },
                dashboard.button("SPC n", " > New File", ":ene <BAR> startinsert <CR>"),
                { type = "padding", val = 1 },
                dashboard.button("SPC pf", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
                { type = "padding", val = 1 },
                dashboard.button("SPC ps", " > Find Word", "<cmd>Telescope live_grep<CR>"),
                { type = "padding", val = 1 },
                dashboard.button("SPC e", "󰒤 > Open Harpoon", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>"),
                { type = "padding", val = 1 },
                dashboard.button("u", "󰑖 > Update Plugins", "<cmd>Lazy update<CR>"),
                { type = "padding", val = 1 },
                dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
            },
            position = "center",
        }

        alpha.setup({
            layout = {
                { type = "padding", val = 5 },
                header,
                { type = "padding", val = 2 },
                buttons,
            },
            opts = {
                margin = 5,
            },
        })

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
        vim.keymap.set("n", "<leader>q", "<cmd>Alpha<CR>")
    end,
}
