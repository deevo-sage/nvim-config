local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--[[
null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettier.with({
            env = {
                PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/coding/appbrew/gauntlet/.prettierrc"),
            },
        }),
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()

                end,
            })
        end
    end,
}
]]
--
