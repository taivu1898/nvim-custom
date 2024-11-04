local M = {}

local function setup_keymaps(bufnr)
    local keymap = vim.keymap
    local opts = { buffer = bufnr, silent = true }

    local mappings = {
        { "n",          "gR",         "<cmd>Telescope lsp_references<CR>",       "Show LSP references" },
        { "n",          "gD",         vim.lsp.buf.declaration,                   "Go to declaration" },
        { "n",          "gd",         "<cmd>Telescope lsp_definitions<CR>",      "Show LSP definitions" },
        { "n",          "gi",         "<cmd>Telescope lsp_implementations<CR>",  "Show LSP implementations" },
        { "n",          "gt",         "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
        { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,                   "See available code actions" },
        { "n",          "<leader>rn", vim.lsp.buf.rename,                        "Smart rename" },
        { "n",          "<leader>D",  "<cmd>Telescope diagnostics bufnr=0<CR>",  "Show buffer diagnostics" },
        { "n",          "<leader>d",  vim.diagnostic.open_float,                 "Show line diagnostics" },
        { "n",          "[d",         vim.diagnostic.goto_prev,                  "Go to previous diagnostic" },
        { "n",          "]d",         vim.diagnostic.goto_next,                  "Go to next diagnostic" },
        { "n",          "K",          vim.lsp.buf.hover,                         "Show documentation for cursor" },
        { "n",          "<leader>rs", ":LspRestart<CR>",                         "Restart LSP" },
    }

    for _, map in ipairs(mappings) do
        opts.desc = map[4]
        keymap.set(map[1], map[2], map[3], opts)
    end
end

local function setup_diagnostics()
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end

M.setup = function()
    setup_diagnostics()

    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                completion = {
                    callSnippet = "Replace",
                },
            },
        },
        on_attach = function(client, bufnr)
            setup_keymaps(bufnr)
        end,
    })
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            setup_keymaps(bufnr)
        end,
    })
end

return M
