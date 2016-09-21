/*
  Name: ammoCacheCreator.sqf
  Author: Lordmungus
  Description: Spawns ammo caches in the beginning of the mission.
*/

_ammoCacheCount = "AmmoCacheCount" call BIS_fnc_getParamValue;

for "_i" from 1 to _ammoCacheCount do
{
  _x = (random 10000) + 2000;
  _y = (random 7000) + 4300;

  _cache = createVehicle ["AmmoCrates_NoInteractive_Large", [_x, _y, 0], [], 0, "NONE"];

};
