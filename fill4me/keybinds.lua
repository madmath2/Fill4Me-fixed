--[[
Copyright 2018 "Kovus" <kovus@soulless.wtf>

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.
3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software without
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

	keybinds.lua

Handles the effects of pressing the bound keys in the mod.

--]]

require 'stdlib/event/event'
require 'lib/event_extend'

f4m_keybind = {}

function f4m_keybind.re_up(event)
    -- Get entity under cursor, then try and load it.
    local player = game.get_player(event.player_index)
    local entity = player.selected
    if entity then
        -- This is copied from fill4me.lua, and violates DRY.
        local pldata = fill4me.player(event.player_index)
		local lent = fill4me.for_player(pldata, "loadable_entities")[entity.name]
		if lent then
			if lent.fuel_categories then
				fill4me.load_fuel(entity, lent, event.player_index)
			end
			if lent.guns or lent.ammo_categories then
				fill4me.load_ammo(entity, lent, event.player_index)
			end
		end
    end
end

function f4m_keybind.enable(event)
	fill4me.toggle(event.player_index)
end

script.on_event("fill4me-keybind-reload", f4m_keybind.re_up)
script.on_event("fill4me-keybind-enable", f4m_keybind.enable)
