local cmp = require("cmp")

local M = {}

function M.setup()
    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
            { name = "buffer" },
            { name = "path" },
            { name = "luasnip" },
            { name = "nvim_lsp" },
        },
        formatting = {
            format = require("lspkind").cmp_format({ with_text = true, menu = { buffer = "[Buffer]", path = "[Path]", luasnip = "[Snippet]", nvim_lsp = "[LSP]" } }),
        },
    })

    cmp.setup.filetype("gitcommit", {
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })
end

return M
