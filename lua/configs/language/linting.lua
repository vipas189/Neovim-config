require("lint").linters_by_ft = {
    --python = { "flake8" },
    --javascript = { "eslint" },
}
require("lint").linters.eslint_d.args = {
    "--no-warn-ignored",
    "--format",
    "json",
    "--stdin",
    "--stdin-filename",
    "--config",
    function()
        return vim.api.nvim_buf_get_name(0)
    end,
}
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
    group = lint_augroup,
    callback = function()
        require("lint").try_lint()
    end,
})
