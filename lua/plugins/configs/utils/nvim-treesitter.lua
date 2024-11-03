local M = {}

function M.setup()
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
            "lua",
            "vim",
            "luadoc",
        },
        sync_install = false,
        auto_install = true,

        highlight = {
            enable = true, -- Tô màu cú pháp
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
    }
end

return M
