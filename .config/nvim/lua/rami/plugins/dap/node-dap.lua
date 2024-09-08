local function load_env_file(filepath)
  local env_file = io.open(filepath, "r")

  if not env_file then
    print("No .env file found at " .. filepath)
    return
  end

  for line in env_file:lines() do
    for key, value in string.gmatch(line, "([%w_]+)=([%w%p]+)") do
      vim.fn.setenv(key, value)
    end
  end

  env_file:close()
end

return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies = {
    "microsoft/vscode-js-debug",
    build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
    version = "1.*",
  },
  config = function()
    load_env_file(vim.fn.stdpath("config") .. "/.env")
    local aws_key_id = os.getenv("AWS_ACCESS_KEY_ID")
    local aws_access_key = os.getenv("AWS_SECRET_ACCESS_KEY")

    ---@diagnostic disable-next-line: missing-fields
    require("dap-vscode-js").setup({
      debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
      adapters = { "pwa-node" },
    })

    for _, language in ipairs({ "typescript", "javascript", "javascriptreact", "typescriptreact" }) do
      require("dap").configurations[language] = {
        {
          name = "Run",
          type = "pwa-node",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
        },
        {
          name = 'local rami',
          type = 'pwa-node',
          request = 'launch',
          program = '${workspaceFolder}/node_modules/@babel/node/bin/babel-node.js',
          args = { '${file}' },
          cwd = vim.fn.getcwd(),
          runtimeExecutable = '/Users/ramichaar/.nvm/versions/node/v12.22.12/bin/node',
          runtimeArgs = { '--max-old-space-size=16384' },
          env = { LOG_METRICS = 'skip', NODE_ENV = 'rami' },
          sourceMaps = true,
          protocol = 'inspector',
        },
        {
          name = 'prodv3',
          type = 'pwa-node',
          request = 'launch',
          program = '${workspaceFolder}/node_modules/@babel/node/bin/babel-node.js',
          args = { '${file}' },
          cwd = vim.fn.getcwd(),
          runtimeExecutable = '/Users/ramichaar/.nvm/versions/node/v12.22.12/bin/node',
          runtimeArgs = { '--max-old-space-size=16384' },
          env = {
            LOG_METRICS = 'skip',
            NODE_ENV = 'prodv3',
            AWS_ACCESS_KEY_ID = aws_key_id,
            AWS_SECRET_ACCESS_KEY = aws_access_key
          },
          sourceMaps = true,
          protocol = 'inspector',
        },
      }
    end
  end
}
