//waitUntil {!isNil "ALIVE_profileSystemInit"};

if(isServer) then
{
  waitUntil {!isNil "ALIVE_profileSystemInit"};
  [] call mongoose_fnc_ammoCacheCreator;
}
else
{
  // Check whether Opfor players are respecting mission parameters.
  [] call mongoose_fnc_opforPlayerCheck;
}
