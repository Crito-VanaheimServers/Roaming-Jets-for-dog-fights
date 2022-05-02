/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

if (!isServer) exitWith {};

private ["_RJGroup","_jetwpPos"];

_RJGroup = _this select 0;

		while {(count (waypoints _RJGroup)) > 0} do 
		{
			deleteWaypoint ((waypoints _RJGroup) #0);
		};

_jetwpPos = [] call critosFindSafePos;
_jetwpPos set [2, 300];

_jetwpPos