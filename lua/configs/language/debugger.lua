require("dapui").setup()
local dap, dapui = require "dap", require "dapui"
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

require("mason-nvim-dap").setup {
    handlers = {
        function(config)
            require("mason-nvim-dap").default_setup(config)
        end,
        python = function(config)
            config.adapters = {
                type = "executable",
                command = "C:\\Users\\rokx9\\AppData\\Local\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python",
                args = { "-m", "debugpy.adapter" },
                options = {
                    source_filetype = "python",
                    detached = false,
                },
            }
            config.configurations = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        local cwd = vim.fn.getcwd()
                        local venv_path = "\\venv\\Scripts\\python"
                        local python_path = "C:\\Python312\\python"
                        if vim.fn.executable(cwd .. venv_path) == 1 then
                            return cwd .. venv_path
                        else
                            return python_path
                        end
                    end,
                    console = "integratedTerminal",
                },
            }
            require("mason-nvim-dap").default_setup(config)
        end,
    },
}
