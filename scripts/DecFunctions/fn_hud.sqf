//File: fn_hud.sqf
//Author: Decimus
waitUntil {!isNull player};
waitUntil { alive player };
if (!local Player) exitWith {};

disableSerialization;
("Dec_Layer" call BIS_fnc_rscLayer) cutRsc ["DecHud","PLAIN"];

_display = uiNamespace getVariable "DecHud_display";
_ctrlHealth = _display displayCtrl 1000;
_ctrlKillstreak = _display displayCtrl 1001;


while {!isNull _display} do {
  uisleep 0.1;

  private _kills = player getVariable["DEC_Killstreak", 0];

  _ctrlKillstreak ctrlSetText format ["%1 Kills", _kills];
  _ctrlHealth ctrlSetText format ["%1%2", round((1 - (damage player)) * 100), "%"];
  switch (true) do {
    case (damage Player >= 0.75): {
      _ctrlHealth ctrlSetTextColor [1,0,0,1];
    };
    case (damage Player >= 0.5): {
      _ctrlHealth ctrlSetTextColor [1,0.645,0,1];
    };
    case (damage Player >= 0.25): {
      _ctrlHealth ctrlSetTextColor [1,1,0,1];
    };
    case (damage Player < 0.25): {
      _ctrlHealth ctrlSetTextColor [0,0.5,0,1];
    };
  };
};
