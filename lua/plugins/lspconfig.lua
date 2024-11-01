return {
  -- Autocompletado
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",             -- Snippet engine
      "saadparwaiz1/cmp_luasnip",     -- Snippet completion source
      "rafamadriz/friendly-snippets", -- Pre-built snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Cargar snippets de friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- Integrar luasnip como el motor de snippets
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Cambiar a luasnip.expand() si es necesario
          end,
        },
        mapping = {
          -- Usar Tab y Shift-Tab para navegar los autocompletados y los snippets
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- Seleccionar el siguiente elemento
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() -- Expandir o saltar el snippet
            else
              fallback() -- Hacer fallback si no hay sugerencias
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- Seleccionar el elemento anterior
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1) -- Saltar hacia atrás en el snippet
            else
              fallback() -- Hacer fallback si no hay sugerencias
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar la selección
        },
        sources = {
          { name = "nvim_lsp" }, -- Sugerencias del LSP
          { name = "luasnip" },  -- Habilitar la fuente de snippets
          { name = "buffer" },    -- Autocompletado desde el buffer
          { name = "path" },      -- Autocompletado de rutas
        },
      })
    end,
  }
}

