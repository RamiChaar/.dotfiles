-- Color scheme
return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
        require('kanagawa').setup({
            colors = {
                palette = {
                    -- syn.operator - dragonred - c4746e
                    samuraiRed = "#c4746e"
                },
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        }
                    }
                }
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },
                    NormalDark = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                }
            end,
        })
        vim.cmd("colorscheme kanagawa-dragon")
    end,
}
