//File: robGasStation.sqf
//Author: Decimus
/*
Description:
	perform gas station robbery action when player attempts to
  rob a gas station
*/

params[["_object", objNull]];
if(_object isEqualTo objNull) exitWith {}; //check if object returns null
if(player getVariable["DEC_RobbingGasStation", false]) exitWith {hint "You are already robbing this gas station";}; //check if player is already robbing the gas station
if(_object in DEC_ActiveRobberies) exitWith {hint "This gas station is already being robbed by someone else";};     //check if someone else is robbing the gas station
if(player getVariable["DEC_RecentGSRobbery", false]) exitWith {hint "You must wait 5 minutes before attempting this again";}; //check if player is already robbing the gas station
if(primaryWeapon player isEqualTo "" && secondaryWeapon player isEqualTo "") exitWith {hint "Must have a weapon to rob the gas station";}; //exit if player doesnt have weapon
if(playerSide isNotEqualTo civilian) exitWith {hint "You cannot rob a gas station while on duty";}; //make sure player is not cop or medicmeone else";};
private _robberyBuilding = nearestObjects[_object, ["House"], 15] select 0; //Find gas station building
private _robberyProgress = 0;
private _markerName = str _object;

//create and display robbing notification to players
private _nearestCity = className nearestLocation [_robberyBuilding, "nameCity"];
private _message = parsetext format["<t size='1.5' align='center'color='#ff1100'>!!!Robbery in progress!!!</t><br/><br/><t>The gas station near %1 is being robbed by %2</t>", _nearestCity, name player];
_message remoteExecCall ["hint"];

//begin robbery
player setVariable["DEC_RobbingGasStation", true];
DEC_ActiveRobberies pushback _object;
publicVariable "DEC_ActiveRobberies";

//create marker
private _marker = createMarker [_markerName, _robberyBuilding];
_marker setMarkerType "mil_warning";
_marker setMarkerColor "ColorOrange";
_marker setMarkerText " !!!Robbery in progress!!!";
//Setup our progress bar.
disableSerialization;
("Dec_Layer2" call BIS_fnc_rscLayer) cutRsc ["ProgressBar","PLAIN DOWN"];
_progressBar = uiNamespace getVariable "ProgressBar";
_progress = _progressBar displayCtrl 1000;
_text = _progressBar displayCtrl 1001;
_text ctrlSetText format["Robbery progress: %1%2", _robberyProgress, "%"];
_progress progressSetPosition 0;

playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", _robberyBuilding];
while {_robberyProgress < 100 && alive player} do {
  uisleep 1.66;
  //other exit condition with unique message
  if (player distance _object > 5) exitWith {hint "You must stay within 5m of the gas station to rob it";}; //cancel robbery if player gets too far away

  //continue robbery
  _robberyProgress = _robberyProgress + 1;
  _progress progressSetPosition (_robberyProgress / 100);
  _text ctrlSetText format["Robbery progress: %1%2", _robberyProgress, "%"];
  if (_robberyProgress % 5 == 0 and _robberyProgress % 100 != 0) then {playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss", _robberyBuilding];};  //replay sound every 5% of robbery progress
};

//after robbery is over/canceled
_progressBar closeDisplay 1;
DEC_ActiveRobberies deleteAt (DEC_ActiveRobberies find _object);
publicVariable "DEC_ActiveRobberies";

deleteMarker _marker;
player setVariable ["DEC_RobbingGasStation", false];

if (_robberyProgress == 100) then {
  player setVariable ["DEC_RecentGSRobbery", true];
  systemchat "Robbery completed";
  uisleep 300;
  player setVariable ["DEC_RecentGSRobbery", false];
} else {
  systemchat "Robbery Canceled";
};
