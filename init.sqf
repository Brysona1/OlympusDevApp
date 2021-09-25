//File: init.sqf
// Disable saving
enableSaving [false, false];

// Disable automatic radio messages
enableRadio false;
enableSentences false;
0 fadeRadio 0;

// voice
0 enableChannel [true, false]; // Enable user ability to send text but disable voice on global channel
1 enableChannel [true, false]; // Enable user ability to send text but disable voice on side channel
2 enableChannel [false, false]; // Disable user ability to send text and voice on Command channel
3 enableChannel [true, false]; // Enable user ability to send text but disable voice on group

if (!hasInterface) exitWith {};

[] call DEC_fnc_setupMissionEVH;

//Jump Script is not mine -Decimus
//Author: Aquaman
[] spawn {
  SL_jumpBaseHeight = 1.8;
  SL_jumpMaxHeight = 4.25;
  SL_jumpBaseSpeed = 0.5;
  SL_jumpAnimation = "AovrPercMrunSrasWrflDf";

  "AQ_fnc_jumpOver" addPublicVariableEventHandler {
   (_this select 1) spawn AQ_fnc_doAnim;
  };

  waituntil {!(isNull (findDisplay 46))};
  (findDisplay 46) displayAddEventHandler ["KeyDown", {_this call AQ_fnc_jumpOver}];
};
