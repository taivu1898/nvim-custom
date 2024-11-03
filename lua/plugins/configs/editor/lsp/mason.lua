local M = {}

function M.setup()
    -- Import Mason và Mason-LSPConfig
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- Thiết lập Mason
    mason.setup()

    -- Thiết lập các LSP server
    mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "bashls" }, -- Bạn có thể thêm các server khác ở đây
        automatic_installation = true,
    })
end

return M
