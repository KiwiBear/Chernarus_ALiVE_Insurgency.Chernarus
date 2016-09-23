/*
  Name: fn_ammoCacheCreator.sqf
  Author: Lordmungus
  Description: Spawns ammo caches in the beginning of the mission.

*/

_ammoCacheCount = "AmmoCacheCount" call BIS_fnc_getParamValue;

caches = [];

for "_i" from 1 to _ammoCacheCount do
{
  _x = (random 10000) + 2000;
  _y = (random 7000) + 4300;
  _cache = missionNamespace getVariable ("cache" + str _i);
  _cache setPosATL [_x, _y, 0];
  caches pushBack _cache;

  diag_log "Moved cache" + str _i + " to new location at x: " + str _x + ", y: " + str _y;
  // Create new ALiVE objective so that OPFOR commander can defend caches.
  [_x, _y, _i] call mongoose_fnc_createObjective;

  diag_log "Created new OPCOM objective at x: " + str _x + ", y: " + str _y;
};

publicVariable "caches";

// Delete remaining caches
if(_ammoCacheCount < 7) then
{
  for "_i" from (_ammoCacheCount + 1) to 7 do
  {
    _cache = missionNamespace getVariable ("cache" + str _i);
    deleteVehicle _cache;
    diag_log "cache" + str _i + " removed";
  };
};



/*
missionNamespace setVariable ["caches", caches, true];
diag_log "caches sent to missionNamespace";
*/
// Position debug
/*
_justPlayers = allPlayers - entities "HeadlessClient_F";

waitUntil {_justPlayers != 0};

(_justPlayers select 0) setPosATL getPosATL (caches select 0);
*/
