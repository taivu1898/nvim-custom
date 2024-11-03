local M = {}

function M.setup()
    require("nvim-tree").setup({
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
        on_attach = custom_on_attach,
        sync_root_with_cwd = true,
        -- hijack_unnamed_buffer_when_opening = false,
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {}
        },
        filters = {
            custom = { "^.git$" }
        },
        git = {
            enable = true
        },
        renderer = {
            indent_markers = {
                enable = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "├",
                    none = " "
                }
            },
            highlight_git = "none",
            icons = {
                glyphs = {
                    folder = {
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = ""
                    },
                    git = {
                        unstaged = "",
                        staged = "",
                        unmerged = "",
                        renamed = "",
                        untracked = "",
                        deleted = "",
                        ignored = "󰴲"
                    }
                }
            }
        },
    })
end

return M
