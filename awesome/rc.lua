pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require "awful"
local gears = require "gears"
local beautiful = require "beautiful"

require "main.error_handling"

beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")

-- init config
require "main.wallpaper"
require "main.layout"
require "main.rules"
require "main.bindings.bindings"
require "main.bindings.custom_bindings"
require "main.tags"
require "main.menu"

require "awful.autofocus"

-- init widget
require "misc"

-- Autorun at startup
awful.spawn.with_shell("bash ~/.config/awesome/main/autorun.sh")
