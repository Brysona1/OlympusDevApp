//File: robGasStation.sqf
//Author: Decimus
/*
Description:
	perform gas station robbery action when player attempts to
  rob a gas station
*/

params[["_object", objNull]];

if(player getVariable["DEC_RobbingGasStation", false]) exitWith {hint "You are already robbing this gas station";}; //check if player is already robbing the gas station
if(player getVariable["DEC_RecentGSRobbery", false]) exitWith {hint "You must wait 5 minutes before attempting this again";}; //check if player is already robbing the gas station
if(_object isEqualTo objNull) exitWith {}; //check if object returns null
if(currentWeapon player isEqualTo "") exitWith {hint "Must have a weapon to rob the gas station";};
private _robberyBuilding = nearestObjects[_object, ["House"], 15] select 0; //Find gas station building
private _robberyProgress = 0;

//create and display robbing notification to players
private _nearestCity = className nearestLocation [_robberyBuilding, "nameCity"];
private _message = parsetext format["<t size='1.5' align='center'color='#ff1100'>!!!Robbery in progress!!!</t><br/><br/><t>The gas station near %1 is being robbed by %2</t>", _nearestCity, name player];
_message remoteExecCall ["hint"];

//create marker
private _marker = createMarker ["robberyMarker", _robberyBuilding];
_marker setMarkerType "mil_warning";
_marker setMarkerColor "ColorOrange";
_marker setMarkerText " !!!Robbery in progress!!!";

//begin robbery
player setVariable ["DEC_RecentGSRobbery", true];
player setVariable["DEC_RobbingGasStation", true];
//Setup our progress bar.
disableSerialization;
("Dec_Layer2" call BIS_fnc_rscLayer) cutRsc ["ProgressBar","PLAIN DOWN"];
_progressBar = uiNamespace getVariable "ProgressBar";
_progress = _progressBar displayCtrl 1000;
_text = _progressBar displayCtrl 1001;
_text ctrlSetText format["Robbery progress: %1%2", _robberyProgress, "%"];
_progress progressSetPosition 0;

playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", _robberyBuilding];
while {_robberyProgress < 100} do {
  uisleep 1.66;
  //exit conditions
  if (!alive player) exitwith{};
  if (player distance _object > 5) exitwith {hint "You must stay within 5m of the gas station to rob it";}; //cancel robbery if player gets too far away

  //continue robbery
  _robberyProgress = _robberyProgress + 1;
  _progress progressSetPosition (_robberyProgress / 100);
  _text ctrlSetText format["Robbery progress: %1%2", _robberyProgress, "%"];
  if (_robberyProgress % 5 == 0 and _robberyProgress % 100 != 0) then {playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", _robberyBuilding];};  //replay sound every 5% of robbery progress
};

//after robbery is over/canceled
_progressBar closeDisplay 1;
deleteMarker _marker;
player setVariable ["DEC_RobbingGasStation", false];
if (_robberyProgress == 100) then {
    systemchat "Robbery completed";
} else {
    systemchat "Robbery Canceled";
};
uisleep 300;
player setVariable ["DEC_RecentGSRobbery", false];
