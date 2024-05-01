return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			-- liquid = { "shopify-theme-check" },
		}

		local lint_augroup = vim.api.nvim_create_au_group("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {

			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end),
		})
	end,
}
