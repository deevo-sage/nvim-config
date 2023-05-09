local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end
packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use 'bluz71/vim-moonfly-colors'
    use { "catppuccin/nvim", as = "catppuccin" }
    use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
    end
    }
    use( "christoomey/vim-tmux-navigator")


  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })


  use("eandrju/cellular-automaton.nvim")

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
-- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  use("tpope/vim-fugitive")
  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

    -- Simple plugins can be specified as strings
    use("TimUntersberger/neogit")
    -- TJ created lodash of neovim
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use "lewis6991/gitsigns.nvim"
    -- All the things
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use 'nvim-lualine/lualine.nvim' -- Statusline
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    -- use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("nvim-lua/lsp_extensions.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use 'github/copilot.vim'

    -- Primeagen doesn"t create lodash
    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")

    use("mbbill/undotree")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    require("nvim-tree").setup {}
  end
}
    use("nvim-treesitter/nvim-treesitter-context")
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use("svrana/neosolarized.nvim")

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/zen-mode.nvim'
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
    use 'terryma/vim-multiple-cursors'
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")
            saga.setup{
                server_filetype_map = {
                    typescript = 'typescript'
                }
            }
            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
            vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
            vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
            vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
            vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
            vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
        end,
    })
    --use { 'neoclide/coc.nvim', branch = 'release' }
    use 'fannheyward/telescope-coc.nvim'

    --use("mfussenegger/nvim-dap")
    --use("rcarriga/nvim-dap-ui")
    --use("theHamsta/nvim-dap-virtual-text")
    --use "MunifTanjim/prettier.nvim"
    --use 'andweeb/presence.nvim'
    --use("sbdchd/neoformat")
    --    use 'aurieh/discord.nvim'
    --use 'sharkdp/fd'
    --use 'dense-analysis/ale'
    --use('pangloss/vim-javascript')
    --use('leafgarland/typescript-vim')
    --use('peitalin/vim-jsx-typescript')
    --use('styled-components/vim-styled-components')
    --use('jparise/vim-graphql')
    --[[
    --
	-- Lazy loading:
	-- Load on specific commands
	use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

	-- Load on an autocommand event
	use {'andymass/vim-matchup', event = 'VimEnter'}

	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the "config" key)
	use {
	'w0rp/ale',
	ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
	cmd = 'ALEEnable',
	config = 'vim.cmd[[ALEEnable]] --[['
	}

	-- Plugins can have dependencies on other plugins
	use {
	'haorenW1025/completion-nvim',
	opt = true,
	requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
	}

	-- Plugins can also depend on rocks from luarocks.org:
	use {
	'my/supercoolplugin',
	rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
	}

	-- You can specify rocks in isolation
	use_rocks 'penlight'
	use_rocks {'lua-resty-http', 'lpeg'}

	-- Local plugins can be included
	use '~/projects/personal/hover.nvim'

	-- Plugins can have post-install/update hooks
	use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

	-- Post-install/update hook with neovim command

	-- Post-install/update hook with call of vimscript function with argument
	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

	-- Use specific branch, dependency and run lua file after load
	use {
	'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
	requires = {'kyazdani42/nvim-web-devicons'}
	}

	-- Use dependency and run lua function after load
	use {
	'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
	config = function() require('gitsigns').setup() end
	}

	-- You can specify multiple plugins in a single call
	use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

	-- You can alias plugin names
	use {'dracula/vim', as = 'dracula'}
	end)
	--]]














































































































































































































































































































































































































































































































































































































































































































end)
