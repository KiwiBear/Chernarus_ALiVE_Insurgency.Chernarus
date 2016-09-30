/*
  Name: fn_adjustLogisticsPool.sqf
  Author: Lordmungus
  Description: Adjust side logistics pool of passed faction by passed quantity. Derived from the ALiVE wiki.
*/

params["_quantity", "_faction"];

[ALIVE_globalForcePool, _faction, _quantity] call ALIVE_fnc_hashSet;
// Log changes to different mediums
_message = format["Logistics pool altered by %1.", _quantity];
_message remoteExec ["systemchat", west];
diag_log _message;
