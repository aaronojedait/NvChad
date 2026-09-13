require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- code runner
local runners = {
  lua = "lua",
  python = "python3",
  go = "go run",
  javascript = "node",
  typescript = "npx tsx",
  sh = "bash",
}

local last_cmd

map("n", "<leader>rr", function()
  local runner = runners[vim.bo.filetype]

  if runner then
    vim.cmd "silent! write"
    last_cmd = runner .. " " .. vim.fn.shellescape(vim.fn.expand "%:p")
  elseif not last_cmd then
    vim.notify("No runner for filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
    return
  end

  require("nvchad.term").runner {
    id = "coderunner",
    pos = "float",
    cmd = function()
      return last_cmd
    end,
  }
end, { desc = "terminal run current file" })

-- menu
map("n", "<C-t>", function()
  require("menu").open "default"
end, { desc = "menu open" })

map({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, { desc = "menu open under cursor" })

-- minty
map("n", "<leader>cp", "<cmd>Huefy<CR>", { desc = "minty color picker" })
map("n", "<leader>cs", "<cmd>Shades<CR>", { desc = "minty shades" })

-- tabufline
map("n", "<A-,>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "buffer move left" })

map("n", "<A-.>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "buffer move right" })

map("n", "<leader>X", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "buffer close others" })

for i = 1, 9 do
  map("n", "<leader>" .. i, function()
    local bufnr = vim.t.bufs and vim.t.bufs[i]
    if bufnr then
      require("nvchad.tabufline").goto_buf(bufnr)
    end
  end, { desc = "buffer goto " .. i })
end

-- theme toggles
map("n", "<leader>tt", function()
  require("base46").toggle_theme()
end, { desc = "theme toggle light/dark" })

map("n", "<leader>tp", function()
  require("base46").toggle_transparency()
end, { desc = "theme toggle transparency" })
