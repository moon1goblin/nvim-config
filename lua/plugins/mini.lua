return {
	{
		'echasnovski/mini.nvim',
		config = function()
			require('mini.surround').setup()
			-- better ci( and stuff
			require('mini.ai').setup()
		end,
	}
}
