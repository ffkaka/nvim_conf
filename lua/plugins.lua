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
		run = ':TSUpdate'
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

  -- tagbar
  use { 'preservim/tagbar' }

  --
  use { 'williamboman/mason.nvim' }

	--
	use { 'neovim/nvim-lspconfig' }

	use {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	}

	-- colorscheme
	vim.cmd.colorscheme "tokyonight-night"

	-- go global settings
	vim.g.go_imports_autosave = 0
	vim.g.go_completion_enabled = 1
	vim.g.go_completion_auto_gopkgs = 1

	-- keymap
		vim.keymap.set('n', '<F6>', function() vim.cmd "TagbarToggle" end)

end)
