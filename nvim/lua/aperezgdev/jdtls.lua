local function setup_jdtls()
    local jdtls = require("jdtls")

    -- Ruta de jdtls instalado por Mason
    local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    local config_dir = jdtls_path .. "/config_linux"

    -- Directorio de datos por proyecto (evita conflictos entre proyectos)
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

    local config = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar", launcher,
            "-configuration", config_dir,
            "-data", workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
        settings = {
            java = {
                signatureHelp = { enabled = true },
                contentProvider = { preferred = "fernflower" },
                configuration = {
                    runtimes = {
                        {
                            name = "JavaSE-25",
                            path = "/usr/lib/jvm/java-25-openjdk",
                            default = true,
                        },
                        {
                            name = "JavaSE-26",
                            path = "/usr/lib/jvm/java-26-openjdk",
                        },
                    },
                },
                completion = {
                    favoriteStaticMembers = {
                        "org.junit.Assert.*",
                        "org.junit.jupiter.api.Assertions.*",
                        "java.util.Objects.requireNonNull",
                        "java.util.Objects.requireNonNullElse",
                        "org.mockito.Mockito.*",
                    },
                },
                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999,
                    },
                },
            },
        },
    }

    jdtls.start_or_attach(config)
end

-- Keymaps específicos de Java (se aplican cuando jdtls se conecta)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client or client.name ~= 'jdtls' then return end

        local jdtls = require("jdtls")
        local bufnr = ev.buf
        vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, { buffer = bufnr, desc = "Organizar imports" })
        vim.keymap.set("n", "<leader>jev", jdtls.extract_variable, { buffer = bufnr, desc = "Extraer variable" })
        vim.keymap.set("v", "<leader>jev", function() jdtls.extract_variable(true) end, { buffer = bufnr, desc = "Extraer variable" })
        vim.keymap.set("n", "<leader>jec", jdtls.extract_constant, { buffer = bufnr, desc = "Extraer constante" })
        vim.keymap.set("v", "<leader>jec", function() jdtls.extract_constant(true) end, { buffer = bufnr, desc = "Extraer constante" })
        vim.keymap.set("v", "<leader>jem", function() jdtls.extract_method(true) end, { buffer = bufnr, desc = "Extraer metodo" })
    end,
})

-- Arrancar jdtls solo en archivos Java
vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = setup_jdtls,
})
