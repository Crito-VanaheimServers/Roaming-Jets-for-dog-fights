/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

private["_RJJetSpawnedAt","_RJSpawnTime","_RJlastSpawnedAt"];

RJ_liveJets = count(RJ_liveJetsArray);
		
			if (RJ_liveJets < RJMaxJets) then
				{
					_RJJetSpawnedAt = format ["LastJetSpawnedAt"];
					_RJSpawnTime = RJSpawnTime;
					_RJlastSpawnedAt = missionNamespace getVariable [_RJJetSpawnedAt, 0];

					if (time - _RJlastSpawnedAt >= _RJSpawnTime) then
					{
						"Spawning Jet" call critosRoamingJetsLogging;
						[]spawn critosRoamingJets;
						missionNamespace setVariable [_RJJetSpawnedAt, time];
					};
				};