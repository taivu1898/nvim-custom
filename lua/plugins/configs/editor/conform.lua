local M = {}

function M.setup()
    local conform = require("conform")

    -- Thiết lập formatters cho từng file type
    conform.setup({
        formatters_by_ft = {
            lua = { "stylua" },  -- Sử dụng stylua cho Lua
            -- Bạn có thể thêm các ngôn ngữ khác tại đây nếu cần
            -- ví dụ:
            -- javascript = { "eslint" },
            -- typescript = { "eslint" },
        },

        -- Cấu hình định dạng khi lưu
        format_on_save = {
            timeout_ms = 500,  -- Thời gian chờ tối đa cho việc định dạng
            lsp_fallback = true,  -- Sử dụng LSP làm fallback nếu không có formatter
        },
    })
end

return M

