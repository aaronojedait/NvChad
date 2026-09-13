---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",
  transparency = true,
  theme_toggle = { "chadracula-evondev", "one_light" },
}

M.ui = {
  cmp = { style = "atom_colored" },
  telescope = { style = "bordered" },
  statusline = { theme = "default", separator_style = "round" },
}

M.themepicker = { style = "flat", border = true }

M.nvdash = {
  load_on_startup = true,

  buttons = {
    { txt = "Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "Find Text", keys = "fw", cmd = "Telescope live_grep" },
    {
      txt = "Edit Config",
      keys = "cf",
      cmd = "tabnew | tcd " .. vim.fn.stdpath "config" .. " | e lua/chadrc.lua",
    },
    { txt = "Lazy", keys = "lz", cmd = "Lazy" },
    { txt = "Mappings", keys = "ch", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

return M
