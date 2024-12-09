local cmp = require "cmp"
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" },
            },
        },
    }),
})
require("noice").setup {
    lsp = {
        signature = { enabled = false }, -- Disable Noice's signature handling
    },
    views = {
        cmdline_popup = {
            position = {
                row = 3,
                col = "50%",
            },
            size = {
                width = "auto",
                height = "auto",
            },
        },
    },
}
