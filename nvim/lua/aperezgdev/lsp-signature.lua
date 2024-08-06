local lsp_signature = require("lsp_signature")

vim.keymap.set({ 'n' }, '<C-k>', function() 
	lsp_signature.toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
     vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })

lsp_signature.setup({
	hint_prefix = {
		above = "↙ ",  -- when the hint is on the line above the current line
		current = "← ",  -- when the hint is on the same line
		below = "↖ "  -- when the hint is on the line below the current line
	},
})
