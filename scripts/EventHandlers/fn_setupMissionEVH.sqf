//File: fn_MissionEventhandler.sqf
//Author: Decimus
addMissionEventHandler ["EntityKilled", {
  params ["_killed", "_killedBy", "_instigator", "_useEffects"];
  [_killed, _killedBy] spawn dec_fnc_onKill;
}];
