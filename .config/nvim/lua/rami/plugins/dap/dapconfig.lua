return {
  "mfussenegger/nvim-dap",
  priority = 1000,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dapVirtualText = require("nvim-dap-virtual-text")

    dapVirtualText.setup({
      show_stop_reason = true,
      virt_text_pos = 'eol',
    })
    ---@diagnostic disable-next-line: missing-fields
    dapui.setup({
      layouts = {
        {
          elements = {
            {
              id = "stacks",
              size = 0.3
            },
            {
              id = "breakpoints",
              size = 0.3
            },
            {
              id = "repl",
              size = 0.4
            },
          },
          position = "right",
          size = 120
        },
      },
    })

    vim.keymap.set("n", "<leader>df", function()
      dap.toggle_breakpoint()
      store_breakpoints(false)
    end, {})
    vim.keymap.set("n", "<leader>dr", function()
      dap.clear_breakpoints()
      store_breakpoints(true)
    end, {})

    vim.keymap.set("n", "<leader>dc", dap.continue, {})
    vim.keymap.set("n", "<leader>dd", function()
      dap.disconnect()
      dapui.close()
    end)

    local widgets = require('dap.ui.widgets')
    local scopesView = widgets.centered_float(widgets.scopes)
    scopesView.close()
    vim.keymap.set('n', '<Leader>dv', function()
      scopesView.toggle()
    end)

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '', bg = '#3A2324' })
    vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '', bg = '#31353f' })
    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapUIStop", linehl = "DapBreakpoint", numhl = "" })
    vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = 'DapStopped', numhl = "" })
  end,
}
