return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      -- less strict than defaults: warn instead of blocking the keypress,
      -- and allow more repeats before nagging
      restriction_mode = "hint",
      max_count = 6,
      max_time = 1500,
    },
  },
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    opts = {
      -- keep the 0 ^ $ w b e line hints, drop the per-character f/F/t/T
      -- marks (they clutter lines with repeated characters)
      targetedMotionHints = { enabled = false },
    },
  },
}
