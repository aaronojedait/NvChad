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

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "luadoc", "printf", "vim", "vimdoc",
        "html", "css",
        "nix", "python", "go",
        "javascript", "typescript", "tsx",
        "json", "yaml", "markdown", "markdown_inline",
      },
    },
  },

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

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          enabled = true,
          keys = { "f", "F", "t", "T" }, -- excludes ";"/","
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
}
