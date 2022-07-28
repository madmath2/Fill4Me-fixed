# Fill4Me

## Forked to fix issues

Original mod by [kovus](https://mods.factorio.com/user/kovus) available [here](https://mods.factorio.com/mod/Fill4Me). All credits for the awesome work should go to kovus.

This version only adds [this fix](https://gitlab.com/FishBus/Fill4Me/-/merge_requests/10) for an annoying error log, but is otherwise identical to the original mod.

----------

## Original description

Fill 4 Me is a Factorio mod to automatically insert fuel and/or ammunition into entities when you place them.

Fill4Me is ready to work with other mods, and automatically determines at load time what the best ammunition & fuels are for entities.  It will re-evaluate these decisions when new mods are loaded or mods are unloaded, ensuring that you put the best ammunition or fuels you have on-hand into your entities, including custom fuels and ammunition.  Entities which have multiple ammunition types will have some of each type loaded into them.

Just in case you missed that:  __Fill4Me will work with any ammunition or fuel that can be inserted into any entity from any mod, and will accomodate mod changes between save/load.__

#### New commands

Fill4Me does not have much of a GUI at current, as there's not much of a need for one.  There is a tool button (top-left) which enable/disables Fill4Me at current.

* `/f4m.toggle` - Enable/Disable Fill4Me.
* `/f4m.max_percent` - Sets the maximum percent of an on-hand resource to place into an entity.  (Default 12%)

#### Why

Fill4Me was created to replace AutoFill (v1) on the FishBus servers.  We liked autofill, but when we started looking at doing modded games, it become apparent that autofill wasn't quite right for that environment.

I looked at maybe integrating AutoFill (v2) but I couldn't follow enough of the code to even consider trying to make it handle various mods and mod changes.

So, Fill4Me was born with the direct goal to automatically detect ammunition & fuels.  It needed to organize them into the best quality, and then determine which one to put into entities that you place.  This meant that mod changes wouldn't matter, as it would just re-evaluate the data and go on with it's happy life.


#### Known issues

Fill4Me is currently unable to calculate the best ammunitions when those ammunitions contain 'smoke' or cloud effects, such as poison/acid/napalm rockets.  This is due to a lack of information from Factorio, and is likely to be patched in 0.17.  Fill4Me already expects the information to be available in the correct format, so once it's available it should be taken advantage of automatically.

#### Maybe todo

Fill4Me could benefit from a small GUI at current:  It has per-player settings for the maximum (number) as well as the maximum percent of on-hand resources to place into an entity.  Some of this is exposed via commands, but very few people look for commands to modify their experiences.

Fill4Me is missing a feature from AutoFill(v1):  Per-player selection lists and priorities.  I believe it was largely created in order to handle the mod situation, so this feature will only be implemented if someone asks.  We've never desired it on the FishBus Servers, and I don't personally care for it.
