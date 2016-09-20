_justPlayers = allPlayers - entities "HeadlessClient_F";
_westCount = 0;
_eastCount = 0;

{
  if(side _x == west) then
  {
    _westCount = _westCount + 1;
  };
  if(side _x == east) then
  {
    _eastCount = _eastCount + 1;
  };
} forEach _justPlayers;

if(_westCount / _eastCount < 5  && side player == east) then {
  ["tooManyOpfor", false, true] call BIS_fnc_endMission;
};
