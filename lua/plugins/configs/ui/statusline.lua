local lualine = require "lualine"

local M = {}

local function get_lsp_status()
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return ""
    end

    local client_names = {}
    for _, client in pairs(clients) do
        table.insert(client_names, "  " .. client.name)
    end

    return table.concat(client_names, ", ")
end

function M.setup()
    lualine.setup {
        options = {
            icons_enabled = true,
            theme = "auto", -- Có thể thay đổi theme
            component_separators = { left = "│", right = "│" },
            section_separators = { left = "█", right = "█" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                { 'branch' },
                { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
                { 'diagnostics', symbols = { error = ' ', warn = ' ', hint = '󰛩 ', info = ' ' }, }
            },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress", get_lsp_status },
            lualine_z = { "os.date('%A')", 'data', "require'lsp-status'.status()" }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
    }
end

return M
