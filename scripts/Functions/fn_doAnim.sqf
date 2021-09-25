//File: fn_doAnim.sqf
//Author: Aquaman
params ["_unit","_velocity","_direction","_speed","_height","_anim"];
_unit setVelocity [(_velocity select 0) + (sin _direction * _speed), (_velocity select 1) + (cos _direction * _speed), ((_velocity select 2) * _speed) + _height];
_unit switchMove _anim;
