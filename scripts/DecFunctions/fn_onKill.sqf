//File: fn_onKill.sqf
//Author: Decimus
params [
  ["_unit", objNull, [objNull]],
  ["_killer", objNull, [objNull]]
];
if (_unit isKindOf "Man") then {
  _killerName = name _killer;
  _killedName = name _unit;
  if (player isEqualTo _unit and _killerName isNotEqualTo "Error: No unit" and _killerName isNotEqualTo "Error: No vehicle") then {
    uisleep 0.1;
    if (_killer != _unit) then  {
      _killerHealth = round((1 - (damage _killer)) * 100);
      systemChat format ["%1 had %2HP", _killerName, _killerHealth];
    };
  };
  if (player isEqualTo _killer) then {
    _notifMessage = "You killed " + _killedName;
    uisleep 0.3;
    private _kills = player getVariable["DEC_Killstreak", 0];
    if (_killer isNotEqualTo _unit) then  {
      player setVariable["DEC_Killstreak", _kills + 1];
      playSound "FD_Timer_F"; // other sound option HintExpand
      ["KillConfirmed",[_notifMessage]] call BIS_fnc_showNotification;
    };
    uisleep 0.2;
    player setDamage 0;
  };
};
