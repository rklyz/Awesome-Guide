# Awesome-Backup

### Offered:

- The basic/important part of awesome's config. (you don't need to seperate the whole rc.lua into parts anymore)
- Clean setup with titlebar.. But without the bar
- volume & brightness lib
- More cleaner config (atleast it's better than my previous config)

<h2>Guide</h2>

### How do you start ricing awesome?

Separating the default config can a good starting point. However, the process of it can be very annoying.

But thankfully, I've done that horrendous job.

you can get the pre-config files by clone it from here into `$HOME/.config/awesome/`

``` sh
git clone https://github.com/rklyz/Awesome-Backup.git
mkdir $HOME/.config/awesome
cp -r Awesome-Backup/awesome/* $HOME/.config/awesome/
```

Next, go to [awesome.main.apps](https://github.com/rklyz/Awesome-Backup/blob/main/awesome/main/apps.lua) and change the variables to your preferences.

### Now what?

After you've logged in into awesome window manager, you'll find an empty desktop applied with a wallpaper. (if i'm not wrong)

Now you can start 'ricing' your desktop bit by bit.

<h2>Creating a BAR</h2>

Create a dir inside awesome.misc and a file "init.lua" inside it

``` sh
mkdir $HOME/.config/awesome/misc/bar
touch $HOME/.config/awesome/misc/bar/init.lua
```

inside awesome.misc.bar.init

```lua
-- require some awesome libraries
local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

-- Creating a bar
local the_bar = wibox { -- We're creating a bar named "the_bar"
  ontop = true,
  visible = true,
  width = awful.screen.focused().geometry.width, -- focused screen's width
  height = 40,
  type = 'dock'
}

the_bar : struts {top = 60, bottom = 20, left = 10, right = 10} -- Create the gap between apps and the screen in tiling mode

```

References:

- [wibox](https://awesomewm.org/apidoc/popups_and_bars/wibox.html#Object_properties)
- [awful.screen.focused()](https://awesomewm.org/apidoc/core_components/screen.html#awful.screen.focused)
- [:struts](https://awesomewm.org/apidoc/popups_and_bars/wibox.html#struts)

Try refreshing awesome and see if the bar works.

...

ofcourse it **did not** work. Cause you haven't actually run it.

To make it work, you need to run it through **rc.lua**.

```lua
...

-- init widget
require "misc"
require "misc.bar" -- This line

...
```

Now it should be working. However, it's just a blank boring bar. Let's put some widgets into it!

### Creating a clock widget

Lets create a file name clock.lua inside awesome.misc.bar folder

```sh
touch $HOME/.config/awesome/misc/bar/clock.lua
```

inside clock.lua

```lua
-- require some awesome libraries
local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

-- Creating a clock
local clock = wibox.widget.textbox()
clock.font = "Roboto 14"

-- Create a function for updating the time
local function update_time()
  time = os.date("%H:%M")
  clock.markup = time
end

-- Timer
gears.timer {
  timeout = 60,          -- update every X second
  autostart = true,      -- start automatically
  call_now = true,       -- run callback when timer is created
  callback = function()
    update_time()
  end
}

return clock -- This is IMPORTANT

```

references:

- [wibox.widget.textbox](https://awesomewm.org/apidoc/widgets/wibox.widget.textbox.html)
- [os.date](https://www.lua.org/pil/22.1.html)
- [gears.timer](https://awesomewm.org/apidoc/core_components/gears.timer.html#gears.timer)

Now, inside of awesome.misc.bar.init

```lua
...
local beautiful = require "beautiful"

-- Get some widgets
local clock = require "misc.bar.clock" -- get the clock widget

local the_bar = wibox {
        ontop = true,
        visible = true,
        width = awful.screen.focused().geometry.width,
        height = 40,
        type = 'dock'
}

the_bar : struts {top = 60, bottom = 20, left = 10, right = 10}

the_bar : setup {
  nil,   -- Left part of the bar
  nil,   -- Middle part ^
  clock, -- Right part ^
  layout = wibox.layout.align.horizontal,
}

...
```

references:

- [:setup](https://awesomewm.org/apidoc/popups_and_bars/wibox.html#setup)
- [wibox.layout.align](https://awesomewm.org/apidoc/widget_layouts/wibox.layout.align.html)

And there you have it, a working clock!

to be continued..
