/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

if (!isServer) exitWith {};

private ["_RJmapCenterPos","_RJminCenter","_RJmaxCenter","_RJmindistCenter","_RJwaterSetting","_RJshoreSetting","_RJcenter"];

_RJmapCenterPos =[worldSize/2,worldSize/2,0];
_RJminCenter = 1; 
_RJmaxCenter = sqrt 2 / 2 * worldSize; 
_RJmindistCenter = 0; 
_RJwaterSetting = 1; 
_RJshoreSetting = 0;
_RJcenter = [_RJmapCenterPos,_RJminCenter,_RJmaxCenter,_RJmindistCenter,_RJwaterSetting,1,_RJshoreSetting] call BIS_fnc_findSafePos;

_RJcenter