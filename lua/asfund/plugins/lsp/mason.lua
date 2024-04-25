-- import mason plugin safely
-- local mason_status, mason = pcall(require, "mason")
-- if not mason_status then
--   return
-- end
--
-- -- import mason-lspconfig plugin safely
-- local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
-- if not mason_lspconfig_status then
--   return
-- end
--

-- enable mason
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")
local mason_tool_installer =  require("mason-tool-installer")

mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"gopls",
		"pyright",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_tool_installer.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"isort",
		"black",
		"pylint",
		"eslint_d",
	},
})
-- mason_null_ls.setup({
-- 	-- list of formatters & linters for mason to install
-- 	ensure_installed = {
-- 		"prettier", -- ts/js formatter
-- 		"stylua", -- lua formatter
-- 		"eslint_d", -- ts/js linter
-- 		"golangci-lint",
-- 		"black",
-- 	},
-- 	-- auto-install configured formatters & linters (with null-ls)
-- 	automatic_installation = true,
-- })
