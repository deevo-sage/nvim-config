require("theprimeagen.set")
require("theprimeagen.packer")
require("theprimeagen.neogit")
require("theprimeagen.text-me-daddy")

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({ on_attach = on_attach })

local augroup = vim.api.nvim_create_augroup
ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
    group = ThePrimeagenGroup,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints {}
    end
})

autocmd({ "BufWritePre" }, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})


--vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

--[[
--
require("presence"):setup({
    --    auto_update        = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    --    neovim_image_text  = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    --client_id          = "1025439729187037364", -- Use your own Discord application client id (not recommended)
    --    log_level          = 'debug', -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    --    debounce_timeout   = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    --    enable_line_number = false, -- Displays the current line number instead of the current project

    --     blacklist          = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons = false, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    --    file_assets        = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    --    show_time          = true, -- Show the timer

    -- Rich Presence text options
    --   editing_text        = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    --  file_explorer_text  = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    --git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    --plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    --reading_text        = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    --workspace_text      = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    --line_number_text    = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
--]]
--
