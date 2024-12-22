-- https://github.com/KevinSilvester/wezterm-config
local Config = require("config")

require("scripts.tabs")

return Config:init()
	:append(require("config.general"))
--	:append(require("config.domains"))
	:append(require("config.bindings"))
	:append(require("config.appearance")).options
