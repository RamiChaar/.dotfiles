-- plugin to support adding / removing / changing surrounded character
return {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                normal = "<leader>sa",
                delete = "<leader>sd",
                change = "<leader>sc",
            },
        })
    end,
}
