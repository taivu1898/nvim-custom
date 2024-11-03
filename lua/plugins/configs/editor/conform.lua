local M = {}

function M.setup()
    local conform = require("conform")

    conform.setup({
        formatters_by_ft = {
            lua = { "stylua" },
            c_cpp = { "clang-format" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    })
end

return M
