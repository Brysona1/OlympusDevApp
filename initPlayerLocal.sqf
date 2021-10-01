//File: initPlayerLocal.sqf


//fixing the aids part of arma
disableSerialization;
enableEnvironment false;
player disableConversation true;

enableRadio false;
enableSaving [false, false];
0 setFog 0;

player setCustomAimCoef 0.0;
player enableFatigue false;

player switchCamera "EXTERNAL";
DEC_ActiveRobberies = [];
player addAction ["<t color='#ff1100'>Setoff Suicdie Vest</t>", {
  _bomb = "Bo_GBU12_LGB" createVehicle [0, 0, 300];
  _bomb attachTo [player, [0, 0, 1]];
  detach _bomb;
  removeVest player;
  },nil, 0, true, true, "", "vest player isEqualTo 'V_HarnessOGL_brn'"];
player addAction ["Attach Speed Bomb", {
  [] spawn DEC_fnc_attachSpeedBomb
  },nil, 0, true, true, "", "'DemoCharge_Remote_Mag' in magazines player and cursorTarget isKindOf 'LandVehicle' and player distance cursorObject < 3"];

//idk I was bored and curious if this worked
/*
player addAction ["Hacker Man", {
  _entities = getpos player nearObjects 2000;
  {
    if (_x isNotEqualTo player) then {
      _x setDamage 1;
    };
  } forEach _entities;
}];
*/
[] spawn DEC_fnc_hud;
[] call DEC_fnc_setupPlayerEVH;
