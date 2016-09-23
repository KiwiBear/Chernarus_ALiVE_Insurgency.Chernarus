/*
  Name: fn_adjustLogisticsPool.sqf
  Author: Lordmungus
  Description: Adjust side logistics pool of passed faction by passed quantity. Derived from the ALiVE wiki.
*/

params["_quantity", "_faction"];

if(isServer) then {

	      // example: get the global force pool count
        // _currentBLUFORForcepool = [ALIVE_globalForcePool, _faction] call ALIVE_fnc_hashGet;

        // example: alter the current force pool
        [ALIVE_globalForcePool, _faction, _quantity] call ALIVE_fnc_hashSet;

};
