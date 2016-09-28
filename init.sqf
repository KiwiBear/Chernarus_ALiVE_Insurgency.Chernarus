

missionNamespace setVariable ["markerIndex",0,true];

if(isServer) then
{
  // Distribute caches across the map.
  _null = [] execVM "scripts\initAmmoCaches.sqf";
}
else
{
  // Check whether Opfor players are respecting mission parameters.
  _null = [] execVM "scripts\opforPlayerCheck.sqf";
  waitUntil {scriptDone _null};

  _null = [] execVM "scripts\briefing.sqf";

  // Intro camera script.
	_null = [] execVM "scripts\introCamera.sqf";
};
