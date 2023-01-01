require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = false, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "normal", -- style for sidebars, see below
        floats = "normal", -- style for floating windows
    },
})

vim.cmd [[colorscheme tokyonight]]
--[[
vim.g.tokyonight_colors = {
  fg = "#839496",
  fg_dark = "#586e75",
  fg_gutter = "#073642",
  bg_highlight = "#002b36",
  comment = "#586e75",
  blue = "#268bd2",

    cyan = "#2aa198",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8",

  yellow = "#b58900",
  orange = "#cb4b16",
  magenta = "#d33682",
  purple = "#6c71c4",
}
]]


