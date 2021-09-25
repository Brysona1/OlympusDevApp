//File: fn_repackMags.sqf
//Author: Decimus
/*
Description:
	repack all mags inside of the players inventory excluding
  the current mag in their weapon
*/

if (count magazines player < 1) exitWith {};

private _magList = [];

//get all unique mag types the player has
{
    if !(_x in _magList) then {
      _magList pushBackUnique _x;
    };
} forEach magazines player;

//repack each mag type found above
{
  private _totalBullets = 0;
  private _newMagCount = 0;
  private _bulletsLeftOver = 0;
  private _magID = _x;
  private _magCap = parseNumber (_magID splitString "R" select 0);
  //get total number of bullets in the player's inventory for current mag type
  {
    if ((magazinesAmmo [player, true] select _forEachIndex select 0) == _magID) then {
      _totalBullets = _totalBullets + (magazinesAmmo [player, true] select _forEachIndex select 1);
    };
  } forEach magazines player;
  if (_magCap > 0) then {
    _bulletsLeftOver = _totalBullets % _magCap;
    _newMagCount = (_totalBullets - _bulletsLeftOver) / _magCap;

    player removeMagazines _magID;
    player addMagazines [_magID, _newMagCount];
    if (_bulletsLeftOver > 0) then {
      player addMagazine [_magID, _bulletsLeftOver];
    };
  };
} forEach _magList;
