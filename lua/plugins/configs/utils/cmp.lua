local cmp = require("cmp")

local M = {}

function M.setup()
    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- sử dụng LuaSnip để mở rộng snippet
            end,
        },
        mapping = {
            ["<Tab>"] = cmp.mapping.select_next_item(),        -- Chọn item tiếp theo
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),      -- Chọn item trước
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Xác nhận hoàn thành
        },
        sources = {
            { name = "buffer" },   -- Tìm kiếm trong buffer hiện tại
            { name = "path" },     -- Tìm kiếm trong đường dẫn
            { name = "luasnip" },  -- Tìm kiếm trong các snippet
            { name = "nvim_lsp" }, -- Tìm kiếm từ LSP
        },
        formatting = {
            format = require("lspkind").cmp_format({ with_text = true, menu = { buffer = "[Buffer]", path = "[Path]", luasnip = "[Snippet]", nvim_lsp = "[LSP]" } }),
        },
    })

    cmp.setup.filetype("gitcommit", {
        sources = {
            { name = "buffer" }, -- Chỉ sử dụng buffer cho commit
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
