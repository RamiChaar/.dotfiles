return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local function shortenCWD(cwd, max_width)
            local cwd_width = string.len(cwd)
            if cwd_width <= max_width then
                return cwd
            else
                local directories = vim.split(cwd, "/")
                local shortened_cwd = ""
                while #directories > 1 do
                    table.remove(directories, 1) -- Remove the leftmost directory
                    shortened_cwd = table.concat(directories, "/")
                    local shortened_width = string.len(shortened_cwd)
                    if shortened_width <= max_width then
                        return shortened_cwd
                    end
                end
                return cwd
            end
        end
        local header_width = 69
        local cwd = shortenCWD(vim.fn.getcwd(), header_width)
        local cwd_width = string.len(cwd)
        local left_padding = math.floor((header_width - cwd_width) / 2)
        local right_padding = header_width - cwd_width - left_padding

        -- Set header
        dashboard.section.header.opts.hl = "CmpItemKindSnippet"
        dashboard.section.header.val = {
            "",
            "",
            "      ⠀   ⠀⠀ ⠀ ⠀  ⠀⢀⠡⠤⠐⠚⠒⠂⣀⠴⢒⠤⠂⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ",
            "          ⠀ ⠀ ⠀⡐⠄⠂⠉⢀⡄⢀⢠⡀⢒⡢⣞⠒⡴⡸⠕⣄⠵⢪⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                 ",
            "           ⠁⠲⠘⠁⠀⠀⢠⡸⣺⣷⣽⣿⣷⣾⣿⣿⣧⣥⢢⣋⠢⣈⡃⠁⠐⠤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀           ⠀     ",
            "        ⢒⡀⠗⠁⠀⠠⠀⠀⠀⠘⠿⠿⢿⡿⣿⣿⣿⣿⣿⣿⣿⣿⠋⢺⡤⣮⡂⢱⣂⣈⠴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀           ⠀     ",
            "     ⠶⠛⠋⡁⠀⢀⡠⠀⡢⣖⡀⡀⠰⡒⢦⡙⠯⠟⣿⣿⣿⣿⣿⠋⠀⠀⠉⠒⠄⠓⢆⡈⢨⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀     ",
            "     ⣠⡶⠴⡥⠒⣾⣷⣤⡆⢁⡯⠳⠻⣷⡤⣼⣯⣌⣀⡼⣮⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡠⠂⠁⣠     ",
            "     ⣗⣮⠲⣶⣷⣽⣾⣿⡿⣩⣝⣶⣆⠐⢎⣯⣽⣿⣿⣿⣿⢯⣯⢆⠀⠀⠠⠀⠀⠀⡀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠄⠀⠠⠀⡠⣀⠄⠊⢀⣠⣥⣠     ",
            "     ⣐⠦⡄⠸⢝⡻⠿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡿⠟⠁⠀⠈⠉⠙⠿⣧⣅⣦⢼⣤⢣⣠⢰⣀⣢⣰⣈⣰⣴⣈⣤⣒⣤⣰⣬⣴⣶⣺⣴⡿⣗⡾⠙⠁⢀⣠⣨⣋⣿⣿     ",
            "     ⢿⣾⣲⣻⣾⣏⢷⡡⡯⣣⣹⣿⡻⠛⠓⠉⠀⠀⡀⣌⡆⠀⠀⠈⠚⣙⢛⠿⣿⣿⣿⣿⣿⣿⡿⢟⠉⠉⠻⣿⣿⣿⣿⣿⡿⠿⣟⠳⠛⠉⢐⣄⣖⣶⡿⠿⣛⠏⠋     ",
            "     ⢊⠹⠛⠛⠛⠛⠁⠈⠉⠁⢌⠀⠀⢀⣀⣴⣂⠌⠒⠔⣉⠘⠢⢲⡰⠈⠢⡴⣀⢩⡛⢛⠿⠷⠿⢽⣿⡾⠷⠶⠿⠿⣋⢲⣠⣑⡤⠶⠮⠓⢒⣁⣉⡲⠚⠉⠀⣀⣤     ",
            "     ⠠⠋⢆⢖⡆⠲⠑⡠⣤⡴⠛⢡⠰⠀⠈⠀⢨⣢⢠⡤⡗⢀⠹⣿⣯⡲⣷⣌⡙⠳⢿⣶⣝⡶⣄⡀⠀⠈⣉⠉⠁⠡⠤⣀⣀⣤⡤⣤⣼⣿⠭⠋⠁⠐⠶⣿⣿⣛⣛     ",
            "     ⣶⣿⡷⢵⣿⣿⣷⡛⣻⣐⢩⣭⡊⠋⡴⢣⠔⠃⢼⣴⣦⡁⡀⠙⢿⣿⣶⣽⡞⣿⠯⣵⣫⣽⠿⠛⡿⠶⠮⠭⢿⣾⣿⣿⣷⠿⠏⠋⣉⣀⣰⣖⣶⣿⣿⣯⣽⣿⣿     ",
            "     ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⡰⣢⢶⢰⡔⡖⢫⠿⢾⣧⣆⢬⠙⠛⠿⠿⢷⣶⣤⣭⣭⣭⠭⠭⠭⠈⠘⠂⠈⠷⠶⠶⠶⠿⠾⠟⠛⠋⠉⠉⠁⠉⠉⠉⠉     ",
            "",
            "",
            string.rep(" ", left_padding) .. cwd .. string.rep(" ", right_padding),
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("-", " > Open CWD", "<CMD>Oil<CR>"),
            dashboard.button("e", " > New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("s", " > Find Word", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("h", "󰒤 > Open Harpoon", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>"),
            dashboard.button("u", "󰑖 > Update Plugins", "<cmd>Lazy update<CR>"),
            dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

        vim.keymap.set("n", "<leader>q", "<cmd>Alpha<CR>")
    end,
}
