/*
  Name: fn_prepareDrone.sqf
  Author: Lordmungus
  Description: Checks whether NATO faction is allowed to deploy drone for cache-hunting.
*/

private["_caller", "_currentBLUFORForcepool"];

_caller = _this select 1;

if(typeOf _caller != "CUP_B_US_Officer") exitWith { systemChat "Only the commander has this option!" };

if(typeOf _caller == "CUP_B_US_Officer") then
{
	// Request logistics pool count for CUP_B_US_Army and "public variable" the result
	["CUP_B_US_Army"] remoteExec ["server_fnc_getLogisticsPool", 2, false];

	//Waiting for server to update the pool
	sleep 0.1;

	_currentBLUFORForcepool = missionNamespace getVariable ["GlobalForcePoolVariable",-99999];

	if (_currentBLUFORForcepool != -99999) then {
		if(_currentBLUFORForcepool > 250) then
		{
			remoteExec ["server_fnc_requestDrone", 2, false];
			[-250, "CUP_B_US_Army"] remoteExec ["server_fnc_adjustLogisticsPool", 2, false];
			systemChat "Drone deployed!";
		}
		else
		{
			systemChat "NATO forcepool is under 250. Complete more sidetasks!";
		};
	}
	else
	{
		systemChat "ERROR! variable is not set. Check back later once all ALiVE modules are loaded.";
	};
};
