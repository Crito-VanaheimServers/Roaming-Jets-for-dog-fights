/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

if (!isServer) exitWith {};

private ["_RJ_PlaneClass","_RJSpawn","_RJJet","_RJJetKillRep"];

_RJ_PlaneClass = _this select 0;
_RJSpawn = _this select 1;

_RJJet = createVehicle [_RJ_PlaneClass, _RJSpawn, [], 0, "FLY"];

_RJJet engineOn true;

_RJJet lock 2;

_RJJet setFuel 1;

_RJJet setVehicleAmmo 1;

_RJJet flyInHeight 300;

_RJJetKillRep = missionNamespace getVariable "RJRespect";

_RJJet setVariable ["Critos_Jet_Respect",_RJJetKillRep];

_RJJet addMPEventHandler ["MPKilled",'if (isServer) then { _this call critosJetRespectPayout; }; '];

_RJJet