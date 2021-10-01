//File: init.sqf
// Disable saving
enableSaving [false, false];
// Disable automatic radio messages
enableRadio false;
0 fadeRadio 0;

if (!hasInterface) exitWith {};

[] call DEC_fnc_setupMissionEVH;
