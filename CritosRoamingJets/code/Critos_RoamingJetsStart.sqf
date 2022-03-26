/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.3 3/26/2022
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
						"Spawning Jet" call Critos_Roaming_Jets_Logging;
						[]spawn Critos_RoamingJets;
						missionNamespace setVariable [_RJJetSpawnedAt, time];
					};
				};