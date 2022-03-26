/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.3 3/26/2022
*/

if (!isServer) exitWith {};

private ["_RJmapCenterPos","_RJminCenter","_RJmaxCenter","_RJmindistCenter","_RJwaterSetting","_RJshoreSetting","_RJcenter","_RJSpawn",
		 "_RJGroupCenter","_RJGroup","_RJ_PlaneClass","_RJJet","_RJempty","_RJunit","_RJCrew","_RJPreTargets","_RJdist","_RJElementsDelete",
		 "_RJTargets","_RJnearestTarget","_RJcheck","_RJDriver","_RJCommander","_WP1Pos","_WP2Pos","_WP3Pos","_WP4Pos","_RJWP1",
		 "_RJWP2","_RJWP3","_RJWP4","_RJprizepos","_RJprize","_RJChute","_RJsmoke","_RJflare","_RJStrobe","_RJprizecash","_RJGuns","_RJmagazines",
		 "_RJitems","_RJPlaneName","_RJLoopTime","_RJKiller","_RJRespect","_RJUid","_RJOldScore","_RJNewScore","_RJMessage","_RJcoords"];

_RJmapCenterPos =[worldSize/2,worldSize/2,0];
_RJminCenter = 1; 
_RJmaxCenter = sqrt 2 / 2 * worldSize; 
_RJmindistCenter = 0; 
_RJwaterSetting = 1; 
_RJshoreSetting = 0;
_RJcenter = [_RJmapCenterPos,_RJminCenter,_RJmaxCenter,_RJmindistCenter,_RJwaterSetting,1,_RJshoreSetting] call BIS_fnc_findSafePos;
_RJSpawn = _RJcenter; 

_RJGroupCenter = createCenter RJJetAISide;
_RJGroup = createGroup RJJetAISide;

_RJ_PlaneClass = selectRandom RJ_Plane;

_RJJet = createVehicle [_RJ_PlaneClass, _RJSpawn, [], 0, "FLY"];

			RJ_liveJets = RJ_liveJets + 1;
			RJ_liveJetsArray = RJ_liveJetsArray + [_RJJet];
	
_RJGroup addVehicle _RJJet;

_RJGroup setCombatMode "BLUE";

_RJJet engineOn true;

_RJJet lock 2;

_RJJet setFuel 1;

_RJJet setVehicleAmmo 1;

_RJJet flyInHeight 300;

_RJempty = [_RJ_PlaneClass, false] call BIS_fnc_crewCount;

for "_i" from 1 to _RJempty do
	{
		_RJunit = _RJGroup createUnit ["O_Soldier_unarmed_F", _RJSpawn, [], 0, "CAN_COLLIDE"];
		_RJunit moveInAny _RJJet;
		
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
		_RJunit setBehaviour "CARELESS";		 
		_RJunit disableAI "AUTOCOMBAT";
		_RJunit disableAI "AUTOTARGET";
		_RJunit disableAI "TARGET";
	};

_RJPlaneName = getText(configFile >> "CfgVehicles" >> typeOf(_RJJet) >> "displayName");
format ["%1 Jet Spotted", _RJPlaneName] remoteExecCall ["systemChat",-2];

