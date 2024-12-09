require "nvchad.mappings"
local map = vim.keymap.set
local mode_state = function()
    local mode = vim.api.nvim_get_mode().mode
    if mode == "nt" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true), "n", true)
        vim.cmd "silent! bd!"
    end
end
vim.api.nvim_create_user_command("Replace", function(opts)
    local args = {}
    for arg in string.gmatch(opts.args, "[^%s]+") do
        table.insert(args, arg)
    end
    local search_word = args[1]
    local replace_word = args[2]
    vim.cmd(":%s/\\<" .. search_word .. "\\>/" .. replace_word .. "/g")
end, { nargs = "*" })
map("n", "<leader>tt", function()
    require("betterTerm").open()
end, {})

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader> ", ":NvimTreeFocus <CR>", { silent = true })
map("n", "<leader>ll", ":Lazy <CR>", { silent = true })
map("n", "<leader>mm", ":Mason <CR>", { silent = true })
map("n", "<leader>db", ":DapToggleBreakpoint<CR>", { silent = true })
map("n", "<F1>", ":DapContinue<CR>", { silent = true })
map("n", "<F2>", ":DapStepInto <CR>", { silent = true })
map("n", "<F3>", ":DapStepOver <CR>", { silent = true })
map("n", "<F4>", ":DapStepOut <CR>", { silent = true })
map("n", "<F5>", ":DapRestart <CR>", { silent = true })
map("n", "<F6>", ":DapStop <CR>", { silent = true })
map("n", "<leader>rr", ":RunCode <CR>", { silent = true })
map("n", "<leader>i", ":Noice <CR>", { silent = true })
map({ "n", "v" }, "K", "10<C-y>10k<Cmd>redraw<CR>", { noremap = true, silent = true })
map({ "n", "v" }, "J", "10<C-e>10j<Cmd>redraw<CR>", { noremap = true, silent = true })
map("t", "<Esc>", [[<C-\><C-n>:bd!<CR>]], { noremap = true, silent = true })
map("n", "<Esc>", mode_state, { noremap = true, silent = true })
map("n", "<leader>cd", ":cd ", { noremap = true })
map({ "n", "v" }, "<C-c>", '"+y', { silent = true })
map({ "n", "v" }, "<C-v>", '"+p', { silent = true })
map("n", "<leader>lr", ":Leet run<CR>", { silent = true })
map("n", "<leader>ls", ":Leet submit<CR>", { silent = true })
