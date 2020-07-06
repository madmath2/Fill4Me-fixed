data:extend{
	--Custom hotkeys
    {
        type = "custom-input",
        name = "fill4me-keybind-reload",
        key_sequence = "CONTROL + R",
        consuming = "game-only",
    },
    {
        type = "custom-input",
        name = "fill4me-keybind-enable",
        key_sequence = "CONTROL + SHIFT + R",
        consuming = "none",
    },
	--Shortcut button
	{
		type = "shortcut",
		name = "fill4me-blacklist-button",
		order = "f[fill4me]",
		action = "lua",
		toggleable = true,
		icon =
		{
		  filename = "__Fill4Me__/thumbnail.png",
		  priority = "extra-high-no-scale",
		  size = 144,
		  scale = 1,
		  flags = { "icon" }
		},
		small_icon =
		{
		  filename = "__Fill4Me__/thumbnail.png",
		  priority = "extra-high-no-scale",
		  size = 144,
		  scale = 1,
		  flags = { "icon" }
		},
		disabled_small_icon =
		{
		  filename = "__Fill4Me__/thumbnail.png",
		  priority = "extra-high-no-scale",
		  size = 144,
		  scale = 1,
		  flags = { "icon" }
		}
	}
}