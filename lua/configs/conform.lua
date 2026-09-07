local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    go = { "goimports" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    nix = { "nix_fmt" },
  },

  formatters = {
    -- Use the flake's own formatter (nixfmt-tree) instead of a standalone nixfmt binary
    nix_fmt = {
      command = "nix",
      args = { "fmt", "--", "--stdin", "$FILENAME" },
      stdin = true,
      cwd = function(_, ctx)
        return vim.fs.root(ctx.dirname, "flake.nix")
      end,
      require_cwd = true,
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
