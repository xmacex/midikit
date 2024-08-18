-- MIDI cc matrix mod output.
-- Modeled after sixolet's crowkit.

local mod = require 'core/mods'
local matrix = require('matrix/lib/matrix')

-- A utility to generate parameter values.
local n = function(idx, name)
   return "mk_"..idx.."_"..(name or "")
end

-- A utility to render MIDI device name.
function get_midi_name(param)
   local midi_dev = midi.connect(param.value)
   return param.value..": "..midi_dev.name
end

-- Construct a single MIDI output.
local make_midi_output = function(i)
  params:add_group("midi out "..i, 5)
  params:add_option(n(i, "mode"), "mode", {"cc", "note"})
  params:set_action(n(i, "mode"), function(mode)
    if mode == 1 then
      params:show(n(i, "cc"))
      _menu.rebuild_params()
    else
      params:hide(n(i, "cc"))
      _menu.rebuild_params()
    end
  end)
  params:add_number(n(i, "device"), "device", 1, 16, 1, get_midi_name)
  params:add_number(n(i, "ch"), "ch", 1, 16, 1)
  params:add_number(n(i, "cc"), "cc", 1, 127, 95)
  params:add_number(n(i, "value"), "value", 1, 127, 1)
  params:set_action(n(i, "value"), function()
    local mididev = midi.connect(params:get(n(i, "device")))
    local val = params:get(n(i, "value"))
    if params:get(n(i, "mode")) == 1 then
      mididev:cc(params:get(n(i, "cc")), params:get(n(i, "value")), params:get(n(i, "ch")))
    elseif params:get(n(i, "mode")) == 2 then
      -- Stuck notes galore. If this a feature I want, or rather only CC? tg mode does triggers, better.
      mididev:note_on(params:get(n(i, "value")), 100, params:get(n(i, "ch")))
    end
  end)

  _menu.rebuild_params()
  matrix:defer_bang(n(i, "value"))
end

-- Initialization for a handful of MIDI destinations.
local pre_init = function()
    matrix:add_post_init_hook(function()
        params:add_separator("midikit")
        for i=1,4,1 do
          make_midi_output(i)
        end
    end)
end

-- Register to initialize this mod on script start.
mod.hook.register("script_pre_init", "midikit pre init", pre_init)
