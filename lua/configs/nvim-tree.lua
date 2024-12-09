require("nvim-tree").setup {
    view = {
        width = 25,
        side = "left", -- Position of Neotree
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "✗",
        },
    },
    renderer = {
        highlight_opened_files = "all", -- Highlight opened files
    },
    actions = {
        open_file = {
            quit_on_open = true, -- Close nvim-tree when opening a file
        },
    },
}
