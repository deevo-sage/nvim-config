local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'thin',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#333333',
      bg = '#222222',
    },
    separator_selected = {
      fg = '#222222',
    },
    background = {
      fg = '#dddddd',
      bg = '#222222',
    },
    buffer_selected = {
      fg = '#fdf6e3',
      _ = "bold",
    },
    fill = {
      bg = '#222222',
      fg = '#222222',
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
