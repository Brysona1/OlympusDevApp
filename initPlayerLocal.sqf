//File: initPlayerLocal.sqf

// cleaning the chat
0 enableChannel [true, false];
1 enableChannel [true, false];
2 enableChannel [true, false];
3 enableChannel [true, false];

//fixing the aids part of arma
disableSerialization;
enableEnvironment false;
player disableConversation true;
enableSentences false;
enableRadio false;
enableSaving [false, false];
0 setFog 0;
player setUnitTrait ["Medic",true];
player setCustomAimCoef 0.0;
player enableFatigue false;
player switchCamera "EXTERNAL";

player addAction ["<t color='#ff1100'>Setoff Suicdie Vest</t>", {
  _bomb = "Bo_GBU12_LGB" createVehicle [0, 0, 300];
  _bomb attachTo [player, [0, 0, 1]];
  detach _bomb;
  removeVest player;
  },nil, 0, true, true, "", "vest player isEqualTo 'V_HarnessOGL_brn'"];
player addAction ["Attach Speed Bomb", {
  [] spawn DEC_fnc_attachSpeedBomb
  },
  nil, 0, true, true, "", "'DemoCharge_Remote_Mag' in magazines player and cursorTarget isKindOf 'LandVehicle' and player distance cursorObject < 3"];
//scuffed hacker man but hey look a forEach loop :)
player addAction ["Hacker Man", {
  _entities = getpos player nearObjects 10000;
  {
    if (_x isNotEqualTo player) then {
      _x setDamage 1;
    };
  } forEach _entities;
}];
[] spawn DEC_fnc_hud;
[] call DEC_fnc_setupPlayerEVH;
