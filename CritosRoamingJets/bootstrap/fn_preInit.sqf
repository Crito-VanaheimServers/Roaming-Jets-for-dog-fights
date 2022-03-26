/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.3 3/26/2022
*/
 
private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
	['Critos_RoamingJetsStart','CritosRoamingJets\code\Critos_RoamingJetsStart.sqf'],
	['Critos_RoamingJets','CritosRoamingJets\code\Critos_RoamingJets.sqf'],
	['Critos_Roaming_Jets_Logging','CritosRoamingJets\code\Critos_Roaming_Jets_Logging.sqf']
];

"PreInit finished" call Critos_Roaming_Jets_Logging;
