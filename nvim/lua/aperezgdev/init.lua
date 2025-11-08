-- Importamos config de plugins
require("aperezgdev.remap")
require("aperezgdev.telescope")
require("aperezgdev.treesitter")
require("aperezgdev.lsp")
require("aperezgdev.cmp")
require("aperezgdev.auto-tag")
require("aperezgdev.lualine")
require("aperezgdev.gitsigns")
require("aperezgdev.discord-presence")
require("aperezgdev.lsp-signature")
require("aperezgdev.gruvbox-material")
require("aperezgdev.nvim-lint")
require("aperezgdev.conform")
require("aperezgdev.toggleterm")

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",  -- opcional
  },
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Mostrar diagnóstico actual" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir a diagnóstico anterior" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir a diagnóstico siguiente" })

vim.o.updatetime = 250
vim.cmd [[
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus=false, scope="line" })
]]


vim.cmd[[colorscheme gruvbox-material]]

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    underline = true,
})

vim.opt.number = true
vim.opt.relativenumber = true
