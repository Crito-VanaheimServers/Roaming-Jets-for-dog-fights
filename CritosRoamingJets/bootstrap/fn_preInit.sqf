/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/
 
private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
	['critosRoamingJetsStart','CritosRoamingJets\code\critosRoamingJetsStart.sqf'],
	['critosRoamingJets','CritosRoamingJets\code\critosRoamingJets.sqf'],
	['critosRoamingJetsLogging','CritosRoamingJets\code\critosRoamingJetsLogging.sqf'],
	['critosJetSpawn','CritosRoamingJets\code\critosJetSpawn.sqf'],
	['critosFindSafePos','CritosRoamingJets\code\critosFindSafePos.sqf'],
	['critosAISpawn','CritosRoamingJets\code\critosAISpawn.sqf'],
	['critosJetWayPoints','CritosRoamingJets\code\critosJetWayPoints.sqf'],
	['critosJetRespectPayout','CritosRoamingJets\code\critosJetRespectPayout.sqf']
];

"PreInit finished" call critosRoamingJetsLogging;
