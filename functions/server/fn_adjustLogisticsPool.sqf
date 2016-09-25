/*
  Name: fn_adjustLogisticsPool.sqf
  Author: Lordmungus
  Description: Adjust side logistics pool of passed faction by passed quantity. Derived from the ALiVE wiki.
*/

params["_quantity", "_faction"];

if(isServer) then
{
  [ALIVE_globalForcePool, _faction, _quantity] call ALIVE_fnc_hashSet;
  diag_log format["Logistics pool of %1 altered by %2.", _faction, _quantity];
};
