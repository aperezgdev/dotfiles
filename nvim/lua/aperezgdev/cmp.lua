local cmp = require('cmp')

-- Registrar cmp-nvim-lsp para que enganche clientes LSP como source
require('cmp_nvim_lsp').setup()

cmp.setup({
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  }, {
    {name = 'buffer'},
    {name = 'path'},
  }),
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Completado en la línea de comandos (:)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {name = 'path'},
  }, {
    {name = 'cmdline'},
  }),
})
