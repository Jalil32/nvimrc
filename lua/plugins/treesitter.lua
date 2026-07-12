return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"lua",
				"python",
				"typescript",
				"javascript",
				"tsx",
				"c",
				"cpp",
				"rust",
				"bash",
				"json",
				"yaml",
				"html",
				"css",
			},
			auto_install = true,
		})

		vim.treesitter.language.register("tsx", "typescriptreact")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html", "css", "lua", "python", "rust", "bash", "json", "yaml" },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
