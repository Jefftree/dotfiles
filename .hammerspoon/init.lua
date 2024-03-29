local window = require "hs.window"
local grid = require "hs.grid"
local screen = require "hs.screen"
local alert = require "hs.alert"
local hints = require "hs.hints"
local hotkey = require "hs.hotkey"
local appfinder = require "hs.appfinder"
local application = require "hs.application"

-- Remove -1 FPS Animation
window.animationDuration = 0

-- Grid Layout
grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 8
grid.MARGINX = 0
grid.MARGINY = 0

local gwidth = grid.GRIDWIDTH
local gheight = grid.GRIDHEIGHT
local snapleft = {x = 0, y = 0, w = gwidth/2, h = gheight}
local snapright = {x = gwidth/2, y = 0, w = gwidth/2, h = gheight}
local snaptop = {x = 0, y = 0, w = gwidth, h = gheight/2}
local snapbot = {x = 0, y = gheight/2, w = gwidth, h = gheight/2}

local snapfull = {x = 0, y = 0, w = gwidth, h = gheight}

local singlePane = {
  iTerm2 = {1, snapfull},
  Emacs = {1, snapfull},
  Firefox = {1, snapfull},
}

local dualPane = {
  iTerm2 = {2, snapright},
  Emacs = {1, snapleft},
  Firefox = {1, snapright},
}

local configureLayout = function(layout)
  for app, location in pairs(layout) do
    local app = appfinder.appFromName(app)
    if app then
      local scrs = screen.allScreens()
      local win = app:mainWindow()
      grid.set(win, location[2], scrs[location[1]])
    end
  end
end

local snapwindow = function(param)
  return function()
    local win = window.focusedWindow()
    grid.set(win, param, win:screen())
  end
end

local launch = function(prog)
  return function()
    application.launchOrFocus(prog)
    local app = appfinder.appFromName(prog)
    if app then
      app:activate()
    end
  end
end

local launchFinder = function(prog)
  return function()
    application.launchOrFocus(prog)
    local app = appfinder.appFromName(prog)
    if app then
      app:activate()
      app:selectMenuItem({"Window", "Bring All to Front"})
    end
  end
end

-- Prefix hints with first char of Application
hints.showTitleThresh = 0
hints.style = "vimperator"

local bindings = {
  Left = snapwindow(snapleft),
  Right = snapwindow(snapright),
  Up = snapwindow(snaptop),
  Down = snapwindow(snapbot),
  T = snapwindow(snapfull),
  -- B = launch("Firefox"),
  -- V = launch("mpv"),
  -- E = launch("Emacs"),
  I = launch("iTerm"),
  Y = launch("Spotify"),
  -- O = launch("/Applications/Google Chrome Canary.app"),
  -- = launch("Lightroom Classic"),
}

for key, func in pairs(bindings) do
  hotkey.bind({"cmd", "shift"}, key, func)
end

screen.watcher.new(function()
    if #(screen.allScreens()) == 1 then
      alert.show("Single Screen")
      configureLayout(singlePane)
    elseif #(screen.allScreens()) == 2 then
      alert.show("Dual Screen")
      configureLayout(dualPane)
    end
end):start()

-- Reloading

function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
alert.show("Config loaded")

-- Caffeine Clone

caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
  if state then
    caffeine:setTitle("++")
  else
    caffeine:setTitle("--")
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
  caffeine:setClickCallback(caffeineClicked)
  setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end
