local vim = vim


local function read_banner()
    local banner = {}
    for line in io.lines(vim.fn.expand("~/.config/nvim/lua/plugins/banner.txt")) do
        table.insert(banner, line)
    end
    return banner
end



-- Dashboard para Neovim
return{
	{
	        'nvimdev/dashboard-nvim',
		config = function()
			-- dashboard.lua
			require('dashboard').setup {
    				theme = 'hyper',
    				config = {
        				header = read_banner(),
					center = {
							{
                						icon = '  ',
								desc = 'Find File               ',
								action = 'Telescope find_files',
								key = 'F'
							},
							{
								icon = '  ',
								desc = 'Recents			',
								action = 'Telescope oldfiles',
								key = 'R'
							},
							{
               							 icon = '  ',
								 desc = 'Find Word                ',
								 action = 'Telescope live_grep',
							 	key = 'T'
						 	}
        					},
        				footer = {"Happy Coding!"},  -- Mensaje en el pie del dashboard
    					}
			}
		end,

	}

}
