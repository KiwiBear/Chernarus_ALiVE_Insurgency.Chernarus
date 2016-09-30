/*
  Name: fn_uavCacheFinder.sqf
  Author: Hawke
  Description: Has the chance to find a random cache location at a random distance.
*/

params["_drone"];

//To change the chance of being able to find a cache (Default: 50% chance)
_chance = 0.5;
_numMarkers = 0;
while{_drone getVariable "Active" && alive _drone} do {

	_caches = missionNamespace getVariable "caches";
	
	//Lets roll a dice
	if ((random 1) < _chance) then {
		//Lets get some data
		_box = selectRandom _caches;
		_markerindex = missionNamespace getVariable "markerIndex";
		_distance = (round ((random 13) +1)) * 100;
		
		//Lets create the marker
		_Mname = format["cacheMarker%1",_markerindex];
		_marker = createMarker [_Mname,[((((random (_distance / 2)) + (_distance / 2)) - (_distance / 2)) * 2) * (if(floor random 2 == 0) then { -1 } else { 1 }) + (position _box select 0), ((((random (_distance / 2)) + (_distance / 2)) - (_distance / 2)) * 2) * (if(floor random 2 == 0) then { -1 } else { 1 }) + (position _box select 1)]];
		missionNamespace setVariable ["markerIndex",(_markerindex + 1),true];
		_marker setMarkerType "hd_unknown";
		_marker setMarkerColor "ColorRed";
		_marker setMarkerShape "ICON";
		_marker setMarkerSize [0.5 , 0.5]; 
		_marker setMarkerAlpha 1;
		_marker setMarkerText str _distance;
		
		//Add the marker to the markers array for each cache
		_array = _box getVariable "Markers";
		_array pushBack _Mname;
		_box setVariable ["Markers",_array,true];
		_numMarkers = _numMarkers + 1;
		[_Mname] remoteExec ["mongoose_fnc_deleteMarker", east];
		
	};
	sleep 10;
};

if (_numMarkers > 0) then {
	_Message = format["HQ: HQ to all units, UAV drone operators have updated your maps with %1 possiable cache locations. HQ out.", _numMarkers];
	_Message remoteExec ["systemchat",west];
}else{
	_Message = "HQ: HQ to all units, UAV drone operators were unable to find any possiable cache locations. HQ out.";
	_Message remoteExec ["systemchat",west];
};
