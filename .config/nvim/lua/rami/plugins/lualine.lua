-- plugin to style the neovim status line
return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "meuter/lualine-so-fancy.nvim"
    },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count
        local theme = require("kanagawa.colors").setup().theme

        local kanagawa = {
            normal = {
                a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
                b = { bg = theme.ui.bg_p2, fg = theme.syn.fun },
                c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
            },
            insert = {
                a = { bg = theme.diag.ok, fg = theme.ui.bg },
                b = { bg = theme.ui.bg, fg = theme.diag.ok },
            },
            command = {
                a = { bg = theme.syn.constant, fg = theme.ui.bg },
                b = { bg = theme.ui.bg, fg = theme.syn.constant },
            },
            visual = {
                a = { bg = theme.syn.keyword, fg = theme.ui.bg },
                b = { bg = theme.ui.bg, fg = theme.syn.keyword },
            },
            replace = {
                a = { bg = theme.syn.operator, fg = theme.ui.bg },
                b = { bg = theme.ui.bg, fg = theme.syn.operator },
            },
            inactive = {
                a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
                c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            }
        }

        if vim.g.kanagawa_lualine_bold then
            for _, mode in pairs(kanagawa) do
                mode.a.gui = "bold"
            end
        end

        -- configure lualine with modified theme
        lualine.setup({
            options = {
                theme = kanagawa
            },
            sections = {
                lualine_a = { 'branch' },
                lualine_b = {},
                lualine_c = {
                    { 'diff' },
                    { 'diagnostics' },
                    {
                        'filename',
                        path = 4,
                    }
                },
                lualine_x = {
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        color = { fg = theme.syn.fun, gui = "bold" },
                    },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "fancy_lsp_servers" },
                    { "filetype" },
                },
                lualine_y = {},
                lualine_z = { 'progress' }
            },
        })
    end,
}
