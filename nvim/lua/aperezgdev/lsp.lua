-- Keymaps LSP globales: se aplican cuando cualquier servidor LSP se conecta a un buffer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local bufnr = ev.buf
    local opts = { buffer = bufnr }

    -- Navegación
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Ir a definición' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Ir a declaración' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Ir a implementación' })
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Ir a tipo' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Ver referencias' })
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature help' })

    -- Acciones
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover documentación' })
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Renombrar' })
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code action' })
  end,
})

-- Capabilities de cmp-nvim-lsp para autocompletado avanzado
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"gopls", "html", "jsonls", "ts_ls",
  "markdown_oxide", "tailwindcss","astro", "jdtls", "lua_ls"},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = lsp_capabilities,
      })
    end,
    -- No configurar jdtls via lspconfig, lo maneja nvim-jdtls
    jdtls = function() end,
  },
})
