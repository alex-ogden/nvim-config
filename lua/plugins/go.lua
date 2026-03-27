return {
    "fatih/vim-go",
    ft = { "go" },
    config = function()
        -- vim-go setup
        vim.g.go_fmt_command = "gofmt"
        vim.g.go_auto_type_info = 1
        vim.g.go_def_mode = "gopls"
        vim.g.go_info_mode = "gopls"

        -- Auto-format on save
        vim.cmd([[
          augroup GoAutoFormat
            autocmd!
            autocmd BufWritePre *.go :silent! lua vim.cmd("GoFmt")
          augroup END
        ]])

        -- Non-Mason Go tools
        local go_tools = {
            gomodifytags = "github.com/fatih/gomodifytags@latest",
            gotests = "github.com/cweill/gotests/...@latest",
            impl = "github.com/josharian/impl@latest",
            stringer = "golang.org/x/tools/cmd/stringer@latest",
            mockgen = "github.com/golang/mock/mockgen@latest",
        }

        local function install_go_tools()
            local go_bin = os.getenv("GOPATH") .. "/bin"
            for tool, pkg in pairs(go_tools) do
                local tool_path = go_bin .. "/" .. tool
                local f = io.open(tool_path, "r")
                if f then
                    io.close(f)
                    vim.notify("Go tool already installed: " .. tool, vim.log.levels.INFO)
                else
                    if f then io.close(f) end
                    local cmd = "go install " .. pkg
                    vim.fn.jobstart(cmd, {
                        stdout_buffered = true,
                        on_exit = function()
                            vim.schedule(function()
                                vim.notify("Installed Go tool: " .. tool, vim.log.levels.INFO)
                            end)
                        end,
                    })
                end
            end
        end

        -- Run installer on startup and opening Go files
        install_go_tools()
        vim.api.nvim_create_autocmd("BufReadPost", {
            pattern = "*.go",
            callback = install_go_tools,
        })
    end,
}
