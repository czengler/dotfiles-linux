local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Default plugins
	use({ "wbthomason/packer.nvim", commit = "502a89f72ee5db3907dd0c7ee36287d49cfa56a0" })
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" })

	-- General plugins
	use({ "numToStr/Comment.nvim", commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d" })
	use({ "kyazdani42/nvim-web-devicons", commit = "189ad3790d57c548896a78522fd8b0d0fc11be31" })
	use({ "kyazdani42/nvim-tree.lua", commit = "f8489c992998e1e1b45aec65bdb9615e5cd59a61" })
	use({ "akinsho/bufferline.nvim", commit = "4ecfa81e470a589e74adcde3d5bb1727dd407363" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "bfa0d99ba6f98d077dd91779841f1c88b7b5c165" })
	use({ "akinsho/toggleterm.nvim", commit = "3ba683827c623affb4d9aa518e97b34db2623093" })
	use({ "lewis6991/impatient.nvim", commit = "d3dd30ff0b811756e735eb9020609fa315bfbbcc" })
	use({ "goolord/alpha-nvim", commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
	use({ "folke/which-key.nvim", commit = "61553aeb3d5ca8c11eea8be6eadf478062982ac9" })
	use({ "chentoast/marks.nvim", commit = "a69253e4b471a2421f9411bc5bba127eef878dc0" })
	use({ "stevearc/dressing.nvim", commit = "872cc4e5ea32295eb1102141a444d6d83b8f9c25" })
  use({ "folke/zen-mode.nvim", commit = "6f5702db4fd4a4c9a212f8de3b7b982f3d93b03c" })
	use({ "ggandor/leap.nvim", commit = "f28b1e7c1eee525adb17c24de3cc15a7fa1a6ef9" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim", commit = "2c2287db18732c30dba6b28d95c9a62481fdbc41" })

  --
	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", commit = "1942f3554184e9d9dfb90dcc6542047b8f6511f2" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" })

	-- Miscellanious
	use({ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" })
	use({ "bronson/vim-trailing-whitespace", commit = "05f068ebd9dbdf71d2d334d02abd99deb0311c40" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
