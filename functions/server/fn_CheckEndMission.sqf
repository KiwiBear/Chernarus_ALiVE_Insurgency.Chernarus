/*
  Name: fn_CheckEndMission.sqf
  Author: Hawke
  Description: Checks to see if all ammo caches have been destroyed, if so, BLUFOR win.

*/

if (isServer) then {
  _caches = missionNamespace getVariable "caches";
  If (count _caches = 0) then {
    //BLURFOR won
    "WestWin" call BIS_fnc_endMission;
  };
};
