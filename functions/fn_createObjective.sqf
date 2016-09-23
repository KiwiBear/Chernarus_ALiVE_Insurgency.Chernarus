/*
  Name: fn_createObjective.sqf
  Author: Lordmungus
  Description: Creates custom ALiVE OPCOM objectives at coordinates x, y. Solution derived from ALiVE wiki.

*/

params["_xcoord", "_ycoord","_i"];
/*
Parameters:

select 0: _id (String);
select 1: _position (Array);
select 2: _size (Integer);
select 3: _type (String of "MIL" or "CIV");
select 4: _priority (Integer);
*/

if (isServer) then
{
  {
    [_x, "addObjective", ["OPCOM_custom_" + str _i, [_xcoord, _ycoord, 0], 100, "CIV", 200] ] call ALiVE_fnc_OPCOM;
  } foreach OPCOM_INSTANCES;
};
