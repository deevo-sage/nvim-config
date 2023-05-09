local Remap = require("theprimeagen.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.
--[[-
local cmp = require("cmp")
local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    -- cmp_tabnine = "[TN]",
    path = "[Path]",
}
local lspkind = require("lspkind")
cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            --require("luasnip").lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),

    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                --        ...
                return vim_item
            end
        })
        --[[
    format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. " " .. menu
                end
                vim_item.kind = ""
            end
            vim_item.menu = menu
            return vim_item
        end,
    },

    sources = {
        -- tabnine completion? yayaya

        -- { name = "cmp_tabnine" },

        { name = "nvim_lsp" },

        -- For vsnip user.
        --{ name = 'vsnip' },

        -- For luasnip user.
        { name = "luasnip" },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = "buffer" },

    },
})
---]]
local function config(_config)
    return vim.tbl_deep_extend("force", {
        --capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("K", function() vim.lsp.buf.hover() end)
            nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
            nnoremap("<leader>q", function() vim.diagnostic.open_float() end)
            nnoremap("[d", function() vim.diagnostic.goto_next() end)
            nnoremap("]d", function() vim.diagnostic.goto_prev() end)
            nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
            nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
            nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
            inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
        end,
    }, _config or {})
end

-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
-- })
--
--[[
--

require("lspconfig").zls.setup(config())

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end
end

local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
    server_filetype_map = {
        typescript = 'typescript';
        javascript = "javascript"
    }
}

require("lspconfig").tsserver.setup(config({
    --capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),

    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        --client.server_capabilities.document_formatting = false
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
    end,

}))
require("lspconfig").ccls.setup(config())

require("lspconfig").jedi_language_server.setup(config())

require("lspconfig").svelte.setup(config())

require("lspconfig").solang.setup(config())

require("lspconfig").cssls.setup(config())

require("lspconfig").gopls.setup(config({
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}))

-- who even uses this?
require("lspconfig").rust_analyzer.setup(config({
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
}))
require("lspconfig").sumneko_lua.setup(config({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
}))
--]]
--
require("lspconfig").tsserver.setup(config({
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),

    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    on_attach = function(client, bufnr)

        client.server_capabilities.documentFormattingProvider = false
        --client.server_capabilities.document_formatting = false
        --vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
    end,

}))
vim.diagnostic.config({ virtual_text = false, signs = false })
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
