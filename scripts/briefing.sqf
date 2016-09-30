/*
  Name: briefing.sqf
  Author: Lordmungus
  Description: Ummm briefing.... pretty self-explanatory
*/

if(side player == west) then
{
  _cre = player createDiaryRecord ["diary", ["Credits","
  Made for Central Operations Network by Lordmungus and Hawke.
  "]];

  _exe = player createDiaryRecord ["diary", ["Execution","
  <font size='18'>SPECIAL TASKS</font>
  <br/>
  Complete side-objectives to raise the force pool for NATO. 500 points is the minimum requirement for requesting a UAV.
  <br/>
  Side objectives are ALiVE generated and comprise of a variety of different combat situations.
  "]];
  _mis = player createDiaryRecord ["diary", ["Mission","
  Locate and destroy all insurgent ammo-caches.
  "]];

  _sit = player createDiaryRecord ["diary", ["Situation","
  <marker name = 'respawn_west'>Camp Poseidon</marker> is the NATO taskforce's last military installation still standing after a brutal nation-wide uprising.
  <br/><br/>
  <font size='18'>ENEMY FORCES</font>
  <br/>
  ChDKZ forces are dispersed all over Chernarus. Insurgents are armed with AA launchers.
  "]];
};
