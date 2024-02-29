-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	use {
		'tree-sitter/tree-sitter-go'
	}

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  -- papercolor-theme
  use { 'NLKNguyen/papercolor-theme' }

  -- python indentation
  use { 'vim-scripts/indentpython.vim' }

  -- vim-go
  use { 'fatih/vim-go' }
	-- go global settings
	vim.g.go_imports_autosave = 0
	--vim.g.go_completion_enabled = 1
	vim.g.go_completion_auto_gopkgs = 1
	vim.g.go_highlight_types = 1
	vim.g.go_highlight_extra_types = 1
	vim.g.go_highlight_functions = 1
	vim.g.go_highlight_function_calls = 1

  -- tagbar
  use { 'preservim/tagbar' }
	vim.keymap.set('n', '<F6>', function() vim.cmd "TagbarToggle" end)

	-- nerdtree
	use { 'preservim/nerdtree' }
	vim.keymap.set('n', '<F5>', function() vim.cmd ':NERDTreeToggle' end)

  -- mason
	use ({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use {
		"williamboman/mason-lspconfig.nvim",
	}

	use { "catppuccin/nvim", as = "catppuccin" }

	use {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	}
	-- colorscheme
	vim.cmd 'colorscheme tokyonight-night'

	-- autocompletion
	-- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			--'rafamadriz/friendly-snippets',
			-- 'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp'
		}
	}
	vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
	local cmp = require('cmp')
	local luasnip = require('luasnip')
	local select_opts = {behavior = cmp.SelectBehavior.Select}
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end
		},
		sources = {
			{name = 'path'},
			{name = 'nvim_lsp', keyword_length = 1},
			--{name = 'buffer', keyword_length = 3},
			--{name = 'luasnip', keyword_length = 2},
		},
		window = {
			documentation = cmp.config.window.bordered()
		},
		formatting = {
			fields = {'menu', 'abbr', 'kind'},
			format = function(entry, item)
				local menu_icon = {
					nvim_lsp = 'λ',
					--luasnip = '⋗',
					--buffer = 'Ω',
					path = '🖫',
				}

				item.menu = menu_icon[entry.source.name]
				return item
			end,
		},
		mapping = {
			['<Up>'] = cmp.mapping.select_prev_item(select_opts),
			['<Down>'] = cmp.mapping.select_next_item(select_opts),

			['<C-u>'] = cmp.mapping.scroll_docs(-4),
			['<C-d>'] = cmp.mapping.scroll_docs(4),

			['<C-e>'] = cmp.mapping.abort(),
			['<C-y>'] = cmp.mapping.confirm({select = true}),
			['<CR>'] = cmp.mapping.confirm({select = false}),

			['<C-f>'] = cmp.mapping(function(fallback)
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, {'i', 's'}),

			['<C-b>'] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {'i', 's'}),

			['<Tab>'] = cmp.mapping(function(fallback)
				local col = vim.fn.col('.') - 1

				if cmp.visible() then
					cmp.select_next_item(select_opts)
				elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
					fallback()
				else
					cmp.complete()
				end
			end, {'i', 's'}),

			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item(select_opts)
				else
					fallback()
				end
			end, {'i', 's'}),
		},
	})
end)
