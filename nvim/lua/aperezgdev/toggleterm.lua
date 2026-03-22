local toggleterm = require("toggleterm")

toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
		return 20
	end,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 5,
	},
})

-- Navegacion: salir del modo terminal con Esc o Ctrl+teclas de direccion
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Salir de modo terminal" })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Ir a ventana izquierda" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Ir a ventana abajo" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Ir a ventana arriba" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Ir a ventana derecha" })

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal flotante" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal horizontal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal vertical" })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	hidden = true,
	float_opts = { border = "double" },
})

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Abrir LazyGit" })

local opencode = Terminal:new({
	cmd = "opencode",
	direction = "vertical",
	hidden = true,
	close_on_exit = true,
	float_opts = { border = "double" },
})

function _OPENCODE_TOGGLE()
	opencode:toggle()
end

vim.keymap.set("n", "<leader>to", "<cmd>lua _OPENCODE_TOGGLE()<CR>", { desc = "Abrir OpenCode" })
