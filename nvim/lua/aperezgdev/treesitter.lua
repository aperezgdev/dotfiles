-- Activar highlight de treesitter para los filetypes relevantes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "go", "lua", "typescript", "javascript", "java",
    "json", "yaml", "bash", "markdown", "html", "css", "astro",
  },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
