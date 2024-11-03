local M = {}

function M.setup()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()

    mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "bashls", "clangd" },
        automatic_installation = true
    })
end

return M
