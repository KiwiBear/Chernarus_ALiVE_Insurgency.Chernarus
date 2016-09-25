/*
  Name: fn_getLogisticsPool.sqf
  Author: Lordmungus
  Description: Returns logistic pool count to client. Derived from BI ALiVE thread.
*/

params["_faction"];

if (isServer) then
{
  missionNamespace setVariable["GlobalForcePoolVariable", [ALIVE_globalForcePool, _faction] call ALIVE_fnc_hashGet, true];
  diag_log format["Logistics pool of %1 read.", _faction];
};
