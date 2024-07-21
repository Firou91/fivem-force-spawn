-- Variables (player, player name, ped, model and spawn coordinates)
local player = PlayerId()
local playerName = GetPlayerName(player)
local ped = PlayerPedId()
local model = 'mp_m_freemode_01'
local spawnCoords = vector3(24.38, -1345.23, 28.5)

-- Wait until the player is active
RequestModel(model)
while not HasModelLoaded(model) do
    print("Loading model: " .. model .. " for player ^4" .. playerName .. "^7")
    Wait(10)
end

-- If the model does not exist, display an error message
if not DoesEntityExist(ped) then
    print("Failed to load model: " .. model .. " for player ^4" .. playerName .. "^7")
    return
end

print("Model loaded: " .. model .. " for player ^4" .. playerName .. "^7")

-- Apply the model to the player
SetPlayerModel(player, model)
SetPedDefaultComponentVariation(PlayerPedId()) -- Can't call "ped", it does not show the ped model
NetworkResurrectLocalPlayer(spawnCoords.x, spawnCoords.y, spawnCoords.z, true, true, false)

-- Place player at spawn coordinates
SetEntityCoordsNoOffset(ped, spawnCoords.x, spawnCoords.y, spawnCoords.z, true, true, true)

-- Delete the player's current tasks
ClearPedTasksImmediately(ped)

-- Unlock the player's position so he can move around
FreezeEntityPosition(PlayerPedId(-1), false)

-- Clear player search level
ClearPlayerWantedLevel(PlayerId(-1))

-- Close the game loading screen
ShutdownLoadingScreen()

-- Close the loading screen user interface
ShutdownLoadingScreenNui()