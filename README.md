# Awesome-Backup
Not ready yet

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

### Creating a BAR

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
local create_bar = function(n)
  local the_bar = wibox { -- We're creating a bar named "the_bar"
    ontop = true,
    visible = true,
  }
end
```
to be continued..
