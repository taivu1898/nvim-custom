local headerlines = require("headlines")

local M = {}

function M.setup()
    headerlines.setup {
        markdown = {
            headline_highlights = {
                "Headline1",
                "Headline2",
                "Headline3",
                "Headline4",
                "Headline5",
                "Headline6",
            },
            codeblock_highlight = "CodeBlock",
            dash_highlight = "Dash",
            quote_highlight = "Quote",
        },
    }
end

return M
