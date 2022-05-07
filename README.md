# Roaming-Jets-for-dog-fights
Usage: change settings to your liking in config.sqf and then make the CritosRoamingJets folder into a pbo and drop into
@ExileServer\addons folder of your server.

New improved drop and play pbo for exile servers that spawns in roaming jets. Added setting in config, You can now set a max number
of jets to have on the map at one time. Got rid of min and max spawn times there is one spawn time and that is time in seconds between
each jet spawn until it reaches the max jet amount. Waypoints have changed, It is scripted to get your map size and generate waypoints randomly.
Fixed issue with not being able to use modded jets now you can use any jet 1 or 2 seats and modded Jets. Fixed the Bug of the jets sometimes
shooting each other and targeting players in helicopters. They no longer target helicopters or each other. Planes that cannot fight jets are
Blacklisted in config to be ignored by the AI jets. You can add to the Blacklist if you have planes you don't want the AI jets attacking.
Jets do not attack ground units. There is also a % chance setting for a loot crate to spawn on exposion of AI jet that is shot and destroyed
and will parachute to ground displaying chordinates in chat channel. These chordinates are as it spawns so they change slightly as it falls to
ground but that makes players have to hunt them and not find them so easily. So in a nutshell your players in helicopters and planes that are
blacklisted are safe from attack and this makes it nice for the players who like to fly jets to dog fight other jets.

5/7/2022:
Fixed issue found when players are dog fighting jets and another player was close by in a helicopter the jet would also target the helecopter 
due to having the enemy jets change combat modes. All combat mode changes were removed and recoded to force the enemy jet only target the nearest
plane to its location and nothing else. This allows players to dog fight anywhere and other players to not have to worry about getting attacked 
while dog fight is in process if they are in a heli or on ground. These jets should not target anything but a player plane no matter what unless
planes are not blacklisted in config than it target a plane any plane. This Version also has respect payout fix where players respect was getting
reset.
