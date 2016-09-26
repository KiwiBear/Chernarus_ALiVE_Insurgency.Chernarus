/*
  Name: fn_requestDrone.sqf
  Author: Lordmungus
  Description: Spawns drone on NATO side. Derived from KKblog's uav camera script.
*/
diag_log "Function called";
if(isServer) then
{
diag_log "UAV should be spawned";
  _uav = createVehicle ["B_UAV_02_F", [12301, 13196, 500], [], 0, "FLY"];
  createVehicleCrew _uav;
  _uav flyInHeight 500;

  _wp = group _uav addWaypoint [[11445, 11360, 500], 0];
  _wp setWaypointType "LOITER";
  _wp setWaypointLoiterType "CIRCLE_L";
  _wp setWaypointLoiterRadius 500;

  sleep 60;
  deleteVehicle _uav;

};
