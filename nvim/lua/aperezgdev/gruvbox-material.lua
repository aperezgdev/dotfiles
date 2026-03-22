-- Fondo: soft, medium o hard
vim.g.gruvbox_material_background = "hard"

-- Foreground: material o mix
vim.g.gruvbox_material_foreground = "material"

-- Negritas e itálicas
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1

-- Control de itálicas en comentarios
vim.g.gruvbox_material_disable_italic_comment = 1

-- Subrayado y subrayado ondulado (undercurl)
vim.g.gruvbox_material_enable_underline = 1
vim.g.gruvbox_material_enable_undercurl = 1

-- Fondo transparente
vim.g.gruvbox_material_transparent_background = 0  -- 1 = transparente

-- Dim inactive windows
vim.g.gruvbox_material_dim_inactive_windows = 0     -- 1 = activo

-- Invertir búsqueda, diffs, statusline, errores (inverse)
vim.g.gruvbox_material_inverse = 1

-- Contraste general
-- No hay opción exacta como hard/soft de gruvbox.nvim para todos los elementos,
-- solo el background que ya pusimos arriba.

-- Palette overrides y overrides
-- gruvbox-material no soporta directamente como tabla Lua,
-- si quieres modificar colores específicos, se hace con highlight groups:
-- vim.cmd(highlight Normal guibg=#XXXXXX guifg=#YYYYYY)

-- ============================
-- Activar el colorscheme
-- ============================
vim.cmd([[colorscheme gruvbox-material]])

-- Neovim 0.11+ usa captures con sufijo de lenguaje (@function.java, @variable.lua, etc.)
-- gruvbox-material solo define los genéricos (@function, @variable, etc.)
-- Forzar que los highlights por lenguaje hereden de los genéricos
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local ft = vim.bo.filetype
    if ft == "" then return end
    -- Lista de captures de treesitter que necesitan fallback
    local captures = {
      "@variable", "@variable.builtin", "@variable.parameter", "@variable.member",
      "@constant", "@constant.builtin", "@constant.macro",
      "@module", "@module.builtin", "@label",
      "@string", "@string.documentation", "@string.regexp", "@string.escape",
      "@string.special", "@string.special.symbol", "@string.special.url", "@string.special.path",
      "@character", "@character.special",
      "@boolean", "@number", "@number.float",
      "@type", "@type.builtin", "@type.definition",
      "@attribute", "@attribute.builtin", "@property",
      "@function", "@function.builtin", "@function.call", "@function.macro",
      "@function.method", "@function.method.call",
      "@constructor", "@operator",
      "@keyword", "@keyword.coroutine", "@keyword.function", "@keyword.operator",
      "@keyword.import", "@keyword.type", "@keyword.modifier", "@keyword.repeat",
      "@keyword.return", "@keyword.debug", "@keyword.exception",
      "@keyword.conditional", "@keyword.conditional.ternary",
      "@keyword.directive", "@keyword.directive.define",
      "@punctuation.delimiter", "@punctuation.bracket", "@punctuation.special",
      "@comment", "@comment.documentation", "@comment.error", "@comment.warning",
      "@comment.todo", "@comment.note",
      "@markup.strong", "@markup.italic", "@markup.strikethrough",
      "@markup.underline", "@markup.heading",
      "@markup.quote", "@markup.math", "@markup.link",
      "@markup.link.label", "@markup.link.url",
      "@markup.raw", "@markup.raw.block", "@markup.list",
      "@markup.list.checked", "@markup.list.unchecked",
      "@tag", "@tag.attribute", "@tag.delimiter", "@tag.builtin",
    }
    for _, capture in ipairs(captures) do
      local ft_group = capture .. "." .. ft
      local existing = vim.api.nvim_get_hl(0, { name = ft_group })
      if vim.tbl_isempty(existing) then
        pcall(vim.api.nvim_set_hl, 0, ft_group, { link = capture })
      end
    end
  end,
})
