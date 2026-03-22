-- Bootstrap y carga de plugins con lazy.nvim
require("aperezgdev.remap")
require("aperezgdev.lazy")

-- Config de plugins
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
require("aperezgdev.which-key")
require("aperezgdev.jdtls")

-- Diagnosticos (configuracion unificada)
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
	},
})

-- Auto-recargar el buffer al cambiar el archivo externamente
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	pattern = "*",
	command = "checktime",
})
vim.api.nvim_create_autocmd("FileChangedShell", {
	pattern = "*",
	callback = function()
		vim.notify("Archivo cambiado externamente. Recargando...", vim.log.levels.INFO)
		vim.cmd("edit")
	end,
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Mostrar diagnostico actual" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir a diagnostico anterior" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir a diagnostico siguiente" })

vim.o.updatetime = 250
vim.cmd([[
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus=false, scope="line" })
]])

-- Opciones generales
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.undofile = true
