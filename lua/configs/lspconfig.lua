require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  pyright = {},
  gopls = {},
  ts_ls = {},
  nil_ls = {},
  jsonls = {},
  yamlls = {},
  marksman = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

-- read :h vim.lsp.config for changing options of lsp servers
