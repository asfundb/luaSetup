local setup, notify = pcall(require, "notify")
if not setup then
	return
end
require("notify").setup({
	background_colour = "#000000",
})
