local vim = vim

-- En tu archivo de configuración de plugins
return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("plugins.null-ls")

            -- Configurar Prettier como formateador
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier, -- Activa Prettier
                },
                on_attach = function(client, bufnr)
                    -- Formatear automáticamente al guardar
                    if client.server_capabilities.documentFormattingProvider then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ async = false })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}

