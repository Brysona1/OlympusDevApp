//fine: fn_attachSpeedBomb.sqf
//Author: Decimus
/*
Description:
	attach a speed bomb to the car the player is looking at
	and add event handler to car for speed bomb functions
*/
private _vehicle = cursorObject;
if (_vehicle isEqualto objNull or !(_vehicle isKindOf 'LandVehicle')) exitwith {hint "Could not find the vehicle to attach the speedbomb to"};
if !(attachedObjects _vehicle isEqualTo []) exitwith {hint "There is already a bomb on this car"};

_bomb = "Bo_GBU12_LGB" createVehicle [0, 0, 300];
_bomb attachTo [cursorTarget, [0, 0, .1]];
hideObject _bomb;
player removeMagazine "DemoCharge_Remote_Mag";
hint "Speed bomb successfully attached";

_vehicle addEventHandler ["GetIn", {
	params ["_veh", "_role", "_unit", "_turret"];
	[_veh, _thisEventHandler] spawn {
		params ["_v", "_eh"];
	  private _objectsAttached = attachedObjects _v;
	  private _b = _objectsAttached select 0;
	  waituntil {uisleep 0.5; speed _v > 88 or vehicle player isnotEqualto _v};
		if (speed _v > 88) then {
			hint parsetext "<t size='1.5' align='center'color='#ff1100'>!!!Speedbomb Armed!!!</t>
				<br/><br/>
				<t>A speedbomb was attached to your car if you drop below</t>
				<t color='#ff1100'>50KM/H </t> <t>you will blow up</t>";
			waituntil {uisleep 0.1; speed _v < 50};
			detach _b;
			_v removeEventHandler ["GetIn", _eh];
		};
	};
}];
