require "plugins"
require "key_bindings"
require "neotree"
require "lsp"
require 'nvim-autopairs'.setup{}
--require 'toggleterm'
require'toggleterm'.setup{
	size = function(term)
    		if term.direction == "horizontal" then
      			return 15
    		elseif term.direction == "vertical" then
      			return vim.o.columns * 0.4
    		end
  	end,	
	persist_size = false,
	open_mapping = [[<C-t>]]
}
vim.opt.number = true
vim.opt.mouse = 'a' 
-- color scheme related shit
local theme = {
  background = "dark",
  cmd = [[colorscheme onedark]]
}
vim.opt.termguicolors = true
vim.o.background = theme.background
vim.cmd(theme.cmd)

--dashboard

--yep i stole many things from you, noname!
function hi(hi_name, hi_table, force)
	local cmd_str

	if force == true then
		cmd_str = "hi! " .. hi_name
	else
		cmd_str = "hi " .. hi_name
	end

	for key, value in pairs(hi_table) do
		cmd_str = cmd_str .. " " .. key .. "=" .. value
	end

	vim.cmd(cmd_str)
end

local colors = {
	black2 = "#2b2b3b",
	grey_fg = '#545277',
	light_grey = "#6d749c",
	black = "#212131",
	white = "#b6bcdd",
	blue = "#729aef",
	red = "#ff5370",
	bg = "#242434",
	yellow = "#ffcb6b",
	green = "#7cd380",
	fg = "#bbc2cf",
	orange = "#e37858",
	purple = "#b782da",
	lightbg = "#333748",
	cyan = '#529dbc',
}


hi("DashboardHeader", {  guifg = "#18accc" })
hi("DashboardFooter", { guifg = "#18accc"})
hi("DashboardCenter", { guifg = colors.blue })
hi("DashboardShortCut", { guifg = colors.blue })

vim.g.dashboard_custom_header = {
'   -----                                                               ----- ',
' 1 | H |                                                               |He | ',
'   |---+----                                       --------------------+---| ',
' 2 |Li |Be |                                       | B | C | N | O | F |Ne | ',
'   |---+---|                                       |---+---+---+---+---+---| ',
' 3 |Na |Mg |3B  4B  5B  6B  7B |    8B     |1B  2B |Al |Si | P | S |Cl |Ar | ',
'   |---+---+---------------------------------------+---+---+---+---+---+---| ',
' 4 | K |Ca |Sc |Ti | V |Cr |Mn |Fe |Co |Ni |Cu |Zn |Ga |Ge |As |Se |Br |Kr | ',
'   |---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---| ',
' 5 |Rb |Sr | Y |Zr |Nb |Mo |Tc |Ru |Rh |Pd |Ag |Cd |In |Sn |Sb |Te | I |Xe | ',
'   |---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---| ',
' 6 |Cs |Ba |LAN|Hf |Ta | W |Re |Os |Ir |Pt |Au |Hg |Tl |Pb |Bi |Po |At |Rn | ',
'   |---+---+---+------------------------------------------------------------ ',
' 7 |Fr |Ra |ACT|                                                             ',
'   -------------                                                             ',
'               ------------------------------------------------------------- ',
'    Lanthanide |La |Ce |Pr |Nd |Pm |Sm |Eu |Gd |Tb |Dy |Ho |Er |Tm |Yb |Lu | ',
'               |---+---+---+---+---+---+---+---+---+---+---+---+---+---+---| ',
'    Actinide   |Ac |Th |Pa | U |Np |Pu |Am |Cm |Bk |Cf |Es |Fm |Md |No |Lw | ',
'               ------------------------------------------------------------- ',
}

vim.g.dashboard_custom_footer = {
	"ln -s /etc/sv/sigma /var/service",
}
vim.g.dashboard_custom_section = {
	a = { description = { "" }, command = "" },
}
