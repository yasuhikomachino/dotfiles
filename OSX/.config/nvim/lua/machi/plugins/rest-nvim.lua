return {
	"rest-nvim/rest.nvim",
	ft = { "http", "rest" },
	-- dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>rr", "<cmd>Rest run<CR>", desc = "Run request under the cursor" },
		{ "<leader>rp", "<cmd>Rest open<CR>", desc = "Preview request cURL command" },
		{ "<leader>rl", "<cmd>Rest last<CR>", desc = "Re-run last request" },
	},
}
