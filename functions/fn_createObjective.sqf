/*
  Name: fn_createObjective.sqf
  Author: Lordmungus
  Description: Creates custom ALiVE OPCOM objectives at coordinates x, y. Solution derived from ALiVE wiki.

*/

private["_objectiveParams","_factions","_faction","_opcom","_opcomSide"];
_objectiveParams = _this select 0;
_factions = _this select 1;
{
	_opcom = _x;
	{
		_faction = _x;
		_opcomSide = [_opcom,"side",""] call ALiVE_fnc_HashGet;

		if( _opcomSide == _faction) then {
			[_opcom, "addObjective", _objectiveParams] call ALiVE_fnc_OPCOM;
		};
	} forEach _factions;
} forEach OPCOM_INSTANCES;
