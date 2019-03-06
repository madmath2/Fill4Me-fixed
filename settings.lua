data:extend({
	--
	-- global settings
	--
	{
		type = "int-setting",
		name = "fill4me-maximum-fuel-value",
		-- name is used to determine localization
		setting_type = "runtime-global",
		default_value = 0
	},
	{
		type = "int-setting",
		name = "fill4me-maximum-ammo-value",
		-- name is used to determine localization
		setting_type = "runtime-global",
		default_value = 0
	},
	--
	-- per player settings
	--
	{
		type = "bool-setting",
		name = "fill4me-show-gui-button",
		-- name is used to determine localization
		localised_name = {'fill4me.gui.show_button'},
		localised_description = {'fill4me.gui.show_button_desc'},
		setting_type = "runtime-per-user",
		default_value = true
	},
})
