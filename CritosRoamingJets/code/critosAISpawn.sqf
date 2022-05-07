/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

if (!isServer) exitWith {};

private ["_RJGroup","_RJSpawn","_RJunit"];

_RJGroup = _this select 0;
_RJSpawn = _this select 1;

_RJunit = _RJGroup createUnit ["O_Soldier_unarmed_F", _RJSpawn, [], 0, "CAN_COLLIDE"];

_RJunit allowFleeing 0;
_RJunit setUnitPos "UP";
[_RJunit] joinSilent _RJGroup;

{_RJunit removeWeaponGlobal _x;} 	forEach (weapons _RJunit);
{_RJunit unlinkItem _x;} 			forEach (assignedItems _RJunit);
{_RJunit removeItem _x;} 			forEach (items _RJunit);
removeAllItemsWithMagazines 	_RJunit;
removeHeadgear 					_RJunit;
removeUniform 					_RJunit;
removeVest 						_RJunit;
removeBackpackGlobal 			_RJunit;

_RJunit setSkill ["aimingAccuracy", 0.50];
_RJunit setSkill ["aimingShake", 0.50];
_RJunit setSkill ["aimingSpeed", 0.50];
_RJunit setSkill ["endurance", 1.00];
_RJunit setSkill ["spotDistance", 0.01];
_RJunit setSkill ["spotTime", 0.01];
_RJunit setSkill ["courage", 1.00];
_RJunit setSkill ["reloadSpeed", 1.00];
_RJunit setSkill ["commanding", 1.00];
_RJunit setSkill ["general", 1.00];
_RJunit forceAddUniform "U_B_PilotCoveralls";
_RJunit addVest "V_RebreatherB";
_RJunit addHeadgear "H_PilotHelmetFighter_B";
_RJunit addWeapon "hgun_Rook40_F";
_RJunit addmagazines ["16Rnd_9x21_Mag",4];
_RJunit addBackpack "B_Parachute";

[_RJunit] joinSilent _RJGroup;

_RJunit