/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

if (!isServer) exitWith {};

private ["_RJSpawn","_RJGroupCenter","_RJGroup","_RJ_PlaneClass","_RJJet","_RJempty","_RJunit","_RJCrew","_RJPreTargets","_RJdist",
		 "_RJElementsDelete","_RJTargets","_RJnearestTarget","_RJcheck","_RJDriver","_RJCommander","_WP1Pos","_WP2Pos","_WP3Pos","_WP4Pos","_RJWP1",
		 "_RJWP2","_RJWP3","_RJWP4","_RJPlaneName","_RJLoopTime"];


_RJGroupCenter = createCenter RJJetAISide;
_RJGroup = createGroup [RJJetAISide,true];

_RJSpawn = [] call critosFindSafePos;

_RJ_PlaneClass = selectRandom RJ_Plane;

_RJJet = [_RJ_PlaneClass,_RJSpawn] call critosJetSpawn;

			RJ_liveJets = RJ_liveJets + 1;
			RJ_liveJetsArray = RJ_liveJetsArray + [_RJJet];
		
_RJempty = [_RJ_PlaneClass, false] call BIS_fnc_crewCount;

for "_i" from 1 to _RJempty do
	{
		_RJunit = [_RJGroup,_RJSpawn] call critosAISpawn;
		
		_RJunit moveInAny _RJJet;	
	};

_RJGroup addVehicle _RJJet;

_RJGroup setCombatMode "BLUE";

_RJPlaneName = getText(configFile >> "CfgVehicles" >> typeOf(_RJJet) >> "displayName");
format ["%1 Jet Spotted", _RJPlaneName] remoteExecCall ["systemChat",-2];

_RJCrew = fullCrew _RJJet;

		_WP1Pos = [_RJGroup] call critosFindSafePos;
		_WP2Pos = [_RJGroup] call critosFindSafePos;
		_WP3Pos = [_RJGroup] call critosFindSafePos;
		_WP4Pos = [_RJGroup] call critosFindSafePos;

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

					{
						deleteVehicle _x;
					}foreach units _RJGroup;;
		
				RJ_liveJets = RJ_liveJets - 1;
				RJ_liveJetsArray = RJ_liveJetsArray - [_RJJet];
