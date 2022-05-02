/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/
if (!isServer) exitWith {};

call compile preprocessFileLineNumbers "CritosRoamingJets\config.sqf";
	
RJ_liveJets	 				= 0;
RJ_liveJetsArray       		= [];

publicVariable "RJ_liveJets";
publicVariable "RJ_liveJetsArray";

missionNamespace setVariable [format ["LastJetSpawnedAt"], 0];

	[120, critosRoamingJetsStart, [], true] call ExileServer_system_thread_addtask;

"PostInit finished" call critosRoamingJetsLogging;