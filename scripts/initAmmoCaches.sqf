/*
  Name: initAmmoCaches.sqf
  Author: Lordmungus
  Description: Deals ammo caches in the beginning of the mission.
*/

private["_x", "_y", "_xBuilding", "_yBuilding"];

diag_log "Initialising ammo-caches...";

waitUntil { sleep 1; !isNil "OPCOM_INSTANCES"; };

_ammoCacheCount = "AmmoCacheCount" call BIS_fnc_getParamValue;

caches = [];

for "_i" from 1 to _ammoCacheCount do
{

  _x = 0;
  _y = 0;
  _xBuilding = 0;
  _yBuilding = 0;

  while{(abs (_x - _xBuilding) < 50) || (abs (_y - _yBuilding) < 50)} do
  {
    _x = (random 10000) + 2000;
    _y = (random 7000) + 4300;
    _nearestBuilding = nearestBuilding [_x, _y];
    _xBuilding = getPosATL _nearestBuilding select 0;
    _yBuilding = getPosATL _nearestBuilding select 1;
  };

  _cache = missionNamespace getVariable ("cache" + str _i);
  _cache setPosATL [_x, _y, 0];
  _cache setVariable ["Markers",[],true];
  caches pushBack _cache;
  
  _cache addEventHandler ["HandleDamage",{_this call server_fnc_destroyCache}];
  

  diag_log format["Moved cache no. %1 to new location at x: %2, y: %3", _i, _x, _y];

  // Create new ALiVE objective so that OPFOR commander can defend caches.

  [["obj_" + str _i, [_x, _y, 0], 100,"CIV"],["EAST"]] call server_fnc_createObjective;

  diag_log format["Created new OPCOM objective at x: %1, y: %2", _x, _y];
};

missionNamespace setVariable ["caches", caches, true];

// Delete remaining caches
if(_ammoCacheCount < 7) then
{
  for "_i" from (_ammoCacheCount + 1) to 7 do
  {
    _cache = missionNamespace getVariable ("cache" + str _i);
    deleteVehicle _cache;
    diag_log format["Cache no. %1 removed", _i];
  };
};

diag_log "Ammo-cache init complete!";
