/*
  Name: fn_getLogisticsPool.sqf
  Author: Lordmungus
  Description: Returns logistic pool count to client. Derived from BI ALiVE thread.
*/

params["_faction","_pool"];

_pool = [ALIVE_globalForcePool, _faction] call ALIVE_fnc_hashGet;
missionNamespace setVariable["GlobalForcePoolVariable", _pool, true];
diag_log format["Logistics pool of %1 read.", _faction];
