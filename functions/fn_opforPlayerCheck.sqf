/*
  Name: fn_opforPlayerCheck.sqf
  Author: lordmungus
  Description: Checks whether opfor players are respecting mission parameters.
*/

_justPlayers = allPlayers - entities "HeadlessClient_F";
_westCount = 0;
_eastCount = 0;

{
  if(side _x == west) then
  {
    _westCount = _westCount + 1;
  };
  if(side _x == east) then
  {
    _eastCount = _eastCount + 1;
  };
} forEach _justPlayers;

_opforPlayerConstraint = "OpforPlayerConstraint" call BIS_fnc_getParamValue;

if(_opforPlayerConstraint != 0) then {
  if( _westCount / _eastCount < _opforPlayerConstraint  && (side player == east || side player == resistance) ) then {
    ["tooManyOpfor", false, true] call BIS_fnc_endMission;
  };
};
