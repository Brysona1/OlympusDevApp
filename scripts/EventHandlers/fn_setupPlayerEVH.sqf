//File: fn_playerEventHandlers.sqf
//Author: Decimus


//Author: Decimus
player addEventHandler ["InventoryClosed", {
  call DEC_fnc_repackMags;
}];
player addEventHandler ["Respawn", {_this call DEC_fnc_onPlayerRespawn}];
player addEventHandler ["Killed", {_this call DEC_fnc_onPlayerKilled}];
