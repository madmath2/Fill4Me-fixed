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

	blacklist.lua

Commands for Fill4Me.  (Precursor to a UI)

--]]

--Not sure if I needed to add that copyright thing to this page, but better safe than sorry.

--Simple function to split string by comma (ignores comma and whitespace)
local function split(str)
	items = {}
	for item in string.gmatch(str,'[^,%s]+') do
		table.insert(items,item)
	end
	return items
end

--Function to apply blacklist settings to current player
local function fill4meBlacklist(event)
	--Reset the current list if people removed items from list
	fill4me_cmd.reset_me(event)
	--Make a local copy of the current event, current player, and blacklist settings
	local new_event = table.deepcopy(event)
	local player = game.players[event.player_index]
	--Make sure to split the string format of the setting into several strings in a table
	local exclusion_fuel = split(player.mod_settings["fill4me-blacklist-fuel"].value)
	--local exclusion_ammo = split(player.mod_settings["fill4me-blacklist-ammo"].value)
	--Also why isn't there an ammo variation of the exclusion command?
	
	--Run the exclusion command for every fuel item in the list
	for _, fuel in pairs(exclusion_fuel) do
		new_event.parameter = fuel
		fill4me_cmd.exclude(new_event)
	end
end


--Shortcut button that calls the above script
script.on_event(defines.events.on_lua_shortcut, function(event)
	if event.prototype_name == "fill4me-blacklist-button" then
		fill4meBlacklist(event)
	end
end)
