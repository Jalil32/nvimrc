return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "pyright", "ts_ls", "lua_ls", "biome" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		event = "BufReadPre",
		config = function()
			local on_attach = function(_, bufnr)
				local map = function(keys, func)
					vim.keymap.set("n", keys, func, { buffer = bufnr })
				end
				map("gd", vim.lsp.buf.definition)
				map("gr", vim.lsp.buf.references)
				map("K", vim.lsp.buf.hover)
				map("<leader>rn", vim.lsp.buf.rename)
				map("<leader>ca", vim.lsp.buf.code_action)
				map("<leader>d", vim.diagnostic.open_float)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					on_attach(nil, args.buf)
				end,
			})

			vim.lsp.config("gopls", {})
			vim.lsp.config("pyright", {})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("biome", {})
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.enable({ "gopls", "pyright", "ts_ls", "lua_ls", "biome" })
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end,
	},
}
