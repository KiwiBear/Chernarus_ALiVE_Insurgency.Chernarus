/*
  Name: fn_prepareDrone.sqf
  Author: Lordmungus
  Description: Checks whether NATO faction is allowed to deploy drone for cache-hunting.
*/

private["_caller"];
hint "Test";
_caller = _this select 1;

if(typeOf _caller != "CUP_B_US_Officer") exitWith { hint "Only the commander has this option!" };

if(typeOf _caller == "CUP_B_US_Officer") then
{
  _currentBLUFORForcepool = [ALIVE_globalForcePool, "CUP_B_US_Army"] call ALIVE_fnc_hashGet;

  if(_currentBLUFORForcepool > 500) then
  {
    remoteExec ["server_fnc_requestDrone", 2, true];
    [-500, "CUP_B_US_Army"] remoteExecCall ["server_fnc_adjustLogisticsPool", 2, true];
  }
  else
  {
    hint "NATO forcepool is under 500. Complete more sidetasks!";
  };
};
