/*
  Name: introCamera.sqf
  Author: Hawke
  Description: Camera script for JIP.
*/

private ["_cam","_camx","_camy","_camz","_object"];
titleText ["Central Operations Network presents...", "BLACK IN",9999];

waituntil {!(isnull player)};

playMusic	"LeadTrack01a_F_EXP";

sleep 2;

_object = player;
_camx = getposATL player select 0;
_camy = getposATL player select 1;
_camz = getposATL player select 2;

_cam = "camera" CamCreate [_camx -700 ,_camy + 700,_camz+100];

_cam CamSetTarget player;
_cam CameraEffect ["Internal","Back"];
_cam CamCommit 0;

_cam camsetpos [_camx -15 ,_camy + 15,_camz+3];
_cam CamCommit 15;
sleep 5;

titleText [" C H E R N A R U S   I N S U R G E N C Y   |   A L i V E ", "BLACK IN",25];

sleep 15;

_cam CameraEffect ["Terminate","Back"];
CamDestroy _cam;
