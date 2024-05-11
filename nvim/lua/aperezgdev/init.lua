-- Importamos config de plugins
require("aperezgdev.remap")
require("aperezgdev.telescope")
require("aperezgdev.treesitter")
require("aperezgdev.lsp")
require("aperezgdev.tokyo-night")
require("aperezgdev.cmp")
require("aperezgdev.auto-tag")
require("aperezgdev.null-ls")
require("aperezgdev.lualine")
require("aperezgdev.gitsigns")

-- Tema establecido
vim.cmd[[colorscheme tokyonight]]

-- Config para los tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Config para los numeros
vim.opt.number = true
vim.opt.relativenumber = true
