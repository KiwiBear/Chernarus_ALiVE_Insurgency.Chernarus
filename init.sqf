
if(isServer) then
{
  // Distribute caches across the map.
  [] call mongoose_fnc_ammoCacheCreator;
}
else
{
  // Check whether Opfor players are respecting mission parameters.
  [] call mongoose_fnc_opforPlayerCheck;
};
