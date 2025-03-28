return {
	"theprimeagen/vim-apm",
	config = function()
		local apm = require("vim-apm")

		apm:setup({})
		vim.keymap.set("n", "<leader>apm", function()
			apm:toggle_monitor()
		end, { desc = "VIM-APM: Toggle APM View" })
	end,
}
