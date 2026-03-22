local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = { enabled = false },
  },
  win = {
    border = "rounded",
  },
})

wk.add({
  { "<leader>f", group = "Buscar (Telescope)" },
  { "<leader>h", group = "Git hunks" },
  { "<leader>t", group = "Terminal" },
  { "<leader>g", group = "Git" },
})
