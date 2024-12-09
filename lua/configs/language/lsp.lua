require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    function(server_name)
        if server_name ~= "lua_ls" then
            require("lspconfig")[server_name].setup {
                on_attach = nvlsp.on_attach,
                on_init = nvlsp.on_init,
                capabilities = nvlsp.capabilities,
            }
        end
    end,
    ["pyright"] = function()
        local pyright = function()
            require("lspconfig").pyright.setup {
                settings = {
                    python = {
                        pythonPath = vim.fn.getcwd() .. "\\venv\\Scripts\\python.exe",
                    },
                },
            }
        end
        pyright()
        vim.api.nvim_create_autocmd({ "DirChanged" }, {
            pattern = "*",
            callback = pyright,
        })
    end,
}
