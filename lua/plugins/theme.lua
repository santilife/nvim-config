local vim = vim

-- Configuración de lazy.nvim
-- Tema Visual


return {
	--[[{ 'aliqyan-21/darkvoid.nvim', config = function()
  			--vim.cmd("colorscheme darkvoid")
  		end,
	},]]--

	{
		'zootedb0t/citruszest.nvim',
		config = function()
			--vim.cmd("colorscheme citruszest")
		end,

	},

	
	{
		'dgox16/oldworld.nvim',
		config = function()
		end,

	},

	{
 		 "olimorris/onedarkpro.nvim",
  		priority = 1000, -- Ensure it loads first
		config = function()
			vim.cmd("colorscheme onedark")
		end,
	},


	-- Configuración de nerdicons
	{    
        	'glepnir/nerdicons.nvim',
        	config = function()
            		require('nerdicons').setup({})
       		 end,
	},
  {
    "xiyaowong/transparent.nvim",
    priority = 1000;
  }
}





    --return {'dgox16/oldworld.nvim'},
    --return {'zootedb0t/citruszest.nvim'},
    --return {'Tsuzat/NeoSolarized.nvim'},   
