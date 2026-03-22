require("conform").setup({
    formatters_by_ft = {
        go = { "gofmt", "goimports" },
        lua = { "stylua" },
        javascript = { "prettier" },
        java = { "google-java-format" },
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
