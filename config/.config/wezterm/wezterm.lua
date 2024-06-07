-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

config.enable_scroll_bar = true
config.scrollback_lines = 20000;
config.hide_tab_bar_if_only_one_tab = true;

config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 150,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 150,
}
config.colors = {
  visual_bell = '#202020',
}

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make task numbers clickable
-- the first matched regex group is captured in $1.
-- table.insert(config.hyperlink_rules, {
--   regex = [[\b[tt](\d+)\b]],
--   format = 'https://example.com/tasks/?t=$1',
-- })

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
  regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
  format = 'https://www.github.com/$1/$3',
})

config.keys = {
  -- Replace the default SUPER-k with clearing the scrollback and viewport leaving the prompt line the new first line.
  {
    key = 'k',
    mods = 'SUPER',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  {
      key = 'd',
      mods = 'SUPER',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain'},
  },
  {
      key = 'd',
      mods = 'SUPER|SHIFT',
      action = act.SplitVertical { domain = 'CurrentPaneDomain'},
  },
  {
      key = 'h',
      mods = 'SUPER|SHIFT',
      action = act.ActivatePaneDirection 'Left',
  },
  {
      key = 'j',
      mods = 'SUPER|SHIFT',
      action = act.ActivatePaneDirection 'Down',
  },
  {
      key = 'k',
      mods = 'SUPER|SHIFT',
      action = act.ActivatePaneDirection 'Up',
  },
  {
      key = 'l',
      mods = 'SUPER|SHIFT',
      action = act.ActivatePaneDirection 'Right',
  },
}

-- and finally, return the configuration to wezterm
return config
