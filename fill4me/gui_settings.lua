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

	fill4me - gui-settings.lua

	Build a UI for managing the settings used by Fill4Me.

	Note: This UI is primarily for use with multiplayer, as single-player
	users will likely desire to use the game's mod settings UI.

--]]

fill4me_gui = {}

function fill4me_gui.init()
	kw_newTabDialog('fill4me.gui', 
		{caption={'fill4me.gui.title'}},
		{position='center', defaultTab='enable'}, 
		function(dialog) -- instantiation.
			-- must do button connections *outside* of any render functions.
				dialog:addTab('enable',
				{caption = {'fill4me.gui.enable.title'}, tooltip = {'fill4me.gui.enable.tooltip'}},
				function(dialog, tab) -- tab instantiation
					
				end,
				function(player, dialog, container) -- tab render
				end
			)
		end,
		function(player, dialog, container) -- dialog render
			-- on display
		end
	)
end

Event.register(Event.def("softmod_init"), fill4me_gui.init)
