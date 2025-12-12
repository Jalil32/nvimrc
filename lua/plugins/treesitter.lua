return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "go", "python", "typescript", "javascript", "c", "cpp", "rust", "bash", "json", "yaml", "html", "css" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
