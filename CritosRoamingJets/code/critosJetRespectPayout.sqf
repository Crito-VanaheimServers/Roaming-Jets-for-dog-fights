/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

private ["_RJVictim","_RJKiller","_RJInstigator","_InstigatorUID","_RJKillerRespect","_RJKillMSG","_RJprizepos","_RJcoords","_RJprize","_RJChute",
		 "_RJsmoke","_RJflare","_RJStrobe","_RJprizecash","_RJGuns","_RJmagazines","_RJitems","_RJRepIncrease"];

_RJvictim = _this select 0;
_RJInstigator = _this select 2;
_InstigatorUID = getPlayerUID _RJInstigator;

if ((!isNull _RJInstigator) && (isplayer _RJInstigator)) then
	{
		_RJRepIncrease = _RJVictim getVariable "Critos_Jet_Respect";
		_RJKillerRespect = _RJInstigator getVariable ["ExileScore", 0];
		_RJKillMSG = [[format ["Enemy Jet Down!"],_RJRepIncrease]];
		_RJKillerRespect = _RJKillerRespect + _RJRepIncrease;
		_RJInstigator setVariable ["ExileScore",_RJKillerRespect];
		[_RJInstigator, "showFragRequest", [_RJKillMSG]] call ExileServer_system_network_send_to;
		format["setAccountScore:%1:%2", _RJKillerRespect, _InstigatorUID] call ExileServer_system_database_query_fireAndForget;
		ExileClientPlayerScore = _RJKillerRespect;
		(owner _RJInstigator) publicVariableClient "ExileClientPlayerScore";
		ExileClientPlayerScore = nil;
		
		if (RJprizechance >= (random 100)) then
			{
				_RJprizepos = _RJVictim modelToWorld [0,0,25];
				_RJcoords = mapGridPosition _RJprizepos;
				_RJprize = createVehicle ["Box_IND_Wps_F",_RJprizepos,[], 0, "CAN_COLLIDE"];
				_RJprize setObjectTextureGlobal [0,"#(rgb,8,8,3)color(1,0.08,0.57,1)"];
				_RJprize setObjectTextureGlobal [1,"#(rgb,8,8,3)color(1,0.08,0.57,1)"];
				format["ENEMY JET DOWN!: Loot spotted parachuting at location %1", _RJcoords] remoteExecCall ["systemChat",-2];
		
					_RJChute = createVehicle ["B_Parachute_02_F", _RJprizepos, [], 0, ""];
					_RJprize attachTo [_RJChute,[0,0,0]];
					_RJsmoke= "SmokeShellRed" createVehicle position _RJprize;
					_RJsmoke attachto [_RJprize,[0,0,0]];
					_RJflare= "F_40mm_White" createVehicle position _RJprize;
					_RJflare attachto [_RJprize,[0,0,0]];
					_RJStrobe = "I_IRStrobe" createVehicle position _RJprize;
					_RJStrobe attachto [_RJprize,[0,0,.15]];
		
					_RJprizecash = floor (random RJcash);	
					
					clearMagazineCargoGlobal _RJprize;
					clearWeaponCargoGlobal _RJprize;
					clearItemCargoGlobal _RJprize;
					clearBackpackCargoGlobal _RJprize;
				
					for "_i" from 1 to RJgunsAmount do
					{
						_RJGuns = RJLootGuns call BIS_fnc_selectRandom;
						_RJprize addWeaponCargoGlobal [_RJGuns,1];
						_RJmagazines = getArray (configFile >> "CfgWeapons" >> _RJGuns >> "magazines");
						_RJprize addMagazineCargoGlobal [(_RJmagazines select 0),round random 4];
					};
					
					for "_i" from 1 to RJitemAmount do
					{
						_RJitems = RJLootItems call BIS_fnc_selectRandom;
						_RJprize addItemCargoGlobal [_RJitems,1];
					};
			
					_RJprize setVariable ["ExileMoney",_RJprizecash,true];
			};
	};