_RJCrew = fullCrew _RJJet;

		while {(count (waypoints _RJGroup)) > 0} do 
		{
			deleteWaypoint ((waypoints _RJGroup) #0);
		};

		_WP1Pos = [_RJmapCenterPos,_RJminCenter,_RJmaxCenter,_RJmindistCenter,_RJwaterSetting,1,_RJshoreSetting] call BIS_fnc_findSafePos;
		_WP1Pos set [2, 300];

		_WP2Pos = [_RJmapCenterPos,_RJminCenter,_RJmaxCenter,_RJmindistCenter,_RJwaterSetting,1,_RJshoreSetting] call BIS_fnc_findSafePos;
		_WP2Pos set [2, 300];

		_WP3Pos = [_RJmapCenterPos,_RJminCenter,_RJmaxCenter,_RJmindistCenter,_RJwaterSetting,1,_RJshoreSetting] call BIS_fnc_findSafePos;
		_WP3Pos set [2, 300];

		_WP4Pos = [_RJmapCenterPos,_RJminCenter,_RJmaxCenter,_RJmindistCenter,_RJwaterSetting,1,_RJshoreSetting] call BIS_fnc_findSafePos;
		_WP4Pos set [2, 300];

		_RJWP1 = _RJGroup addWaypoint [_WP1Pos, 1];
		_RJWP1 setWaypointSpeed "FULL";
		_RJWP1 setWaypointType "MOVE";
			
		_RJWP2 = _RJGroup addWaypoint [_WP2Pos, 1];
		_RJWP2 setWaypointSpeed "FULL";
		_RJWP2 setWaypointType "MOVE";
		
		_RJWP3 = _RJGroup addWaypoint [_WP3Pos, 1];
		_RJWP3 setWaypointSpeed "FULL";
		_RJWP3 setWaypointType "MOVE";
			
		_RJWP4 = _RJGroup addWaypoint [_WP4Pos, 1];
		_RJWP4 setWaypointSpeed "FULL";
		_RJWP4 setWaypointType "CYCLE";
		
_RJJet addEventHandler ["Killed", {
_RJJet = _this select 0;
_RJKiller = vehicle (_this select 1);

_RJRespect = RJRespect; 

if(isplayer _RJKiller)then
{
    _RJUid = getPlayerUID _RJKiller;
	_RJOldScore = format ["getAccountScore:%1", _RJUid] call ExileServer_system_database_query_selectSingle;
    _RJNewScore = _RJOldScore select 0;
	_RJNewScore = _RJNewScore + _RJRespect;
    _RJKiller setVariable ["ExileScore", _RJNewScore];
    ExileClientPlayerScore = _RJNewScore;
	(owner _RJKiller) publicVariableClient "ExileClientPlayerScore";
	ExileClientPlayerScore = nil;
	format["setAccountScore:%1:%2", _RJNewScore, getPlayerUID _RJKiller] call ExileServer_system_database_query_fireAndForget;
	_RJMessage = ["SuccessTitleOnly",[format ["Gained %1 respect for killing jet!", _RJRespect]]];
	[_RJKiller, "toastRequest", _RJMessage] call ExileServer_system_network_send_to;
	
	if (RJprizechance >= (random 100)) then
	{
		_RJprizepos = _RJJet modelToWorld [0,0,25];
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
			{
				deleteVehicle _x;
			}foreach units _RJGroup;
	
				RJ_liveJets = RJ_liveJets - 1;
				RJ_liveJetsArray = RJ_liveJetsArray - [_RJJet];
}
];

while {alive _RJJet} do 
	{ 	
		 _RJLoopTime = time;
		 _RJPreTargets = (getPosATL _RJJet) nearEntities ["plane", RJSearchDist];
		 _RJdist = RJSearchDist;
		 _RJElementsDelete = [_RJJet];
		 _RJTargets = _RJPreTargets - _RJElementsDelete;
		 _RJnearestTarget = objNull;
		 _RJGroup setCombatMode "BLUE";
		 		 
		 if (count _RJCrew > 1) then
			{
				_RJDriver = driver _RJJet;
				_RJCommander = commander _RJJet;
				_RJDriver setBehaviour "CARELESS";
				_RJDriver disableAI "AUTOCOMBAT";
				_RJDriver disableAI "AUTOTARGET";
				_RJDriver disableAI "TARGET";
				_RJCommander setBehaviour "CARELESS";
				_RJCommander disableAI "AUTOCOMBAT";
				_RJCommander disableAI "AUTOTARGET";
				_RJCommander disableAI "TARGET";
			};
					
		if (count _RJCrew < 2) then
			{
				_RJDriver = driver _RJJet;
				_RJDriver setBehaviour "CARELESS";
				_RJDriver disableAI "AUTOCOMBAT";
				_RJDriver disableAI "AUTOTARGET";
				_RJDriver disableAI "TARGET";
			};

		{
			_RJcheck = _x distance _RJJet;
			if((_RJcheck < _RJdist) && (side _x != EAST) && (speed _x >= 300) && !(typeof _x in RJBlacklist) && !(_x isKindof "Helicopter")) then
			{
				_RJdist = _RJcheck;
				_RJnearestTarget = _x;
				_RJGroup setCombatMode "RED";

				if (count _RJCrew > 1) then
					{
						_RJDriver = driver _RJJet;
						_RJCommander = commander _RJJet;
						_RJDriver setBehaviour "SAFE";
						_RJDriver enableAI "AUTOCOMBAT";
						_RJDriver enableAI "AUTOTARGET";
						_RJDriver enableAI "TARGET";
						_RJCommander setBehaviour "SAFE";
						_RJCommander enableAI "AUTOCOMBAT";
						_RJCommander enableAI "AUTOTARGET";
						_RJCommander enableAI "TARGET";
						_RJDriver doTarget _RJnearestTarget;
						_RJCommander doTarget _RJnearestTarget;
						_RJDriver doFire _RJnearestTarget;
						_RJCommander doFire _RJnearestTarget;
					};
					
				if (count _RJCrew < 2) then
					{
						_RJDriver = driver _RJJet;
						_RJDriver setBehaviour "SAFE";
						_RJDriver enableAI "AUTOCOMBAT";
						_RJDriver enableAI "AUTOTARGET";
						_RJDriver enableAI "TARGET";
						_RJDriver doFire _RJnearestTarget;
						_RJDriver doTarget _RJnearestTarget;
					};
			};
		}count _RJTargets;
		waitUntil {time - _RJLoopTime >= 10};
	};