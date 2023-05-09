local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
    file_ignore_patterns = {
        'node_modules',

    },
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    },
    extensions = {
        file_browser = {
        respect_gitignore = false,
        path = "%:p:h",
        grouped = true,
hidden=true,
        cwd = telescope_buffer_dir(),
            theme = "dropdown",
-- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd('normal vbd') end,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                },
            },
        },
    },
}

telescope.load_extension("file_browser")
telescope.load_extension("coc")


vim.keymap.set('n', ';f',
    function()
        builtin.find_files({ no_ignore = false,
        })
    end)
vim.keymap.set('n', ';r', function()
    builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
    builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
    builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
    builtin.resume()
end)
vim.keymap.set('n', ';e', function()
    --vim.cmd [[Telescope coc diagnostics]]
    builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
    telescope.extensions.file_browser.file_browser({
        respect_gitignore = false,
        hijack_netrw = true,
        path = "%:p:h",
        grouped = true,
        cwd = telescope_buffer_dir(),
        --hidden = true,
        --initial_mode = "normal",
        -- layout_config = { height = 15 }
    })
end)
