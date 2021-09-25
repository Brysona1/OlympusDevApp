//File: fn_onPlayerRespawn.sqf
//Author: Decimus
[] call DEC_fnc_repackMags;

player enableFatigue false;
player setAnimSpeedCoef 1.05;
player setCustomAimCoef 0.0;

player switchCamera "EXTERNAL";

player setVariable["DEC_Killstreak", 0];
