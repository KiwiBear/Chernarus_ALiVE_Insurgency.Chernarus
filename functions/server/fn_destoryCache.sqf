/*
  Name: fn_destroyCache.sqf
  Author: Hawke
  Description: Checks what dammaged the cache,

*/

params ["_event"];

_box = _event select 0;
_source = _event select 4;

if(_source in ["SatchelCharge_Remote_Ammo", "SatchelCharge_Remote_Ammo_Scripted", "DemoCharge_Remote_Ammo_Scripted"]) then {
	
	//Remove distance markers
	{
		deleteMarker _x;
		false
	} count (_box getVariable ["Markers", []]);
	
	//Remove cache from list of caches
	_caches = missionNamespace getVariable "caches";
	_caches set [_caches find _box, -1];
	missionNamespace setVariable ["caches", _caches, true];
	
	_bomb = "Bo_GBU12_LGB" createVehicle getpos _box;
	_bomb setpos [(getpos _box select 0),(getpos _box select 1),2];
	_bomb setVelocity [0,0,-10];
	
	deleteVehicle _box;
	["CacheDestroyed",["Well done! A OPFOR weapons cache was destroyed!"]] call BIS_fnc_showNotification;


};