/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

if (!isServer) exitWith {};

private ["_RJSpawn","_RJGroupCenter","_RJGroup","_RJ_PlaneClass","_RJJet","_RJempty","_RJunit","_RJCrew","_RJTargets","_RJdist",
		 "_RJnearestTarget","_RJcheck","_RJDriver","_RJCommander","_WP1Pos","_WP2Pos","_WP3Pos","_WP4Pos","_RJWP1",
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

_RJPlaneName = getText(configFile >> "CfgVehicles" >> typeOf(_RJJet) >> "displayName");
format ["%1 Jet Spotted", _RJPlaneName] remoteExecCall ["systemChat",-2];

_RJCrew = fullCrew _RJJet;

		_WP1Pos = [_RJGroup] call critosJetWayPoints;
		_WP2Pos = [_RJGroup] call critosJetWayPoints;
		_WP3Pos = [_RJGroup] call critosJetWayPoints;
		_WP4Pos = [_RJGroup] call critosJetWayPoints;

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
		
		 if (count _RJCrew > 1) then
			{
				_RJDriver = driver _RJJet;
				_RJCommander = commander _RJJet;
				_RJDriver disableAI "AUTOCOMBAT";
				_RJDriver disableAI "AUTOTARGET";
				_RJDriver disableAI "TARGET";
				_RJCommander disableAI "AUTOCOMBAT";
				_RJCommander disableAI "AUTOTARGET";
				_RJCommander disableAI "TARGET";
			};
					
		if (count _RJCrew < 2) then
			{
				_RJDriver = driver _RJJet;
				_RJDriver disableAI "AUTOCOMBAT";
				_RJDriver disableAI "AUTOTARGET";
				_RJDriver disableAI "TARGET";
			};

while {alive _RJJet} do 
	{ 	
		 _RJLoopTime = time;
		 _RJTargets = (getPosATL _RJJet) nearEntities ["plane", RJSearchDist];
		 _RJdist = RJSearchDist;
		 _RJnearestTarget = objNull;
		 		 

		{
			_RJcheck = _x distance _RJJet;
			if((_RJcheck < _RJdist) && (side _x != EAST) && (speed _x >= 300) && !(typeof _x in RJBlacklist) && !(_x isKindof "Helicopter")) then
			{
				_RJdist = _RJcheck;
				_RJnearestTarget = _x;

				if (count _RJCrew > 1) then
					{
						_RJDriver doTarget _x;
						_RJCommander doTarget _x;
					};
							
				if (count _RJCrew < 2) then
					{
						_RJDriver doTarget _x;
					};
			};
		}count _RJTargets;
		waitUntil {time - _RJLoopTime >= 3};
	};

					{
						deleteVehicle _x;
					}foreach units _RJGroup;;
		
				RJ_liveJets = RJ_liveJets - 1;
				RJ_liveJetsArray = RJ_liveJetsArray - [_RJJet];
