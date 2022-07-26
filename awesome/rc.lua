-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require "awful"
local gears = require "gears"
local beautiful = require "beautiful"

require "main.error_handling"

beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")

local naughty = require("naughty")
local ruled = require("ruled")

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

ruled.notification.connect_signal('request::rules', function()
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- Autorun at startup
awful.spawn.with_shell("bash ~/.config/awesome/main/autorun.sh")
