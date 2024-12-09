require("code_runner").setup {
    startinsert = true,
    mode = "term",
    filetype = {
        java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt",
        },
        --python = "python -u",
        python = function()
            local file = "$dir/$fileName"
            local base_path = vim.fn.getcwd()
            local venvPath = (base_path .. "/venv/Scripts/python.exe")
            local venv = (base_path .. "/venv/Scripts/python.exe -u " .. file)
            local path = "python -u " .. file
            local python_cmd = string.format("if (Test-Path '%s') { %s } else { %s }", venvPath, venv, path)
            --local cmd = string.format("if [ -e '%s' ]; then %s; else %s; fi", venvPath, venv, path) -- Linux
            return python_cmd
        end,
        typescript = "deno run",
        rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt",
        },
        c = function()
            local c_base = {
                "cd $dir &&",
                "gcc $fileName -o",
                "/tmp/$fileNameWithoutExt",
            }
            local c_exec = {
                "&& /tmp/$fileNameWithoutExt &&",
                "rm /tmp/$fileNameWithoutExt",
            }
            vim.ui.input({ prompt = "Add more args:" }, function(input)
                c_base[4] = input
                vim.print(vim.tbl_extend("force", c_base, c_exec))
                require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
            end)
        end,
    },
}
