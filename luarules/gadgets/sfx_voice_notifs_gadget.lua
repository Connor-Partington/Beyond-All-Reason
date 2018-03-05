--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function gadget:GetInfo()
    return {
        name      = "Voice Notifs",
        desc      = "Plays various voice notifications",
        author    = "Doo",
        date      = "2018",
        license   = "GNU GPL, v2 or later",
        version   = 1,
        layer     = 5,
        enabled   = false  --  loaded by default?
    }
end

if gadgetHandler:IsSyncedCode() then

	armnuke = WeaponDefNames["armsilo_nuclear_missile"].id
	cornuke = WeaponDefNames["corsilo_crblmssl"].id
	
function gadget:Initialize()
	Script.SetWatchWeapon(armnuke, true)
	Script.SetWatchWeapon(cornuke, true)
end



function GetAllyTeamID(teamID)
	local _,_,_,_,_,allyTeamID = Spring.GetTeamInfo(teamID)
	return allyTeamID
end

function GetPlayerTeamID(playerID)
	local _,_,_,_,allyTeam = Spring.GetPlayerInfo(id)
	return allyTeam
end

function AllPlayers()
	local players = Spring.GetPlayerList()
	for ct, id in pairs(players) do	
	local _,_,spectate = Spring.GetPlayerInfo(id)
		if spectate == true then players[ct] = nil end
	end
	return players
end

function AllUsers()
	local players = Spring.GetPlayerList()
	return players
end

function PlayersInAllyTeamID(allyTeamID)
	local players = AllPlayers()
	for ct, id in pairs(players) do
		local _,_,_,_,allyTeam = Spring.GetPlayerInfo(id)
		if allyTeam ~= allyTeamID then players[ct] = nil end
	end
	return players
end

function AllButAllyTeamID(allyTeamID)
	local players = AllPlayers()
	for ct, id in pairs(players) do
		local _,_,_,_,allyTeam = Spring.GetPlayerInfo(id)
		if allyTeam == allyTeamID then players[ct] = nil end
	end
	return players
end

function PlayersInTeamID(teamID)
	local players = Spring.GetPlayerList(teamID)
	return players
end	

-- UNITS RECEIVED send to all in team
	function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
		local event = "UnitsReceived"
		local players = PlayersInTeamID(newTeam)
		for ct, player in pairs (players) do
			if tostring(player) then
			SendToUnsynced("EventBroadcast", event, tostring(player))
			end
		end
	end
	
-- NUKE LAUNCH send to all but ally team
	function gadget:ProjectileCreated(proID, proOwnerID, weaponDefID)
		if Spring.GetProjectileDefID(proID) == armnuke or Spring.GetProjectileDefID(proID) == cornuke then
			local event = "NukeLaunched"
			local players = AllButAllyTeamID(GetAllyTeamID(Spring.GetUnitTeam(proOwnerID)))
			for ct, player in pairs (players) do
			if tostring(player) then
			SendToUnsynced("EventBroadcast", event, tostring(player))
			end
			end
		end
	end
	
-- Idle Builder send to all in team
	function gadget:UnitIdle(unitID)
		local defs = UnitDefs[Spring.GetUnitDefID(unitID)]
		if defs.isBuilder then
			local event = "IdleBuilder"
			local players = PlayersInTeamID(Spring.GetUnitTeam(unitID))
			for ct, player in pairs (players) do
			if tostring(player) then
			SendToUnsynced("EventBroadcast", event, tostring(player))
			end
			end
		end
	end
	
-- Unit Lost send to all in team
	function gadget:UnitDestroyed(unitID)
		local event = "UnitLost"
		local players =  PlayersInTeamID(Spring.GetUnitTeam(unitID))
		for ct, player in pairs (players) do
			if tostring(player) then
			SendToUnsynced("EventBroadcast", event, tostring(player))
			end
		end
	end
	
-- Game paused send to all
	function gadget:GamePaused()
		local event = "GamePause"
		local players = AllPlayers()
		for ct, player in pairs (players) do
			if tostring(player) then
			SendToUnsynced("EventBroadcast", event, tostring(player))
			end
		end
	end

--Game started send to all
	function gadget:GameStart()
		local event = "GameStarted"
		local players = AllPlayers()
		for ct, player in pairs (players) do
			if tostring(player) then
			SendToUnsynced("EventBroadcast", event, tostring(player))
			end
		end
	end
	
--Player left send to all in allyteam
	function gadget:PlayerRemoved(playerID, reason)
		local event = "PlayerLeft"
		local players = PlayersInAllyTeamID(GetPlayerTeamID(playerID))
		for ct, player in pairs (players) do
			if tostring(player) then
			SendToUnsynced("EventBroadcast", event, tostring(player))
			end
		end
	end
	
else

	function gadget:Initialize()
		gadgetHandler:AddSyncAction("EventBroadcast", BroadcastEvent)
	end

	function BroadcastEvent(_,event, player)
	    if Script.LuaUI("EventBroadcast") and tonumber(player) and tonumer(player) == Spring.GetMyPlayerID() then
			Script.LuaUI.EventBroadcast("SoundEvents "..event.." "..player)
		end
	end

end
