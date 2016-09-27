
if(isServer) then
{
  // Distribute caches across the map.
  _null = [] execVM "scripts\ammoCacheCreator.sqf";
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
