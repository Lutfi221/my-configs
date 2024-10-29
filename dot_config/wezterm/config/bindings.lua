local wezterm = require("wezterm")
local act = wezterm.action

local mod = {}

mod.SUPER = "ALT"
mod.SUPER_REV = "ALT|CTRL"

local keys = {
	{
		key = "P",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivateCommandPalette,
	},

	-- cursor movement --
	{ key = "LeftArrow", mods = mod.SUPER, action = act.SendString("\x1bOH") },
	{ key = "RightArrow", mods = mod.SUPER, action = act.SendString("\x1bOF") },
	{ key = "Backspace", mods = mod.SUPER, action = act.SendString("\x15") },

	-- copy/paste --
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

	-- tabs --
	-- tabs: spawn+close
	{ key = "t", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
	{ key = "w", mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },

	-- tabs: navigation
	{ key = "[", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = mod.SUPER, action = act.ActivateTabRelative(1) },
	{ key = "[", mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
	{ key = "]", mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

	-- window --
	-- spawn windows
	{ key = "n", mods = mod.SUPER, action = act.SpawnWindow },

	-- panes --
	-- panes: split panes
	{
		key = [[\]],
		mods = mod.SUPER_REV,
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = [[\]],
		mods = mod.SUPER,
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- panes: zoom+close pane
	{ key = "Enter", mods = mod.SUPER, action = act.TogglePaneZoomState },
	{ key = "w", mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

	-- panes: navigation
	{ key = "k", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Down") },
	{ key = "h", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Right") },
	{
		key = "p",
		mods = mod.SUPER_REV,
		action = act.PaneSelect({ alphabet = "1234567890", mode = "SwapWithActiveKeepFocus" }),
	},
}

return {
	keys = keys,
}
