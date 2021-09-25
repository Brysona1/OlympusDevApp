//File: fn_jumpOver.sqf
//Author: Aquaman
params ["_displayCode","_keyCode","_isShift","_isCtrl","_isAlt"];
_handled = false;
if ((_keyCode == 57 && _isShift) && (animationState player != SL_jumpAnimation)) then {
 private ["_height","_velocity","_direction","_speed"];
 if ((player == vehicle player) && (isTouchingGround player) && ((stance player == "STAND") || (stance player == "CROUCH"))) exitWith
 {
  _height = (SL_jumpBaseHeight - (load player)) max SL_jumpMaxHeight;
  _velocity = velocity player;
  _direction = direction player;
  _speed = SL_jumpBaseSpeed;
  player setVelocity [(_velocity select 0) + (sin _direction * _speed), (_velocity select 1) + (cos _direction * _speed), ((_velocity select 2) * _speed) + _height];
  SL_fn_jumpOverAnim = [player,_velocity,_direction,_speed,_height,SL_jumpAnimation];
  publicVariable "SL_fn_jumpOverAnim";
  if (currentWeapon player == "") then // half working buggy 'fix' for having no weapon in hands (no animation available for it... BIS!!)
  {
   player switchMove SL_jumpAnimation;
   player playMoveNow SL_jumpAnimation;
  }
  else
  {
   player switchMove SL_jumpAnimation;
  };
  _handled = true;
 };
};
_handled
