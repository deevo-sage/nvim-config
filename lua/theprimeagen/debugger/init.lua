local dap = require("dap")
local dapui = require("dapui")
local daptext = require("nvim-dap-virtual-text")

local remap = require("theprimeagen.keymap")
dap.configurations.typescript = {
    {
        name = "ts-node (Node2 with ts-node)",
        type = "node2",
        request = "launch",
        cwd = vim.loop.cwd(),
        runtimeArgs = { "-r", "ts-node/register" },
        runtimeExecutable = "node",
        args = { "--inspect", "${file}" },
        sourceMaps = true,
        skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
        name = "Jest (Node2 with ts-node)",
        type = "node2",
        request = "launch",
        cwd = vim.loop.cwd(),
        runtimeArgs = { "--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest" },
        runtimeExecutable = "node",
        args = { "${file}", "--runInBand", "--coverage", "false" },
        sourceMaps = true,
        port = 9229,
        skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
}
local nnoremap = remap.nnoremap

daptext.setup()
dapui.setup({
    layouts = {
        {
            elements = {
                "console",
            },
            size = 7,
            position = "bottom",
        },
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "watches",
            },
            size = 40,
            position = "left",
        }
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open(1)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require("theprimeagen.debugger.node");

nnoremap("<Home>", function()
    dapui.toggle(1)
end)
nnoremap("<End>", function()
    dapui.toggle(2)
end)

nnoremap("<leader><leader>", function()
    dap.close()
end)

nnoremap("<Up>", function()
    dap.continue()
end)
nnoremap("<Down>", function()
    dap.step_over()
end)
nnoremap("<Right>", function()
    dap.step_into()
end)
nnoremap("<Left>", function()
    dap.step_out()
end)
nnoremap("<Leader>b", function()
    dap.toggle_breakpoint()
end)
nnoremap("<Leader>B", function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
nnoremap("<leader>rc", function()
    dap.run_to_cursor()
end)
