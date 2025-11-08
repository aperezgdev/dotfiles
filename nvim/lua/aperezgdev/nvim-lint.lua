require("lint").linters_by_ft = {
    go = { "golangcilint" },
    lua = { "luacheck" },
    javascript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = "*",
    callback = function()
        require("lint").try_lint()
    end,
})

