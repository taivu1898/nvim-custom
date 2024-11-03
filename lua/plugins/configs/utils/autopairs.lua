local M = {}
local npairs = require("nvim-autopairs")

function M.setup()
    npairs.setup({
        disable_in_visualblock = true, -- disable when insert after visual block mode
    })
end

return M
