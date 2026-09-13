require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("UserYankHighlight", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("UserLastPosition", { clear = true }),
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

autocmd("BufDelete", {
  group = vim.api.nvim_create_augroup("UserNvdashOnEmpty", { clear = true }),
  callback = function()
    local bufs = vim.t.bufs
    if bufs and #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})
