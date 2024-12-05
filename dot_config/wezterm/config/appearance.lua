local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

local custom = wezterm.color.get_builtin_schemes()[color_scheme]
custom.background = "#000000"
custom.tab_bar.background = "#040404"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "#080808"

return {
	color_scheme = color_scheme,
	color_schemes = {
		["OLEDppuccin"] = custom,
	},
	color_scheme = "OLEDppuccin",
	-- font = wezterm.font("CaskaydiaMono Nerd Font Mono"),
	font = wezterm.font("Hack Nerd Font Mono"),
	use_fancy_tab_bar = true,
	window_background_opacity = 0.7,
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
}
