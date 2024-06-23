-- plugin for fzf-lua fuzzy finder
return {
    "ibhagwan/fzf-lua",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local ok, fzf = pcall(require, "fzf-lua")
        local actions = require('fzf-lua.actions')
        local path = require('fzf-lua.path')
        if not ok then
            return
        end
        fzf.setup({
            winopts = {
                border = "single",
                preview = {
                    border = "border",
                    title = false,
                    layout = "vertical",
                },
            },
            files = {
                formatter = "path.filename_first",
                git_icons = true,
                prompt = "Files> ",
                no_header = true,
                cwd_header = false,
                cwd_prompt = false,
            },
            grep = {
                prompt = 'Rg❯ ',
                input_prompt = 'Grep For❯ ',
                git_icons = true,
                no_header = true,
                no_header_i = true,
                cwd_header = false,
                cwd_prompt = false,
                cmd = "rg --line-number --no-heading --color=always -i -e",
                grep_opts         = "--binary-files=without-match --recursive --color=auto --perl-regexp -e",
                rg_opts           = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
                actions = {
                    ["ctrl-w"] = {
                        function(_, opts)
                            local flag = "-w"
                            actions.toggle_flag(_, vim.tbl_extend("force", opts, { toggle_flag = flag }))
                        end
                    },
                    ["ctrl-i"] = {
                        function(_, opts)
                            local flag = "-i"
                            actions.toggle_flag(_, vim.tbl_extend("force", opts, { toggle_flag = flag }))
                        end
                    },
                }
            },
            git = {
                status = {
                    prompt = "Git Status> ",
                    formatter = "path.filename_first",
                    git_icons = true,
                    no_header = true,
                    cwd_header = false,
                    cwd_prompt = false,
                }
            },
            diagnostics = {
                formatter = "path.filename_first",
                git_icons = true,
                prompt = "Diagnostics> ",
                no_header = true,
                cwd_header = false,
                cwd_prompt = false,
            }
        })
    end,
    keys = {
        { "<leader>pf", "<cmd>FzfLua files<CR>",                    desc = "Open fzf files" },
        { "<leader>pg", "<cmd>FzfLua git_status<CR>",               desc = "Open fzf git status" },
        { "<leader>ps", "<cmd>FzfLua live_grep_native<CR>",         desc = "Open fzf grep" },
        { "<leader>pd", "<cmd>FzfLua lsp_document_diagnostics<CR>", desc = "Show buffer diagnostics" },
        { "<leader>pr", "<cmd>FzfLua lsp_references<CR>",           desc = "Show lsp reference" },
        { "<leader>pe", "<cmd>FzfLua lsp_definitions<CR>",          desc = "Show lsp definitions" },
        { "<leader>pi", "<cmd>FzfLua lsp_implementations<CR>",      desc = "Show lsp implementation" },
        { "<leader>pa", "<cmd>FzfLua resume<CR>",                   desc = "Open last fzf window" },
    },
}
